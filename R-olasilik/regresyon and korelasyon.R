# Make some data
# X increases (noisily)
# Z increases slowly
# Y is constructed so it is inversely related to xvar and positively related to xvar*zvar
set.seed(955)
xvar <- 1:20 + rnorm(20,sd=3)
zvar <- 1:20/4 + rnorm(20,sd=2)
yvar <- -2*xvar + xvar*zvar/5 + 3 + rnorm(20,sd=4)

# Make a data frame with the variables
dat <- data.frame(x=xvar, y=yvar, z=zvar)
# Show first few rows
head(dat)

#Correlation
# Correlation coefficient
cor(dat$x, dat$y)
##-0,7695378 There is an inverse relationship

#Linear regression
# These two commands will have the same outcome:
fit <- lm(y ~ x, data=dat)  # Using the columns x and y from the data frame
fit <- lm(dat$y ~ dat$x)     # Using the vectors dat$x and dat$y
fit

# Get more detailed information:
summary(fit)