#PLOT 2
#PLOT 2
#PLOT 2
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

png(filename = 'Plot2.png', width = 480, height = 480, units = 'px')
plot(time,pow, type='l', xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.off()