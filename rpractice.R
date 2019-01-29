# read data  and print out 
data <- read.table("sequencing-costs.csv", sep=",", header = T)

dim(data)
data[1:5, 1:3]

#package 'pastecs' has an easy to use function called stat.desc
install.packages("pastecs")
library(pastecs)

# stats summary
options(scipen=100)
options(digits=2)
stat.desc(data)


# calc correlation x and y
cor(data[,2], data[,3])
# graph prices
plot(data[,2], data[,3], xlab = "cost of mb", ylab = "cost of genome")

# find fit line ( linear regression)
lmfit1 <- lm(data$Cost.per.Mb ~ data$Cost.per.Genome)
summary(lmfit1)

coefficients(lmfit1)

predict.lmfit1 <- predict(lmfit1)

# plot fit line
plot(data[,2], data[,3], xlab = "cost of mb", ylab = "cost of genome")
abline(lmfit1)

# write results to file 
sink("result.txt")
print(summary(lmfit1))
sink()  # returns output to the console
