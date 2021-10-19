#ggplot
###data visualization
#data:what data set are using
#mapping(aesthetics):take the values,tell R what we map themout aesthethic
#geometric:line graph or dot plot,bar chart, histo..
#statistics
#facet
#coordinate space
#labels
#theme
library(tidyverse)
data()
BOD
?BOD #help:discription data set
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 5)+  #geometry
  geom_line(color = "red")
#better way for writing this code
ggplot(BOD, aes(Time, demand))+
  geom_point(size = 3)+
  geom_line(color = "orange")
data()
CO2 
#if we want to see the co2 as a file open up here, put it on view
view(CO2)
#because we working with tidyverse we have got access to %>% (pipe operator)
library(tidyverse)
data()
view(CO2)
CO2 %>%
  ggplot(aes(conc, uptake,
             color = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~ Type)+
  labs(title = "concentration for CO2")+
  theme_bw()
#3
CO2 %>%
  ggplot(aes(Treatment, uptake))+ #stike to mappoing to original ggplot
  geom_boxplot()+
  geom_point(alpha = 0.5, 
             aes(size = conc,       #stike to geometry
               color = Plant))+
  facet_wrap(~ Type)+
  coord_flip()+
  theme_bw()+
  labs(title = "chilled and not chilled")
#4
view(mpg) 
mpg%>% 
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(color = drv,
                 size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)+
  labs(x = "Engine size",
       y = "MPG in the city",
       title = "Fule efficiency")+
  theme_minimal()
https://www.youtube.com/watch?v=zzXCkYR84M0
gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")
summary(gapminder)
View(gapminder)
library(ggplot2)
ggplot(gapminder, aes(year, pop, color = continent))+
  geom_point()+
  scale_color_brewer(palette = "Set2")

?scale_color_brewer
#visualize color brewer palette
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)
#save some typing

P <- ggplot(gapminder, aes(year, pop, color = continent))+
  geom_point()
#costum Palette
P +
  scale_colour_manual(values = c("#CDC0B0", "#66CDAA", "#8EE5EE", "#8B6508", "#A9A9A9", "#FFD700"))

#scale_colour_manual(values = c("blue", "red", "purple", "green", "orange"))

#more comfortable to use the adding colorpicker 



#we can use colo picker insted of wrinting with Adding in the top of pagec("#00FFFF", "#CAFF70", "#76EEC6", "#CDC0B0", "#FFD39B")
scale_colour_manual(values = c("#CDC0B0", "#66CDAA", "#8EE5EE", "#8B6508", "#A9A9A9", "#FFD700"))
P +
  scale_y_log10()
  