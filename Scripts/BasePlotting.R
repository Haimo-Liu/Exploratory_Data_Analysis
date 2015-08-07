library(datasets)
data(cars)
with(cars, plot(speed, dist))

data(airquality)
airquality$Month_level = factor(airquality$Month)
boxplot(Ozone ~ Month, airquality, xlab='Month', ylab='Ozone')
title(main = "Ozone and Wind in New York City") ## Add a title

with(airquality, plot(Wind, Ozone, main='Ozone and Wind'))
with(subset(airquality, Month==5), points(Wind, Ozone, col='blue'))
with(subset(airquality, Month!=5), points(Wind, Ozone, col='red'))
legend('topright', pch=1, col=c('blue', 'red'), legend=c('May', 'Other Month'))


par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = TRUE)
})