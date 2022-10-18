# Assignment on Reproducibility

rm(list=ls())
library(tibble)

#create table
df1 <- read.csv("C:\\Users\\Vomitadyo\\Desktop\\AREC 570 Research Methods\\Reporducible Exercise\\inputs\\gdp_52-67.csv")

#Create a single table spanning 1952-1967 with the following columns: continent, country, year, lifeExp, pop, and gdp.

#Create Column with arbitrary numbers, join and rearrange. 
lifeExp <- c(length(568))
df2 <- data.frame(df1,lifeExp)
col_order <- c("continent", "country", "year", "lifeExp", "pop", "gdp")
df3 <- df2[, col_order]

#Create a table from the data frame 
tab1 <- table(df3$continent, df3$country, df3$year, df3$lifeExp, df3$pop, df3$gdp) #Table is too bit to be displayed. 


#5. Calculate gdp per capita and name it gdpPercap
df3$gdpPercap <- df3$gdp/df3$pop 



