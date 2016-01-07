
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
png(filename='plot1.png',width=480,height=480)
hist(dat$Global_active_power,col='red',main ='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()




