# Robert Zinna
# Ent Soc R Workshop 2018
# 11/14/2018
# The code below sets my working directory
setwd("~/Desktop/Ent Soc R Workshop")
#This code assigns a value to an object
object <- 6
object
object / 3
object * 3
weight <- c(39,48,36,26,20,47,35,31,22,34)
weight
parasites <- c(3,0,7,0,2,9,5,0,4,1)
sex <- c("M","F","M","F","M","F","M","F","M","F")
mean.p <- mean(parasites)
log.weight <- log(weight)
parasite.df <- data.frame(weight,parasites,sex,log.weight)
parasite.df$parasites
#I'm going to make a new data frame column
parasite.df$normalized.p <- parasite.df$weight / mean.p






#Module 2 - getting started with data in R
download.file("https://bit.ly/2JF82e0", "./portal_data_joined.csv")
surveys = read.csv("portal_data_joined.csv")

head(surveys)
str(surveys)
summary(surveys)

surveys[,3]
surveys[346,2]
surveys[2:27, 4:5]
surveys[-29, ]

surveys$year

surveys_200 = surveys[200,]
head(surveys)
class(surveys$sex)

as.character(surveys$sex)
surveys$sex = as.character(surveys$sex)

class(surveys$sex)

surveys$sex = as.factor(surveys$sex)

#Moving to dates

install.packages("lubridate")
library(lubridate)
?require

my_date = ymd("2018-12-31")


#Leap year stuff
surveys$date = ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
head(surveys)

#https://www.rstudio.com/resources/cheatsheets/

#With the code below you can determine where the issues are
#is_missing_date = is.na(surveys$date)
#date_columns = c("year", "month", "day")
#missing_dates = surveys[is_missing_date, date_columns]

#summary(surveys$date)



#Module 3 Data Manipulation with tidyverse
install.packages("tidyverse")
library(tidyverse)

surveys <- read_csv("https://bit.ly/2JF82e0")
str(surveys)
select(surveys, plot_id, species_id, weight)
mid90ssurvey <- filter(surveys, year == 1995)

surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

surveys %>%
  mutate(weight_kg = weight /1000, 
         weight_kg2 = weight_kg *2)%>%
  select(weight, weight_kg, weight_kg2)

##Using dplyr to group and summarize data
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm=TRUE))
