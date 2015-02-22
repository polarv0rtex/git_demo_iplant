# Working Script
# Brendan McDermott
# Feb 22, 2015

install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")

# set working directory
setwd("~/git_demo_iplant")

# import the tsv
data.in <- read.delim("output/combined_gapMinder.tsv")

# extract 3 countries: Cameroon, Venezuela, and Yemen
countries <- subset(data.in, 
                      country == "Cameroon" |
                      country == "Venezuela" |
                      country == "Zambia")

# plot points
summary(countries)

ggplot(countries, aes(year, pop, color=country)) + 
  geom_point(size = 5) 