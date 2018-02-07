#--------------- Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)


#--------------- Solution

#Task1
#Profit for each month
profit_monthly <- revenue - expenses
profit_monthly

#Task2
#Profit after tax for each month (the tax rate is 30%)
profit_after_tax <- round(profit_monthly*0.7, 2)
profit_after_tax

#Task3
#Profit margin for each month - equals to profit a after tax divided by revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit_margin <- round(profit_after_tax / revenue, 2) * 100
profit_margin

#Task4
#Good months - where the profit after tax was greater than the mean for the year

#profit_mean_year <- sum(profit_after_tax) / length(profit_after_tax)
#month_condition <- profit_after_tax - profit_mean_year
#good_months <- profit_after_tax[profit_after_tax>0]

profit_mean_year <- mean(profit_after_tax)
good_months <- profit_mean_year > profit_after_tax
good_months

#Task5
#Bad months - where the profit after tax was less than the mean for the year
#bad_months <- profit_after_tax[profit_after_tax<=0]
bad_months <- !good_months
bad_months

#Task6
#The best month - where the profit after tax was max for the year
max_month <- profit_after_tax == max(profit_after_tax)
max_month

#Task7
#The worst month - where the profit after tax was min for the year
min_month <- profit_after_tax == min(profit_after_tax)
min_month



#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit_monthly.1000
profit_after_tax.1000
profit_margin
good_months
bad_months
max_month
min_month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit_monthly.1000,
  profit_after_tax.1000,
  profit_margin,
  good_months,
  bad_months,
  max_month,
  min_month
)

#Print The Matrix
M




