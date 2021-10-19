#week 3
#how to summarize data: 
x <- rnorm(1000)
mean(x)
sd(x)
#summary statistics! min med mean etc MAX!!
summary(x)

boxplot(x)
hist(x)
#bottom marginal region- little ticks where data lies
rug(x)

install.packages("ggplot2")
library(ggplot2)
View(mpg)
ncol
 nrow
#main function in package is called ggplot()
 #takes an input data.frame, a mapping of columns to aesthetics, and one or more geom layers (eg geom_point(), geom_line() etc. )
#ggplot : DATA + AESthetics + GEOMetry 
ggplot(data=mpg) +
  aes(x=displ, y=hwy) +
  geom_point()
#can keep adding more layers
ggplot(data=mpg) +
  aes(x=displ, y=hwy) +
  geom_point() +
  geom_smooth() +
  theme_bw()+
  labs(title = "my main title",
    subtitle = "subtitle",
    caption = "my caption",
    x= "displacement (L)",
    y= "MPG (Highway)")

#BASELINE:
ggplot(data = <DATA>) +
  aes(<MAPPINGS>)+
  geom_FUNCTION ()

#adding color and shape
ggplot(data=mpg) +
  aes(x=displ, y=hwy, color=class, shape=factor(cyl))+
   geom_point()
#or
ggplot(data=mpg) +
  aes(x=displ, y=hwy, color=class)+
  geom_point() +
  facet_wrap(~cyl)

#geometrys! 
ggplot(data=mpg) +
  aes(x=hwy) + 
  geom_histogram()
#doesnt need Y- bins values 
ggplot(data=mpg) +
  aes(x=hwy,
      fill=as.factor(cyl),
      group=cyl) + 
  geom_histogram(bins=15,
                 alpha=0.4)
#geom_bar() and geom_col()
ggplot(data=mpg) + 
  aes(x=hwy,
      group=factor(cyl),
      fill=factor(cyl)) +
  geom_bar()
#geom_boxplot()
ggplot(data=mpg) + 
  aes(x=hwy,
      group=factor(cyl),
      fill=factor(cyl)) +
  geom_boxplot() +
  guides(fill="none") + 
  labs(x="MPG Highway",
       y="Cyliders")
