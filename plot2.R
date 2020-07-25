a <- readRDS("Source_Classification_Code.rds")
b <- readRDS("summarySCC_PM25.rds")

baltimore <- b[b$fips=="24510",]

total <- aggregate(Emissions ~ year, baltimore,sum)

png("plot2.png",width=480,height=480,units="px")

barplot(
  total$Emissions,
  names.arg=total$year,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total Baltimore"
)

dev.off()
