a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
c <- grepl("vehicle", b$b.Level.Two, ignore.case=TRUE)
d <- b[c,]$b
e <- a[a$b %in% d,]
f <- e[e$fips=="24510",]
f$city <- "Baltimore City"
g <- e[e$fips=="06037",]
g$city <- "Los Angeles County"
h <- rbind(f,g)
library(ggplot2)
png("plot6.png",width=600,height=600,units="px")
l <- ggplot(h, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total Emission")) + 
  labs(title=expression("Motor Vehicle Source Emissions"))
print(l)
dev.off()
