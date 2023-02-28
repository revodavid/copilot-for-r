library(tidyverse)

# read in pumpkin data
pumpkins <- read_csv("US-pumpkins.csv")
names(pumpkins)

# clean up column names
library(janitor)
pumpkins <- clean_names(pumpkins)

# display an overview of the data
glimpse(pumpkins)

# display 5 random rows
pumpkins %>% sample_n(5)

# show average high price by package and color
pumpkins %>% group_by(package) %>% summarise(avg_high_price = mean(high_price))

# analysis of variance of high price by origin, color and item_size
model <- aov(high_price ~ origin + color + item_size, data = pumpkins)

# display AOV table
summary(model)

# predict ppb for a pumpkin with the following characteristics
predict(model, data.frame(origin = "OHIO", color = "ORANGE", item_size = "med"))

# DEMO STOPS HERE. But a few other examples are below.

# filter rows where "bushel" is found in the package name
pumpkins %>% filter(str_detect(package, "bushel")) -> pumpkins

# calculate price per bushel as ppb using package name
pumpkins %>% mutate(ppb = high_price / case_when(
    str_detect(package, "1/2") ~ 0.5,
    str_detect(package, "1/19") ~ 0.25,
    .default = 1)) -> pumpkins

# table of average ppb by color and item_size
pumpkins %>% group_by(color, item_size) %>% summarise(avg_ppb = mean(ppb))

# create a table of counts by item_size and color
pumpkins %>% count(item_size, color)

