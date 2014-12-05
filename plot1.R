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
#making plot1
hist(dataset$Global_active_power,main = "Global active power",xlab = "Global Active Power (kilowatts)",col = "red",freq=T)
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
dev.off()
