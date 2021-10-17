*4.1 load dataset
use /Users/oyukaagi/Documents/CPS2015.dta, clear
*a)
regress ahe age, robust
*slope is 0.552 that means if the worker age by 1, the average hourly earning increase this much.
*b)
*Bob 26 years E = 26x0.552+4.88 = 19.232
*Alexis 30 years old E = 30x 0.552+4.88 = 21.44
*c)
*Yes age is a goof factor for earning. The coefficient is significant because p value is zero and we reject the null hypothesis
*so that the coefficient is significant.
