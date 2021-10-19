library(tidyverse)

library(nycflights13)
data(flights)
names(flights)
flights %>%
  
  dplyr::filter(month == 1 | month == 2, day == 1)

  # we will pipe multiple operation together
  # R longer example of filter
flightsFiltered <- flights %>%
  dplyr::filter(month %in% c(11, 12)) %>%
  dplyr::filter(dep_time >= 700) %>%
  dplyr::filter(carrier != "UA")
flightsFiltered

  # Arrange
flightsArranged <-  flightsFiltered %>%
  arrange(year, month, day, desc(dep_delay))
flightsArranged

# select and rename
  
flightsSelected <- flightsArranged %>%
  dplyr::select(-(hour: hour_time) %>% #remove element
  deply::select(flights, year, month, day,dep_time,dep_delay, arr_delay, carrier, origin, dest, air_time, distance) %>%
  deply::rename("airtime" = "air_time", "destination" = "dest")
flightsSelected
# ******
#mutate() create new variable, modify existing variabls.
# transmute:the same functionality as mutate expect drop of all your culomn 
#except the you one you created!
flightsMutated <- flightsSelected %>%
  mutate(gain = dep_delay - arr_delay,
         hour = air_time /60,
         gain_per_hour =gain/hour)
flightsMutated
  

flights2a <- flightsMutated %>%
  mutate_at(.vars = c("year", "month", "day"), .func = as.character)

flights2b <- flightsMutated %>%
  mutate(across(.cols = c("year", "month", "day"), .fns = as.character))
  

flights3a <- flightsMutated %>%
  mutate_all(.func = as.character)

flights3b <- flightsMutated %>%
  mutate(across(.cols = everything(), .fns = as.character)) 
 #check that these return the same result
identical(flights2a, flights3a)
identical(flights2b, flights3b)
# group_by create a grouped data set to which many of function describe above
# can be used.
#most commonly groupedby used with summeries()which enable 
#a function to be appliedto the grouped data set.here we see mean function
meanDelays <- flightsMutated %>% 
  group_by(carrier) %>%
  dplyr::summarise(meanDelay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(meanDelay))
meanDelays

#
carrierCounts <-flightsMutated %>% 
  group_by(carrier) %>%
  dplyr::summarise(n = n()) %>% # equivalent: tally()
  arrange(desc(n))
carrierCounts
# left_join
airlineNames <- meanDelays %>% 
  left_join(airlines, by = c("carrier" = "carrier")) %>% 
  dplyr::select(name, carrier, meanDelays)
airlineNames
