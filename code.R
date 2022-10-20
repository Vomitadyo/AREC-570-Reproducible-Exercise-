# Assignment on Reproducibility

rm(list=ls())
library(dplyr)
library(ggplot2)



#Load data
gdp52_67 <- read.csv("inputs/gdp_52_67.csv")
le52_67 <- read.csv("inputs/le_52_67.csv")
le72_07 <- read.csv("inputs/le_72_07.csv")
gdp72_07 <- read.csv("inputs/gdp_72_07.csv")



#Create a single table spanning 1952-1967 with the following columns: continent, country, year, lifeExp, pop, and gdp.
merged <- merge(gdp52_67, le52_67, by =c("country", "continent", "year"))
col_order <- c("continent", "country", "year", "lifeExp", "pop", "gdp")
gdpLe <- merged[, col_order]


#5. Calculate GDP per capita and name it gdpPercap
gdpLe$gdpPercap <- gdpLe$gdp/gdpLe$pop



#6. Visualize life expectancy and GDP per capita over time for Canada in the 1950s and 1960s using a line plot

gdpLe%>%
  filter(country=="Canada")%>%
  ggplot(aes(x=year, y=lifeExp, tittle = ""))+
  geom_point()+
  geom_line(color="red")+
  theme_bw()+
  labs(title="Life Expectance of Canada")




#7.Regress life expectancy on gdp per capita and display the regression table. Don’t worry about the ancillary stats.

#merge from 1952 to 2007



merged1 <- merge(gdp72_07, le72_07, by =c("country", "continent", "year"))
col_order1 <- c("continent", "country", "year", "lifeExp", "pop", "gdp")
gdpLe1 <- merged[, col_order1]
gdpLe1$gdpPercap <- gdpLe1$gdp/gdpLe1$pop
data_complete <- rbind(gdpLe, gdpLe1)



OLS <- lm(lifeExp~gdpPercap,  data =data_complete)
summary(OLS)














