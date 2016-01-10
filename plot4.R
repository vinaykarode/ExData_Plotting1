#PLOT 4
#PLOT 4
#PLOT 4
hh<- read.table('household_power_consumption.txt', header = TRUE, sep = ';')

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

