#Problem:You want to test whether two samples are drawn from populations with different means, or test whether one sample is drawn from a population with a mean different
#from some theoretical mean.
#Solution
#We’ll also make a wide version of the sleep data; below we’ll see how to work with data in both long and wide formats.

sleep_wide <- data.frame(
  ID=1:10,
  group1=sleep$extra[1:10],
  group2=sleep$extra[11:20]
)
sleep_wide

#Comparing two groups: independent two-sample t-test
# Welch t-test
t.test(extra ~ group, sleep) 
# Student t-test
t.test(extra ~ group, sleep, var.equal=TRUE)
       #By default, t.test does not assume equal variances; instead of Student’s t-test, it uses the Welch t-test by default. Note that in the Welch t-test, df=17.776, 
       #because of the adjustment for unequal variances. To use Student’s t-test, set var.equal=TRUE.
# Sort by group then ID
sleep <- sleep[order(sleep$group, sleep$ID)]
       
# Paired t-test
t.test(extra ~ group, sleep, paired=TRUE)
      #You can also compare paired data, using a paired-sample t-test. You might have observations before and after a treatment, or of two matched subjects with different treatments.
      #Again, the t-test function can be used on a data frame with a grouping variable, or on two vectors. 
      #It relies the relative position to determine the pairing.
      #If you are using long-format data with a grouping variable, the first row with group=1 is paired with the first row with group=2. 
      #It is important to make sure that the data is sorted and there are not missing observations; otherwise the pairing can be thrown off. 
      #In this case, we can sort by the group and ID variables to ensure that the order is the same. For more on sorting see Sorting.

#Comparing a group against an expected population mean: one-sample t-test
t.test(sleep$extra, mu=0)
      #Suppose that you want to test whether the data in column extra is drawn from a population whose true mean is 0. 
      #In this case, the group and ID columns are ignored.
m=t.test(sleep_wide)
if(m$p.value<0.05){
  cat("reject ho,\n\n")
}else{
  cat("not reject ho,\n\n")
  
}

#1.step
#ho=U1=U2
#h1=U1=!U2

#2.step
#calculate test statistic

# t=~ 3,413
#3.step
#ho reject or not reject decision(with p value)
#p<a  Ho reject H1 accept / p>a Ho not reject

#4.step
#decision rule and sample test statistic compared: decision:0,002918<0,05 HO reject 
