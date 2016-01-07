#Download and unzip the file
zipUrl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(zipUrl,destfile='PrAss1data.zip')
fname<-'household_power_consumption.txt'
unzip('PrAss1data.zip')

#read the table. data.table package required
library(data.table)
dat<-fread(fname,na.strings='?')


#extract the portion of the data for plotting
ind<-dat$Date=='1/2/2007' | dat$Date=='2/2/2007'
dat<-dat[ind]

#open png device and plot the histogram
png(filename='plot3.png',width=480,height=480)
times<-strptime(paste(dat$Date,dat$Time,sep=" "),'%d/%m/%Y %H:%M:%S')

plot(times,dat$Sub_metering_1,col='black',main ='',xlab='',
     ylab='Energy sub metering',type='l',xaxt='n')
lines(times,dat$Sub_metering_2,type='l',col='red')
lines(times,dat$Sub_metering_3,type='l',col='blue')

#Add ticks and tick labels
tck=c('1/2/2007 00:00:00','2/2/2007 00:00:00','3/2/2007 00:00:00')
ttt<-strptime(tck,'%d/%m/%Y %H:%M:%S')
axis(side=1,at=as.numeric(ttt),labels=c('Thu','Fri','Sat'))

#Add legend
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
col=c('black','red','blue'),lty=c(1,1))

dev.off()

