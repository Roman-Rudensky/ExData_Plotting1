#reading dataset into memory
dataset<-read.table("household_power_consumption.txt",sep=";",
                    header = F,nrows=2880,skip=66637,
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#reading names
names<-read.table("household_power_consumption.txt",sep=";",header = F,nrows=1,colClasses="character")
#assign names
names(dataset)<-names
#convert dates as date
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")
#making plot2
plot(dataset$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="", type="l",axes=F)
axis(2)
box()
axis(side=1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png",width = 480, height = 480, units = "px")
dev.off()
