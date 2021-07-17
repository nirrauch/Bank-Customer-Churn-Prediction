
# Bank Customer Churn Prediction
For a business in a stipulated period of time, customers can come under 3 major categories
 
1. Newly Acquired Customers
2. Existing Customers
3. Churned Customers

Customer churn/attrition is a tendency of customers to abandon a brand and stop being a paying client of a particular business.

Churned Customers means a direct loss of Marketing Acquisition Cost and possible revenue which could be capitalized post sale. Hence, predicting possible customers who can churn beforehand can help us save this loss. In order to retain them, they need to identify the customers as well as the reason of churning so that they can provide the customers with personalized offers and products. The aim of our project is to solve this problem for banking domain, by identifying which customers are at risk of churning and what are the reasons for churning with the help of supervised learning classification alogorithms.

# Data Set
In this project we are using a source of 10,000 bank records to predict the likelihood of a customer churn. You can  [click here ](https://www.kaggle.com/barelydedicated/bank-customer-churn-modeling) to get access to the raw data.

# Data Cleaning:
We removed unnecessary variables such as row number, customer names and IDs to make the dataframe more readable. Now, we are left with the below Columns:
* Age
* Balance
* CreditScore
* Estimated Salary
* Exited
* Geography
* Gender
* HasCrCard
* IsActiveMember
* NumberOfProducts
* Tenure

# EDA
As part of analyzing the data, we plotted different predictors against the target variable, i.e the number of people and tried to see if any patterns emerge. Two such plots are worth looking into.

---

### Customer Churn by Geography
![Churn by Geography](https://user-images.githubusercontent.com/44424472/126025672-7fc21789-9397-4d0d-9b30-ab5b07cd7ab7.PNG)

The smallest number of customers are from Germany, and they are also the most likely to leave the bank. Almost one in three German customers in our sample left the bank.

---

### Customer Churn by Gender
![Churn by Gender](https://user-images.githubusercontent.com/44424472/126026527-9e1451d4-8086-4b24-a130-75ce9ece0d78.PNG)

In percentage, female customers are more likely to leave the bank at 25%, compared to 16% of males.

---

### Customer Count by Exit Status
![Churn by Exit Status](https://user-images.githubusercontent.com/44424472/126026664-1e0ccd6e-db2b-4db6-bb89-4b94ab833b31.PNG)

The majority class, "Stays" (0), has around 80% data points and the minority class, "Exits" (1), has around 20% datapoints.

---

### Distribution Analysis:
![Density Plots](https://user-images.githubusercontent.com/44424472/126027391-d4f81e7c-0a2b-499e-9d7d-b6a8ca4cf5e1.PNG)

From density plots we can see that older customers and customer with more products more often leaving the bank. We can also observe that customer having only 2 products has very less churn rate.

---

### Correlation Matrix:
![Correlation Matrix](https://user-images.githubusercontent.com/44424472/126027783-15f50f3f-1cf5-43bc-85ed-319c947a0f7f.PNG)

Very weak correlations in general. Only weak positive correlation with age, very weak positive correlation with balance, and very weak negative correlations with number of products and membership.

---

### Violin Plots:
![Violin Plot](https://user-images.githubusercontent.com/44424472/126028343-94d8c39e-5619-488b-ad5a-325b71bc7b01.PNG)

Violin plots are confirming the earlier statement that older customers and customer with more products are more likely to leave the bank.
