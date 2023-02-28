R.version

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

# filter rows where "bushel" is found in the package name
pumpkins %>% filter(str_detect(package, "bushel")) -> pumpkins

# create a table of counts by item_size and color
pumpkins %>% count(item_size, color)

# show average high price by package
pumpkins %>% group_by(package) %>% summarise(avg_high_price = mean(high_price))

# calculate high price per bushel as column ppb using package column
pumpkins %>% mutate(ppb = high_price / case_when(
    str_detect(package, "1/2") ~ 0.5,
    str_detect(package, "1/19") ~ 0.25,
    .default = 1)) -> pumpkins

# table of average ppb by color and item_size
pumpkins %>% group_by(color, item_size) %>% summarise(avg_ppb = mean(ppb))

# analysis of variance of ppb by origin, color and item_size
model <- aov(ppb ~ origin + color + item_size, data = pumpkins)

# display AOV table
summary(model)

# predict ppb for a pumpkin with the following characteristics
predict(model, data.frame(origin = "OHIO", color = "ORANGE", item_size = "med"))
