#ggplot notes

#scatterplot
ggplot(dataset, aes(x=  , y=  )) + geom_point(alpha = 0.0)
  +coord_fixed()+
  scale_x_log10()+
  scale_y_log10()+
  stat_smooth(
    method= "lm",
    color= "#C42126",
    se= FALSE, 
    size=1
  )
