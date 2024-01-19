my_data <- read.csv("rozliczenie.csv", sep=";")
my_data2 <- read.xlsx("book1.xlsx")

head(my_data)
tail(my_data)
View(my_data)

my_data[1,3]
my_data[ ,3]
my_data$wyplata

library("tidyverse")
#require("tidyverse")

my_data %>%
  select(ID.pracownika, wyplata, liczba.dni.urlopu) %>%
  filter(wyplata < 5000 & liczba.dni.urlopu > 15) %>%
  arrange(wyplata)

#install.packages("readxl")
library(readxl)
Book1 <- read_excel("Book1.xlsx")
View(Book1)

?read_excel

#playing with data  tidyverse
library("tidyverse")
data()
View(starwars)
starwars %>% 
  select(gender, mass, height, species) %>%
  filter(species == "Human") %>%
  na.omit() %>%
  mutate(height = height /100) %>%
  mutate(BMI = mass / height^2) %>%
  group_by(gender) %>%
  summarise(Average_BMI = mean(BMI))

