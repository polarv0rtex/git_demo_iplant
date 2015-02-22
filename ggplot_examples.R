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
# aes = aesthetics

# this one will actually create a chart
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()

# once the data has been placed in the variable, 
# you can run the variable like a command:
myplot

# never use qplot... short for quick plot /side note

# this is a way to look at the dataset
# you can pull the main dataset into an object which is then available in "Environment"
myiris <- iris
myiris

# set the size of the points
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point(size = 3)

# changing settings further
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) 
  myplot + geom_point(size = 5)

# map species to shapes
#ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = species)) +
#  geom_point(aes(shape=Species), size = 3)

# Make a small sample of the diamonds dataset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

dim(diamonds)

# write the ggplot function to display the plot
ggplot(d2, aes(x = carat, y = price, color = color)) + geom_point()

# this also works and gives the same results
ggplot(d2) + geom_point(aes(x = carat, y = price, color = color))

# Stats 
# statistical transformations which are applied to your data
# before it is mapped

# bwt = birthweight
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()




