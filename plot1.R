library(RMySQL)

#Store the data in a sql table(on disk)and create/connect to a database named "data_db.sqlite"

	con <- dbConnect(RSQLite::SQLite(), dbname = "data_db.sqlite")

#Write txt file into the database

	dbWriteTable(con, name = "data_table", value = "household_power_consumption.txt", row.names = FALSE, header = TRUE, sep = ";")
	hpc <- dbGetQuery(con, "SELECT * FROM data_table WHERE Date in ('1/2/2007', '2/2/2007')")

#As suggested in the assignment description Date and Time Variables (character type) are converted to Date and Time

	hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time) format = "%d/%m/%Y %H:%M:%S")

#Open a png file in the workdirectory, create a graph and save the file

	png(file = "plot1.png", width = 480, height = 480, units = "px")
	hist(hpc$Global_active_power, col = "red", breaks = 15, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
 	dev.off()