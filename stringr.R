#String are created using single or daoble quote. 
library(tidyverse)
string1 <- "this is a string"
string2 <- "if I want to include a 'quote'inside the string,using single code"
string3 <- 'if you format a "quote" like this, it cause problem'
# naturally if we concotenate dif strings , we have character vector
numbers <- c("one", "two", "three")
str(numbers)
# one of the most used function in base r id past() can be used for mergemultiple text elemnts in one.
# however "stringer"package provide us a family functionwith perfix "str_"
#str_c()there are two distinct argument to this function:"sep, collapse"
#seperate
shameLessPlug1 <- c("subscribe on richard", "see other r videos")
shameLessPlug2 <- c("and smsash the like button", "and see julia totorial too")
str_c(shameLessPlug1, shameLessPlug2, sep = ", ")
str_c(shameLessPlug1, shameLessPlug2, collapse = ", ")
str_c(shameLessPlug1, shameLessPlug2, sep = ", ", collapse = ", ")
#length of string
str_length(shameLessPlug)

#subseting with str_sub(), and replace string
shameLessPlug <- "Subscribe for Richardondata"
str_sub(shameLessPlug, 1, 9)
str_sub(shameLessPlug, -13, -1)

#str_to_upper(), str_to_lower changing case of your string
str_sub(shameLessPlug, 1, 1) <- str_to_lower(str_sub(shameLessPlug, 1, 1))
shameLessPlug #change capital S to s

#str_replace
obviousStatement <- "I like pie"
str_replace(obviousStatement, pattern = "like", replacement = "love")

#regular expression: the real power of "stringer"lies inability of the packages to deal withregular experssion.
evenMoreshameLessPlug <- c("like", "subscribe", "comment")
str_sort(evenMoreshameLessPlug) #sort base alphabetical order

#str_view():generate a view of the exact machtes,matches to other character,anchores.

str_view(evenMoreshameLessPlug, "s") #result in viewer
str_view(evenMoreshameLessPlug, ".e")
str_view(evenMoreshameLessPlug, "...e")
str_view(evenMoreshameLessPlug, ".e.")
#dot show howmany ch we want to show.

str_detect(evenMoreshameLessPlug, "c") #return buleon function
# we can use detection for anchor(first ^ and last$ char)
str_detect(evenMoreshameLessPlug, "^S")
str_detect(evenMoreshameLessPlug, "e$")
str_count(evenMoreshameLessPlug, "m")
# we are going to use built in "words" vector to create a data frame and illustrate regular experssion functionallities
#  '\d': match any digit
# '\s': match any whitespace
# '[abc]': matches a, b, or c
# '[^abc]': matches anything except a, b, or c
#[a|b]: mach a or b

install.packages("tibble")
library(tibble)

df<- tibble(
  word = words
)


df %>%
  mutate(
    vowel = str_count(word, "[aeiou"]),
    consonants = str_count(word, "[^aeiou"]),
    a_or_c = str_count(word, "[a|c"]),
  )

df %>%
  dyplr::filter(str_detect(word,"^y"))














