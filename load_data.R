prepareData <- function() {
    cacheFile <- "data_raw.csv"
    if (file.exists(cacheFile)) {
        tbl <- read.csv(cacheFile)
        tbl$DateTime <- strptime(tbl$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else {
        tbl <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
        tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(tbl, cacheFile)
    }
    tbl
}
