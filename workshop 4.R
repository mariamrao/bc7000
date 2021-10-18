library(tidyverse)

data(mpg)

 mpg%>% # data layer 
   ggplot(
     mapping = aes(  # aesthtic layer
       x= disply,
       y=hwy
     )
   )+


