# 'title: "Class 05 Data Visualization"
# 'author: "Alexis Cody Hargadon, A15479290"
# today's objective: learn how to use ggplot(), aes(), and geom_point()
#used plot type determined by type of variable:
#continuous numeric: measured data, can have infinite values within possible range
#discrete categorical: observations can only exist at limited values, often counts
library(ggplot2)
cars
#every ggplot had a data + aes + geom
ggplot(data=cars) +
  aes(x=speed, y= dist) +
  geom_point() +
  geom_smooth() 

#change to a linear model
p <- ggplot(data=cars) +
  aes(x=speed, y= dist) +
  geom_point() +
  geom_smooth(method = "lm") 
#can call p to make plot now 
p
p +labs(title= "plot",
        subtitle="mm cars",
        x= "speed",
        y= "distance")

#base graphics is shorter
plot(cars)

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
nrow(genes)
colnames(genes)
ncol(genes)
table(genes$State)
#fraction of genes upregulated, answer with 2 significant figures
round( table(genes$State)/nrow(genes) *100, 2)
127/5196

g <- ggplot(data=genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
g+ scale_color_manual(values= c("cyan", "orangered2", "seagreen2")) + labs(title= "Gene Expression Upon Drug Treatment", x="Control (no drug)", y="Drug Treatment")

