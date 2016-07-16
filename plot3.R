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
	with(hpc_date, plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = NA, ylab = "Energy sub metering"))
	with(hpc_date, lines(DateTime, Sub_metering_2, col = "red")
	with(hpc_date, lines(DateTime, Sub_metering_3, col = "blue)
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
	dev.off()