# a numeric and categorical in one graph
library(tidyverse)
names(msleep)
view(msleep)
msleep %>%
  drop_na(vore) %>% #remove all missing value from vore
  ggplot(aes(vore, sleep_total))+
  geom_boxplot()+
  coord_flip()+
  theme_bw()

msleep %>%
  drop_na(vore) %>%
  ggplot(aes(sleep_total))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()
  
msleep %>%
  drop_na(vore) %>%
  #filter(vore =="herbi" | vore == "omni") %>%
  filter(vore %in% c("carni", "omni")) %>%
  ggplot(aes(x= sleep_total, fill = vore))+
  geom_density(alpha = 0.2)+ #{probebility between 0, 1:density}
  theme_bw()
  
#2 TWO numeric variables, one categorical variable
# x axis independent variable, Y axis dependent
view(Orange)
names(Orange)
Orange %>%
  filter(Tree != "2") %>%
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title = "Tree age and circumference")
?Orange
Orange %>%
  filter(Tree != "1" &
           Tree != "2") %>%
  ggplot(aes(age, circumference, color = Tree))+
  geom_point(size = 5, alpha = 0.3)+
  geom_line(size = 1)+
  theme_minimal()+
  labs(title = "Tree age and circumference")

 # two categorical variable 
view(starwars)
starwars %>%
  filter(hair_color == "black"|
         hair_color == "brown") %>%
  drop_na(sex) %>%
  ggplot(aes(hair_color, fill = sex))+
  #if instead of dodge put fill :what portion of people have blak hair
  geom_bar(position = "dodge",
           alpha = 0.5)+ #transparency of color
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  labs(title = "Gender and Hair color",
       x = "Hair color",
       y = "Number")

#neat code
starwars %>%
  filter(hair_color %in% c("black", "brown")) %>%
  drop_na(sex) %>%
  ggplot(aes(sex))+
  geom_bar(position = "dodge",
           alpha = 0.5)+ 
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  labs(title = "Gender and Hair color",
       x = "Hair color",
       y = "Number")
  