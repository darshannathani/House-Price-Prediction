---
title: "House Price Analysis"
author: "Darshan Nathani"
ID: "21IT472"
date: "`r Sys.Date()`"
output:
  pdf_document: default
  html_document: default
  word_document: default
---

First we load the data from CSV file

```{r}
getwd()
setwd('D:/Codes/R codes/Data/house')
data <- read.csv("D:/Codes/R codes/Data/house/kc_house_data.csv")
```

First let us look the houses that are built after 2000

```{r}
new <- subset(data,data$yr_built>2000)
write.csv(new,"new.csv")
print(head(new))
```

**The frequency of floors is**

```{r}
hist(data$floors,xlab = "Floors",col ="orange",border = "white",main="Frequency of Floors")
```

```{r}
plot(data$sqft_living,data$price,xlab = "Living space (sqft.)", ylab = "Price",col="orange", main="Price to living space",pch=16,cex=0.2,frame=FALSE,xlim=c(0,8000),ylim = c(0,4e+06))
lines(lowess(data$sqft_living, data$price), col = "black")
```

As we can see here as square feet of living space increases, the price of the following property also increases Now Lets look what affects the price more

```{r}

plot(data$bedrooms, data$price, col = "orange", pch = 16,cex=0.5, main="",xlim = c(0,12),xlab="No. of bedrooms and bathrooms",ylab="Price")
legend(9.432, 8e+06, legend=c("Bedrooms", "Bathrooms"), 
       fill = c("orange","#353436"))
points(data$bathrooms, data$price, col = "#353436",cex=0.5,pch=16)
```

Here we can see that more number of bedrooms do not influence the price of house, whereas price of house is carried with number of bathrooms.

Thus, Number of Bathrooms in a house has more influence than Number of bedrooms.

```{r}
library(ggplot2)
 ggplot(data = data, aes(x = condition, y = price, col=condition)) +
                        geom_point()+
                        coord_cartesian(xlim = c(0, 5))
```

Here We observe that condition of house peaks price at condition degree 3 and then gradually slopes down. Houses are more concentrated at condition degree 1 and 2.

```{r}
barplot(data$sqft_living,xlab="No. of houses",ylab="Living area (sqft.)",col="orange",
        main="House living area",xlim = c(1,25),ylim = c(0,5000))

```

Now we see pie chart of floor space

```{r}
new_data <- head(data,n=10)
pie(new_data$sqft_lot,labels = new_data$sqft_lot, col = rainbow(50),main = "Floor space pie chart",clockwise = TRUE)

```

Now lets see details of the house which is costliest and which is cheapest

```{r}
max<-max(data$price)
max1<-subset(data,data$price==max)
print(max1)
```

The cheapest option from data is

```{r}
min<-min(data$price)
min1<-subset(data,data$price==min)
print(min1)
```
