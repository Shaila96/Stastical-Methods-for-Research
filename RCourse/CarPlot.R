# # Define the cars vector with 5 values
# cars <- c(1, 3, 6, 4, 9)
# 
# # Graph the cars vector with all defaults
# plot(cars)


# Define the cars vector with 5 values
cars <- c(1, 3, 6, 4, 9, 11, 20)
trucks <- c(2, 5, 4, 5, 12, 30)

class(cars)

# Graph cars using blue points overlayed by a line
plot(cars, type="o", col="blue")

# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=24, lty=2, col="red")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

