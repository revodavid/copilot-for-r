library(tidyverse)

# read in the pumpkins data
pumpkins <- read_csv("US-pumpkins.csv")
names(pumpkins)

# clean up colummn names
library(janitor)
pumpkins <- clean_names(pumpkins)
names(pumpkins)

# display an overview of the data
glimpse(pumpkins)

# display 5 random rows
pumpkins %>% sample_n(5)

# filter rows where "bushel" is found in the package column
pumpkins %>% filter(str_detect(package, "bushel")) -> pumpkins

# create a table of counts by item_size and color
pumpkins %>% count(item_size, color)

# calculate high price per bushel as column ppb using package column
pumpkins %>% mutate(ppb = high_price / case_when(
    str_detect(package, "bushel") ~ 1,
    str_detect(package, "1/2") ~ 1/2,
    str_detect(package, "1/4") ~ 1/4,
    str_detect(package, "1/9") ~ 1/9,
    str_detect(package, "1/19") ~ 1/19
)) -> pumpkins

# table of average ppb and count by package
pumpkins %>% group_by(package) %>% summarise(avg_ppb = mean(ppb), count = n())

# table of average ppb and by package and quality
pumpkins %>% group_by(package, condition) %>% summarise(avg_ppb = mean(ppb), count = n())

# analysis of variance of ppb by origin, color and item_size
model <- aov(ppb ~ origin + color + item_size, data=pumpkins)

# display AOV table
summary(model)

# predict ppb for a pumpkin with the following characteristics
predict(model, data.frame(origin = "OHIO", color = "ORANGE", item_size = "med"))
