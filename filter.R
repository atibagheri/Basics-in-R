library(tidyverse)
view(msleep)
#1
#creating new object(my_data)a copy of msleep that we want to extract subset we want
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  #filter animal who sleep more than 18
  filter(sleep_total > 18) 
#2
  #filter animal who sleep less than 18
  filter(!sleep_total > 18) #! do everything opposite
#3. more than one criteria been used
my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(order == "Primates",bodywt > 20)
#4 or | looking multiple criteria for extracting row.
#it means either of criteria are met that pparticular row needs to be extracted 

my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(order == "Primates" | bodywt > 20)
#5 use or operator multiple times
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(name == "Cow" |
           name == "Dog" |
           name == "Goat")
#6 doing exactly the same thing that we can creat on 5{concatenation}
#means filter outwhere name is in anyway within this concatenation
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(name %in% c("Cow", "Dog", "Horse"))
#7 we can use between within filter function, it means we want to filter out any
#observation or row sleeptotal between the value in prantesis.
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(between(sleep_total, 16, 18))
#8 near or close to variabel ,how close with tol
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(near(sleep_total, 17, tol = 0.5))
#9 missing value
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(is.na(conservation))
#10 opposit 9.we don't want NA value {!excalamation mark}
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(!is.na(conservation))

