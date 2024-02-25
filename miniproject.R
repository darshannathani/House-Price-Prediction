library(ggplot2)
getwd()
setwd('C:/Users/student.B305_7/Documents/21IT472/Data/house')
data <- read.csv("C:/Users/student.B305_7/Documents/21IT472/Data/house/kc_house_data.csv")
#View(data)
p <- ggplot(data = data, aes(x = price, y = bedrooms,color="orange")) +
  geom_point() + ylim(0, 10) +
  labs(x = "V",y = "Close",title = "Year built to Price chart") +
  stat_smooth(method = "lm",col = "red",)
print(p)
barplot(data$)