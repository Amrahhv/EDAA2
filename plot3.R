a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
baltimore <- a[a$fips=="24510",]
TotalBaltimore <- aggregate(Emissions ~ year, baltimore,sum)
png("plot3.png",width=480,height=480,units="px")
library(ggplot2)
p <- ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore"))
print(p)
dev.off()
