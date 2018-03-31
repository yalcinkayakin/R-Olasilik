data <- read.table(header=TRUE, text='
                   condition result
                   control      0
                   control      0
                   control      0
                   control      0
                   treatment    1
                   control      0
                   control      0
                   treatment    0
                   treatment    1
                   control      1
                   treatment    1
                   treatment    1
                   treatment    1
                   treatment    1
                   treatment    0
                   control      0
                   control      1
                   control      0
                   control      1
                   treatment    0
                   treatment    1
                   treatment    0
                   treatment    0
                   control      0
                   treatment    1
                   control      0
                   control      0
                   treatment    1
                   treatment    0
                   treatment    1
                   ')

#Tests of goodness-of-fit (expected frequency)
#Chi-square test
# Create contingency table for result, which contains values 0 and 1
# The column names are "0" and "1" (they're not actually values in the table)
ct <- table(data$result)
ct

# Perform Chi-square test
chisq.test(ct)

# Probability table - must sum to 1
pt <- c(.75, .25)
chisq.test(ct, p=pt)

#Tests of independence (comparing groups)
ct <- table(data$condition, data$result)
ct

chisq.test(ct)

chisq.test(ct, correct=FALSE)
m=chisq.test(ct)
if(m$p.value<0.05){
  cat("reject ho,\n\n")
}else{
  cat("not reject ho,\n\n")
  
}


