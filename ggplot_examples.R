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

# Section 6. Facets
# creates lattice plots
# single column, multiple rows
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(Species ~ .)

# a different way to look at this
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(. ~ Species)

# trying that with facet wrap
# wrap will do it's best to naturally fill the space with plots
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 5) +
  facet_wrap(~ Species) # notice the lack of "."

# Section 7. Scales
library(RColorBrewer)
display.brewer.all()

#using a color brewer palette
library(reshape2)
# melt the data
df <- melt(iris, id.vars = "Species")
# recast the data
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") + 
  # dodge = nested bar plot, without this, they will get stacked up
  scale_fill_brewer(palette = "Set5")

# trying out some different things here
ggplot(df, aes(variable, value, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set3")

# pick your own colors: i want hue
# adding a continous scale to an axis
ggplot(birthwt, aes(factor(race), bwt)) + 
  geom_boxplot(width = .2) +
  scale_y_continuous(labels = (paste0(1:4, " Kg")),
                     breaks = seq(1000, 4000, by = 1000))

# Section ... 8? Coordinates
# ggplots does not make pie charts b/c it was written by statisticians

# Section 9 ... other things you can do
# histograms, line charts, create a line chart in three lines of code 
# create a "geom ribbon" to show confidence

# good to know about themes