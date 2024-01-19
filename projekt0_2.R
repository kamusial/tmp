name <- c("Greg", "Paul", "Kim")
age <- c(47, 52, 34)
gender <- c("M", "M", "F")

friends <- data.frame(name, age, gender)

friends$name

friends[1:2,1:2]

friends[friends$age<50,1:2]
#install.packages("tidyverse")
library(tidyverse)

friends %>%
  select(name, age) %>%
  filter(age < 50) %>%
  arrange(age)
