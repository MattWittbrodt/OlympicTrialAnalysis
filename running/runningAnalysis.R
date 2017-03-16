# Running Analysis - 3/15/2017

library(dplyr); library(moments); library(car)

# Read in data, subset to only being distances <= 1500
ot.data <- read.csv("C:/Users/Matt/gdrive/Research/Swimming/runningAnalysis/otRunningData.csv") %>%
  subset(discipline == "run" & year > 1970) 

ot.data$distance <- as.numeric(as.character(ot.data$distance))
ot.data$year <- as.factor(ot.data$year)

ot.data <- subset(ot.data, ot.data$distance <= 1500)

#####
##### Begin analysis
#####

# Using a 2 factor anova with fixed effects: Year & Distance
leveneTest(perDiff ~ year*distance, data = ot.data, center = mean)
agostino.test(ot.data$perDiff)

