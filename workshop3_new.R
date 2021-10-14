

libray(tidyverse)


#remove all existing variables 

rm(list=ls())

#loading data


survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

#equal to (either)
survey <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey%>%head()

survey_USD<-survey%>%
  filter(currency=="USD")

#data sata with USD female

surveys_USD_female<-survey%>%
  filter(
  currency=="USD"& gender=="Woman"
    )
#dataset with AUD or female|


surveys_AUD_female<-survey%>%
  filter(
    currency=="AUD"| gender=="Woman"
  )
#select observations with annual salary above or equal to 50k using usd data 
survey_USD%>% filter(annual_salary > 50000)

survey%>%select(timestamp ,gender,currency)



# arranging or group by function 
survey_USD%>%arrange(annual_salary)
#getting the min and max
min(survey_USD$annual_salary)
min(survey_USD$timestamp)
max(survey_USD$timestamp)
#select observation with annual salary greater that 0 and save it under the same name 

survey_USD<- survey_USD%>% filter(annual_salary > 0)

#sorting in a desending order 
survey_USD%>%arrange(desc(annual_salary)
                     
)
#what are industries in the data set
survey_USD%>%distinct(industry)
# how many under each industry(count)

survey_USD%>%count(gender,industry, sort =TRUE)
survey_USD%>%count(gender,industry, sort =TRUE)

#how many responses from each age category and gender 

survey_USD%>%
  count(how_old_are_you, gender, sort = TRUE)

#group_by and ungroup it when you finsh it .using piping and ungroup() 

survey_USD_grouped <-survey_USD%>%
  group_by(gender, industry)%>%
  mutate(avr_salary=mean(annual_salary),
         min_salary=min(annual_salary),
         max_salary = max(annual_salary)
         )%>%
         ungroup()

#mutate()to allows to create new variable 

surevey_USD_AV <- survey_USD%>%
  mutate(
    avr_salary=mean(annual_salary)
    )

#transmute

survey_total <-survey_USD%>%
  group_by(industry)%>%
  transmute(
    total_salary=annual_salary+ as.numeric(other_monetary_comp),
    min_salary=min(annual_salary),
    max_salary = max(annual_salary),
    total_salary_what = total_salary
    
  )

#summarise func to summarise 

survey_USD_summarised<-survey_USD%>%
  group_by(gender, industry)%>%
  summarise(
    avr_salary=mean(annual_salary),
         min_salary=min(annual_salary),
         max_salary = max(annual_salary)
)%>%
  ungroup()


#parse_number
# as.numeric (convert text ro num)


survey_USD%>%
  parse_number(how_old_are_you)

class(survey_USD$how_old_are_you)

#case when
  



