#A different approach for this one

	library(dplyr)

#File .txt is already downloaded and unzipped in the workdirectory

	hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
	
#filtering the Dates we are interested in

	hpc_date <- filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

#merging Date and Time

	hpc_date$DateTime <- strptime(paste(hpc_date$Date, hpc_date$Time), "%d/%m/%Y %H:%M:%S")

#opening the png file and creating the plot (due to my system setup the three days are in Swedish)

	png("plot2.png",width=480,height=480)
	plot(hpc_date$DateTime, hpc_date$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
	dev.off()