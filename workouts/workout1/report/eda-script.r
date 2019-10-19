# Title: eda-script
# Description: 
# Input(s): ibtracs-2010-2015.csv
# Output(s): data summary
# Author(s): Zizi Ren
# Date: 10-17-2019

# packages
library("readr") 
library("ggplot2")
library("lubridate")

# read data
col_name <- c("serial_num","season","num","basin","sub_basin","name","iso_name","nature","latitude","longitude","wind","press")
col_type <- c("cic?ccccdddd")
ibtracs <- read_csv("ibtracs-2010-2015.csv", col_names = col_name, col_types = col_type, na = c('-999','-1','0'),skip = 1)
sink(file = '../output/data-summary.txt')
summary(ibtracs)
sink()

# Trajectories of storms (2010-2015)
png(filename = "../images/map-all-storms.png", width = 1080)
world <- map_data('world')
ggplot(ibtracs) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = nature))
dev.off()

ggsave(file = "../images/map-all-storms.pdf")
world <- map_data('world')
ggplot(ibtracs) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = nature))
dev.off()

# Storms in Eastern Pacific
png("../images/map-ep-na-storms-by-year.png", width = 1500, height = 480)
bs <- filter(ibtracs, basin=='EP' | basin=='NA')
ggplot(bs) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = wind))+ facet_wrap(~ season) + theme_minimal()
dev.off()

ggsave("../images/map-ep-na-storms-by-year.pdf", width = 1500, height = 480,limitsize = FALSE)
bs <- filter(ibtracs, basin=='EP' | basin=='NA')
ggplot(bs) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = wind))+ facet_grid(~ season) + theme_minimal()
dev.off()

#Storms in the basins EP
#colored by pressure
png("../images/map-ep-na-storms-by-month.png")
month <- mutate(bs, month = month(ymd_hms(bs$iso_name), label = TRUE))
ggplot(month) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = press)) + facet_wrap(~ month) +theme_minimal()
dev.off()

ggsave("../images/map-ep-na-storms-by-month.pdf")
ggplot(month) + annotation_map(fortify(world)) + geom_point(aes(x = longitude, y = latitude, color = press))+ facet_wrap(~ month) + theme_minimal()
dev.off()
