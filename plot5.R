a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
v1 <- grepl("vehicle", b$b.Level.Two, ignore.case=TRUE)
v2 <- b[v1,]$b
v3 <- a[a$b %in% v2,]
k <- v3[v3$fips=="24510",]
library(ggplot2)
png("plot5.png",width=600,height=600,units="px")
l <- ggplot(k,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.30) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total Emission")) + 
  labs(title=expression("Motor Vehicle Emissions"))
print(l)
dev.off()
