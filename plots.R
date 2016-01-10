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

#PLOT 2
#PLOT 2
#PLOT 2

library(data.table)
hh_table<- data.table(hh)
hh_table[['Date']] <- as.Date(hh_table$Date, "%d/%m/%Y")
hh_table[['DateTime']]<- paste(hh_table$Date, hh_table$Time)
strptime(hh_table[['DateTime']], '%d/%m/%Y %H:%M:%S')

hh_tab_s<- hh_table[hh_table$Date >= '2007-02-01']
hh_tab_s <- hh_tab_s[hh_tab_s$Date <= '2007-02-02']
hh_tab_s[['datetime']] <- paste(hh_tab_s$Date, hh_tab_s$Time)

time<- strptime(hh_tab_s$datetime, "%Y-%m-%d %H:%M:%S")
pow<- as.numeric(as.character(hh_tab_s$Global_active_power))

png(filename = 'Plot2.png', width = 480, height = 480, units = 'px')
plot(time,pow, type='l', xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.off()

#PLOT 3
#PLOT 3
#PLOT 3

sub1<- as.numeric(as.character(hh_tab_s$Sub_metering_1)) 
sub2<- as.numeric(as.character(hh_tab_s$Sub_metering_2)) 
sub3<- as.numeric(as.character(hh_tab_s$Sub_metering_3))
hh_tab_s[['Sub_metering_1']]<- as.numeric(as.character(hh_tab_s$Sub_metering_1), length=2)
hh_tab_s[['Sub_metering_2']]<- as.numeric(as.character(hh_tab_s$Sub_metering_2), length=2)
hh_tab_s[['Sub_metering_3']]<- as.numeric(as.character(hh_tab_s$Sub_metering_3), length=2)
plot(time,hh_tab_s$Sub_metering_1, type='l',xlab = '',ylab = 'Energy sub meeting')
lines(time,hh_tab_s$Sub_metering_2, type='l', col='red')
lines(time,hh_tab_s$Sub_metering_3, type='l', col='blue')
legend('topright',groups,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))

png(filename = 'Plot3.png', width = 480, height = 480, units = 'px')
plot(time,hh_tab_s$Sub_metering_1, type='l',xlab = '',ylab = 'Energy sub meeting')
lines(time,hh_tab_s$Sub_metering_2, type='l', col='red')
lines(time,hh_tab_s$Sub_metering_3, type='l', col='blue')
legend('topright',groups,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))
dev.off()

#PLOT 4
#PLOT 4
#PLOT 4

par(mfrow=c(2,2))
plot(time,hh_tab_s$Global_active_power, xlab = '',type='l',ylab = 'Global Active Power')
plot(time,hh_tab_s$'Voltage ' , xlab = '',type='l',ylab = 'Voltage')

 par(mfrow=c(2,2))
 plot(time,hh_tab_s$Global_active_power, xlab = '',type='l',ylab = 'Global Active Power')
 plot(time,hh_tab_s$'Voltage ' , xlab = 'datetime',type='l',ylab = 'Voltage')
 plot(time,hh_tab_s$Sub_metering_1, type='l',xlab = '',ylab = 'Energy sub meeting')
 lines(time,hh_tab_s$Sub_metering_2, type='l', col='red')
 lines(time,hh_tab_s$Sub_metering_3, type='l', col='blue')
 legend('topright',groups,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty='n')
 plot(time,hh_tab_s$Global_reactive_power, type='l',xlab = 'datetime',ylab = 'Global_reactive_power')
 
 
 
 
 