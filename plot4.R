a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
c <- grepl("comb", b$b.Level.One, ignore.case=TRUE)
d <- grepl("coal", b$b.Level.Four, ignore.case=TRUE) 
e <- (c & d)
f <- b[e,]$b
g <- a[a$b %in% combustionb, ]
png("plot4.png",width=600,height=600,units="px")
library(ggplot2)
p <- ggplot(g,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="blue",width=0.30) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Emission")) + 
  labs(title=expression("PM"[2.5]*" Coal Emissions US"))
print(p)
dev.off()
