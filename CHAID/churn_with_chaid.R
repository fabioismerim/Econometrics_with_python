#install.packages('modeldata')
#install.packages("installr")
#install.packages("CHAID", repos = "http://R-Forge.R-project.org")


#import package

library(modeldata)
library(tidyverse)
library(CHAID)
#library(installr)
#updateR()

#load data
df = read.csv('attrition.csv')

# data structure
str(df)

#summary statistcs
summary(df)


#create a dataset tiwh only factors

df1 <- df %>%
    select_if(is.factor)

#apply CHAID
control <- chaid_control(maxheight = 4,
                         minbucket = 30)

model1 <- chaid(Attrition ~ .,
                data = df,
                control = control)
