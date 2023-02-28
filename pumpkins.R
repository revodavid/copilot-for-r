library(tidyverse)

# read in the pumpkin data
pumpkins_all <- read_csv("US-pumpkins.csv")
names(pumpkins_all)

# clean up column names
library(janitor)
pumpkins_all <- pumpkins_all %>% clean_names(case = "upper_camel")
names(pumpkins_all)

# get an overview of the data
glimpse(pumpkins_all)

# select rows without any missing values
pumpkins_all <- pumpkins_all %>% filter(!is.na(`Low Price`), !is.na(`High Price`), !is.na(Date))


# take a look at the first 5 rows
head(pumpkins_all)

# count the number of NAs in each column
colSums(is.na(pumpkins_all))

#extract columns for analysis
pumpkins <- pumpkins_all %>% select(Package, `Low Price`, `High Price`, Date)
head(pumpkins)

# extract months from Date column
library(lubridate)

# convert Date column to date format
pumpkins <- pumpkins %>% mutate(Date = mdy(Date))

# extract month from Date column
pumpkins <- pumpkins %>% mutate(month = month(Date))
head(pumpkins)

# add a column for the average price
pumpkins <- pumpkins %>% mutate(avg_price = (pumpkins$`Low Price` + pumpkins$`High Price`)/2)   
head(pumpkins)

# create a table of Package counts
pumpkins %>% count(Package)

# filter rows where "bushel" is detected in the Packages column
pumpkin_bushel <- pumpkins %>% filter(grepl("bushel", Package))
glimpse(pumpkin_bushel)
nrow(pumpkin_bushel)
pumpkin_bushel %>% count(Package)

# calculate price per bushel
pumpkin_bushel <- pumpkin_bushel %>% mutate(
    price_per_bushel = case_when(
        str_detect(Package, "1 1/9 bushel") ~ avg_price/(1+1/19),
        str_detect(Package, "1/2 bushel") ~ avg_price*2,
        .default = avg_price))
head(pumpkin_bushel)

# display a table of average price per bushel by month
pumpkin_bushel %>% 
    group_by(month) %>% 
    summarise(avg_price = mean(price_per_bushel))

# create a bar chart of average price per bushel by month
pumpkin_bushel %>% 
    group_by(month) %>% 
    summarise(avg_price = mean(price_per_bushel)) %>%
    ggplot(aes(x = month, y = avg_price)) +
    geom_col() +
    labs(x = "Month", y = "Average Price per Bushel", title = "Average Price per Bushel by Month")


# create a bar chart of average price per bushel by month and package
pumpkin_bushel %>% 
    group_by(month, Package) %>% 
    summarise(avg_price = mean(price_per_bushel)) %>%
    ggplot(aes(x = month, y = avg_price, fill = Package)) +
    geom_col() +
    labs(x = "Month", y = "Average Price per Bushel", title = "Average Price per Bushel by Month and Package")
