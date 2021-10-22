#remove all existing variables in enviornment
rm(list=ls())

brewing_materials <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')
beer_taxed <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_taxed.csv')
brewer_size <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewer_size.csv')
beer_states <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_states.csv')

#load packages 
library(skimr)
library(tidyverse) 

brewing_materials%>%skim()
brewing_materials%>%count(data_type)
brewing_materials%>%count(material_type,sort= TRUE)
#recording as factor
brewing_materials <-brewing_materials%>%mutate(material_type=as_factor(material_type))
brewing_materials%>%skim()
brewing_materials<-brewing_materials%>%mutate(type=as_factor(type))
brewing_materials%>%skim()
#dataviz
#chnaging theme for data viz
theme_set(theme_minimal())
brewing_materials%>%
  ggplot(aes(x=material_type,y=month_current,fill=type)
  )+
  
  geom_col()+
  #for aes
  coord_flip()
