# import the data
getwd()
mov <- read.csv(file.choose())

# data exploration
head(mov)
summary(mov)
str(mov)

# activate ggplot2
install.packages("ggplot2")

# insight 1: most popular released day
ggplot(data=mov,aes(x=Day.of.Week)) + geom_bar()

# filter tops of genre to present
filter <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") |(mov$Genre == "comedy") | (mov$Genre == "drama") 

# filter top studios
filter2 <- mov$Studio %in% c("Buena Vista Studio","WB","Fox","Universal","Sony","Paramount Pictures")
mov2

#combine two filtered data
mov2 <- mov[filter & filter2,]
mov2

# get ready for the plot's data and aes layers 
p <- ggplot(data=mov2, aes(x=Genre,y=Gross...US))
p

# add geometries
q <- p + geom_jitter(aes(size=Budget...mill.,colour=Studio)) + geom_boxplot(alpha = 0.8,outlier.color = NA)  

#add labels
q <- q + xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
q

# use the theme
q <- q + theme(axis.title.x = element_text(colour = "Blue",size = 25),
               axis.title.y = element_text(colour = "Blue",size = 25),
               axis.text.x = element_text(size = 15),
               axis.text.y = element_text(size = 15),
               plot.title = element_text(size=35),
               legend.title = element_text(size = 15),
               legend.text = element_text(size = 15),
               text = element_text(family = "Comic Sans MS"))
q

# final revised
q$labels$size <- "Budget $M"
q
