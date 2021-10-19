library(tidyverse)
names(msleep)
view(msleep)
# 1 single categorical
msleep %>%
  drop_na(vore) %>% #if comment this line another column add to graf with name NA
  ggplot(aes(x = vore))+
  geom_bar(fill = "#97B3C6")+ #htmlcolorcode.com  #counting
  #coord_flip()+ #vertically axis, for lots of data
  theme_bw()+
  labs(x = "Vore",
       y = NULL,
       title ="number of observation")
   #use fct_infreq(vore) to create order on ggplot        
# 2 single numeric
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(x = awake))+
  geom_histogram(binwidth = 2, fill = "#97B3C6")+ 
  theme_bw()+
  labs(x = "Vore",
       y = NULL,
       title ="number of observation")
#binwidth:how many observation fit into these bins?(0 -2 , 2-4,..)