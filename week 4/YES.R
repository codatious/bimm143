setwd("~/Desktop")
Dev.time <- read.csv("BC.Dev.csv")

library(ggplot2)

ggplot(data=Dev.time, aes(x=Day, y=Number, color= Population)) +
  geom_jitter(size=1, width=0.3)+
  facet_wrap(~Population)
 
# geom_boxplot(aes(group= Population))

ggplot(data=Dev.time, aes(x=Day, y=Number, color= Population)) +
  geom_jitter(size=1, width=0.3)+
  facet_wrap(~grp)



# create a data frame
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)

# grouped boxplot
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot()

ABxSCN <- c(Dev.time$ABxSCN, Dev.time$SCNxAB)
# grouped boxplot
ggplot(data, aes(x=Day, y=Number, fill=treatment)) + 
  geom_boxplot()

variety




grp <- (Dev.time$Population=="ABxSCN") + 
  (Dev.time$Population=="SCNxAB")

Dev.time$grp=grp
