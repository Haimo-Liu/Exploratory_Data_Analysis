getwd()
power = read.table('./assignment/power/household_power_consumption.txt', na.strings='?', sep=';', header = TRUE)
power$Date = as.Date(as.character(power$Date), '%d/%m/%Y')
str(power$Date)
sub1 = subset(power, Date>='2007-02-01' & Date<='2007-02-02')

hist(sub1[, 3], xlab = 'Global Active Power (kw)', 
     ylab = 'Frequency', main = 'Global Active Power', col = 'red')

sub1$timestamp = as.POSIXct(paste(sub1$Date, sub1$Time), format="%Y-%m-%d %H:%M:%S")
plot(sub1$timestamp, sub1[, 3], type = 'l')


plot(sub1$timestamp, sub1[, 7], type = 'l', ylim = c(0, 40))
par(new = T)
plot(sub1$timestamp, sub1[, 8], type = 'l', ylim = c(0, 40), col = 'red')
par(new = T)
plot(sub1$timestamp, sub1[, 9], type = 'l', ylim = c(0, 40), col = 'blue')
legend('topright', c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), 
       col = c('black', 'red', 'blue'))


par(mfrow = c(2, 2))
hist(sub1[, 3], xlab = 'Global Active Power (kw)', 
     ylab = 'Frequency', main = 'Global Active Power', col = 'red')
hist(sub1[, 3], xlab = 'Global Active Power (kw)', 
     ylab = 'Frequency', main = 'Global Active Power', col = 'red')
hist(sub1[, 3], xlab = 'Global Active Power (kw)', 
     ylab = 'Frequency', main = 'Global Active Power', col = 'red')
hist(sub1[, 3], xlab = 'Global Active Power (kw)', 
     ylab = 'Frequency', main = 'Global Active Power', col = 'red')