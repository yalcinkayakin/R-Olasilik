# Analysis of Variance Example (ANOVA)
# MyBookSucks.Com "PartyMoreStudyLess

Group1 <- c(85,86,84,82,83)
Group2 <- c(74,72,70,75,79)
Group3 <- c(69,66,65,63,67)
Group4 <- c(47,57,55,58,53)

Combined_Groups <- data.frame(cbind(Group1, Group2, Group3,Group4)) # combines the data into a single data set.
Combined_Groups # shows spreadsheet like results
summary(Combined_Groups)  # min, median, mean, max

Stacked_Groups <- stack(Combined_Groups)
Stacked_Groups #shows the table Stacked_Groups

Anova_Results <- aov(values ~ ind, data = Stacked_Groups) 
tk <-TukeyHSD(Anova_Results)
tk
plot(tk)

