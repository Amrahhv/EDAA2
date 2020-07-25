
a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
g <- aggregate(Emissions ~ year,a, sum)

png("plot1.png",width=480,height=480,units="px")
barplot(
  (g$Emissions)/10^6,
  names.arg=g$year,
  xlab="Year",
  ylab="PM2.5 Emissions",
  main="Total Emissions"
)
dev.off()
