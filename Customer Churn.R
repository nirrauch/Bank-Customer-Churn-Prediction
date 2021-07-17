#########################
##Cleaning Data and EDA##
#########################

library(ISLR)
library(DataExplorer)
library(ggplot2)
require(dplyr)

setwd("C:/Users/archi/OneDrive/Documents/GitHub/STA380-69963/ML - Project 1")
raw_data = read.csv('bank_user_data.csv')
n = dim(raw_data)[1]

df = data.frame(raw_data)

#Understanding the structure of data
str(df)

#Checking if there are any null value in the dataframe
sapply(df,function(df) sum(is.na(df)))

##unique(df$CustomerId)
#Checking Unique value counts in each columns
sapply(df, n_distinct)

#Exploring unique values for few variables
unique(df$NumOfProducts)
unique(df$HasCrCard)
unique(df$IsActiveMember)
unique(df$Exited)

## To make data frames easily readable we have 
## removed unnecessary data fields
df = subset(raw_data, select = -c(RowNumber,CustomerId,Surname))
df = data.frame(df)

df$Exited = as.character(df$Exited)

#Plotting Histograms to understand the distributions
par(mfrow = c(1, 2))

hist(df$CreditScore)
hist(df$Age)
hist(df$Tenure, breaks = 5)
hist(df$Balance, breaks = 10)
hist(df$EstimatedSalary)

#Plotting Bar Charts to understand the Categorical Variables

ggplot(df, aes(x = factor(Gender))) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

ggplot(df, aes(x = factor(Geography))) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

ggplot(df, aes(x = factor(NumOfProducts))) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

ggplot(df, aes(x = factor(HasCrCard))) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

ggplot(df, aes(x = factor(IsActiveMember))) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

ggplot(df, aes(x = Exited)) + geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")+
  labs(title = "Exited vs Stayed", x = "Exit Status")

##Customer Churn by Region

table1 <- table(df$Exited, df$Geography, dnn=c("Exit Count", "Geography")) 
barplot(table1, ylab="Frequency", xlab="Geography", main="Side-By-Side Bar Chart", 
        col=c("turquoise4", "turquoise2" ), beside=TRUE, width=.2)

legend("right", title="Exited", legend= sort(unique(df$Exited)),
       fill =c("turquoise4", "turquoise2" ), box.lty=0)

## Geography vs Gender
ggplot(df, aes(x = factor(Geography))) +
  geom_bar(aes(fill = Gender),position="dodge") +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "black") +
  scale_fill_manual(values=c('#999999','#E69F00'))

## Customer Churn by Geography
ggplot(df, aes(x = Geography, fill = Exited)) +
  geom_bar(position="dodge") +
  geom_text(aes(label = ..count..),
            stat = "Count",position = position_dodge(0.8),
            vjust = 1.5, hjust = 0.9,
            colour = "black") +
  scale_fill_manual(values=c('#999999','#E69F00'))+
  labs(title = "Churn by Geography")


##Trying to plot in percent
ggplot(df, aes(x = Gender, fill = Exited)) +
  geom_bar(aes(y = ..prop..),position="dodge", stat = "count") +
  geom_text(aes(label = scales::percent(..prop..), y = ..prop..),
            stat = "count",position = position_dodge(0.8),
            vjust = -0.5, hjust = 0.7,
            colour = "black") +
  scale_fill_manual(values=c('#999999','#E69F00'))+
  scale_y_continuous(labels = scales::percent)+
  labs(y = 'Percent', x = 'Geography')

## Customer Churn by Gender
ggplot(df, aes(x = Gender, fill = Exited)) +
  geom_bar(position="dodge") +
  geom_text(aes(label = ..count..),
            stat = "Count",position = position_dodge(0.8),
            vjust = 1.5, hjust = 0.9,
            colour = "black") +
  scale_fill_manual(values=c('#999999','#E69F00'))+
  labs(title = "Churn by Gender")

#Density Plots

ggplot(df, aes(x=Age)) + 
  geom_density()

ggplot(df, aes(x=Age, color=Exited)) + 
  geom_density()+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  labs(title = "Density Plot: Age")

ggplot(df, aes(x=NumOfProducts, color=Exited)) + 
  geom_density()+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  labs(title = "Density Plot: #Products")

#Correlation Analysis

str(df)
df$Exited =as.numeric(df$Exited)
df$CreditScore =as.numeric(df$CreditScore)
df$Geography =as.numeric(df$Geography)
df$Gender =as.numeric(df$Gender)
df$Age =as.numeric(df$Age)
df$Tenure =as.numeric(df$Tenure)
df$NumOfProducts=as.numeric(df$NumOfProducts)
df$IsActiveMember =as.numeric(df$IsActiveMember)
df$HasCrCard =as.numeric(df$HasCrCard)

corr <- round(cor(df), 1)

install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot(
  corr,
  hc.order = TRUE,
  type = "lower",
  outline.color = "white",
  ggtheme = ggplot2::theme_gray,
  colors = c("#6D9EC1", "white", "#E46726")
)


ggcorrplot(corr,lab = TRUE)

#Violin Plots

install.packages("vioplot")
library(vioplot)

vioplot(df$Age ~ df$Exited, col = 2:length(levels(df$Exited)),
        xlab = "Exit Status", ylab = "Age")

vioplot(df$NumOfProducts ~ df$Exited, col = 2:length(levels(df$NumOfProducts)),
        xlab = "Exit Status", ylab = "#Products")
