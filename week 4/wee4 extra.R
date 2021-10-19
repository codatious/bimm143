install.packages("gapminder")
library(gapminder)
install.packages("dplyr")
library(dplyr)
url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"
library(ggplot2)
gapminder <- read.delim(url)
gapminder_2007 <- gapminder %>% filter (year==2007)

ggplot(gapminder_2007) +
  aes(x= gdpPercap, y=lifeExp, color=continent, size=pop, alpha=0.5) +
  geom_point(alpha=0.5) +
  scale_size_area(max_size=10) 

#producing plot specific to year or so
gapminder <- read.delim(url)
gapminder_2007 <- gapminder %>% filter (year==1957 | year==2007)

ggplot(gapminder_2007) +
  aes(x= gdpPercap, y=lifeExp, color=continent, size=pop, alpha=0.5) +
  geom_point(alpha=0.5) +
  scale_size_area(max_size=10) +
  facet_wrap(~year)

#Bar charts
gapminder_top5 <- gapminder %>%
  filter(year==2007) %>%
  arrange(desc(pop)) %>%
  top_n(5, pop)
gapminder_top5

ggplot(gapminder_top5) + 
  geom_col(aes(x= country, y= pop))

#plot life expectancy by country 
ggplot(gapminder_top5) +
  geom_col(aes(x= country, y = pop, fill = continent))
#^uses continent (which is a category variable) that has a clear color scheme
#using numberic variable like life expectancy 
ggplot(gapminder_top5) + 
  geom_col(aes(x=country, y=pop, fill= lifeExp))
#fill = can be changed (like life exp or GDP etc)
 
#flipping bar charts
head(USArrests)
USArrests$State <- rownames(USArrests)
ggplot(USArrests) + aes(x=reorder(State,Murder), y=Murder) +
  geom_col()+
  coord_flip()
#too crowded :(
ggplot(USArrests) + aes(x=reorder(State,Murder), y=Murder) +
  geom_col()+
  geom_segment(aes(x=State, xend= State, y=0, yend=Murder), color="blue")+
  coord_flip()
)