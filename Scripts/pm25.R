getwd()
setwd('C:/Users/hliu/Documents/R_study/Exploratory')
SCC_data = readRDS('./assignment/pm25/Source_Classification_Code.rds')
pm25 = readRDS('./assignment/pm25/summarySCC_PM25.rds')


total_em = aggregate(pm25$Emissions, by = list(pm25$year), FUN = sum)
names(total_em) = c('year', 'Total Emissions')
barplot(total_em[, 2], total_em[, 1], names.arg = c('1999', '2002', '2005', '2008'))

bal = subset(pm25, pm25$fips == '24510')
bal_em = aggregate(bal$Emissions, by = list(bal$year), FUN = sum)
barplot(bal_em[, 2], bal_em[, 1], names.arg = c('1999', '2002', '2005', '2008'))

library(reshape2)
bal_melt = melt(bal, id = c('year', 'type'), measure.vars = 'Emissions')
bal_cast = dcast(bal_melt, type + year ~ variable, sum)
qplot(year, Emissions, data = bal_cast, facets = .~type, geom = 'line')

SCC_coal = SCC_data[grepl('coal', SCC_data$Short.Name, ignore.case = TRUE), ]
pm25_join = merge(pm25, SCC_coal, by = 'SCC')
join_em = aggregate(pm25_join$Emissions, by = list(pm25_join$year), FUN = sum)
barplot(join_em[, 2], join_em[, 1], names.arg = c('1999', '2002', '2005', '2008'))
