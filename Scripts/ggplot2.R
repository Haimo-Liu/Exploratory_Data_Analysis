library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color=cyl)
qplot(hwy, data=mpg)
qplot(hwy, data=mpg, fill=class)
qplot(displ, hwy, data=mpg, shape=class)


gg = ggplot(mpg, aes(displ, hwy))
gg + geom_point(color=mpg$cyl, size=3, alpha = 1/2)
gg + geom_point(color=mpg$cyl, size=3) + geom_smooth(method='lm')
gg + geom_point() + geom_smooth(method='lm') + facet_grid(.~drv)
gg + geom_point(color=mpg$cyl, size=5) + geom_smooth(method='lm') + 
    labs(title = 'Car Plot') + labs(x = 'Display', y = 'Highway')