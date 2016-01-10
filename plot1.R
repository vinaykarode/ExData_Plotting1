#PLOT 1
#PLOT 1
#PLOT 1

hh<- read.table('household_power_consumption.txt', header = TRUE, sep = ';')
library(dplyr)
hh_tbl <- tbl_df(hh)

hh_tbl<- mutate(hh_tbl, new_date = as.Date(Date, '%d/%m/%Y'))
hhf<- filter(hh_tbl, new_date >= '2007-02-01' , new_date <= '2007-02-02')
hh_tbl <-filter(hh_tbl, Global_active_power != '?')

hhf<- mutate(hhf, Global_avtive_power_new = as.numeric(as.character(Global_active_power)))
hist(hhf$Global_avtive_power_new, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)')

png(filename = 'Plot1.png', width = 480, height = 480, units = 'px')
hist(hhf$Global_avtive_power_new, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()

hhf<- mutate(hhf, day= weekdays(new_date))