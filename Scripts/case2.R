pm0 = read.table('./case_study/RD_501_88101_1999-0.txt', sep='|', header=TRUE, na.strings = '')
pm1 = read.table('./case_study/RD_501_88101_2012-0.txt', sep='|', header=TRUE, na.strings = '')
print(object.size(pm1), units = 'Mb')


x0 = pm0$Sample.Value
str(x0)
summary(x0)
x1 = pm1$Sample.Value
str(x1)
summary(x1)

boxplot(log10(x0), log10(x1))

negvalue = x1<0
summary(negvalue)
sum(negvalue, na.rm = TRUE)
mean(negvalue, na.rm = TRUE)
negative = negvalue[!is.na(negvalue)]

dates = pm1$Date
dates = as.Date(as.character(dates), '%Y%m%d')
hist(dates, 'month')


neg_date = dates[negative]
hist(neg_date, 'month')

site0 = unique(subset(pm0, State.Code == 36, c(County.Code, Site.ID)))
site1 = unique(subset(pm1, State.Code == 36, c(County.Code, Site.ID)))
\ No newline at end of file