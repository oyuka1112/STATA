*E4.4 load dataset
use /Users/oyukaagi/Documents/Growth.dta, clear
*a)
scatter growth tradeshare
*b)
scatter growth tradeshare if country_name=="Malta"
*Malta is growth 6.65 tradeshare is 2. Almost an outlier
*c)
regress growth tradeshare, robust
*slope is 2.31. intercept is 0.64
*Country with tradeshare of 0.5 and 1
*  2.31x0.5 + 0.64 = 1.795 growth
*  2.31x1 + 0.64 = 2.95
*d) 
regress growth tradeshare if (country_name!="Malta"), robust
*G = 1.68 tradeshare +0.95
*If tradeshare = 0.5 G= 1.79
*If tradeshare = 1 G= 2.63
*e)
*If we exclude the outlier the scope and the intercept will be more accurate
*f)
*It should be excluded in order to get a good analysis



