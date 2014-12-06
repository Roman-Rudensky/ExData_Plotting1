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
#making plot3
plot(dataset$Sub_metering_1, ylab = "Energy sub metering",xlab="", type="n",axes=F)
lines(dataset$Sub_metering_1,col="black")
lines(dataset$Sub_metering_2,col="red")
lines(dataset$Sub_metering_3,col="blue")
axis(2)
box()
axis(side=1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",width = 480, height = 480, units = "px")
dev.off()
