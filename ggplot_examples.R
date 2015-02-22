# ggplot learning code script
# Brendan McDermott bmcdermott@email.arizona.edu
# Feb 22

install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")

# shows you the first six lines of the basic table in ggplot
head(iris)

# reshape allows you to "melt" and "recast" data
# mapping: how data is represented visually
  # which data is on the y or the x axis
  # also color, shape, transparency

myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

