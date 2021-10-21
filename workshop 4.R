library(tidyverse)

data(mpg)

 mpg%>% # data layer 
   ggplot(
     mapping=aes(  # aesthtic layer
       x=displ,
       y=hwy,
       colour=manufacturer
     )
   )+
   
   geom_point()

