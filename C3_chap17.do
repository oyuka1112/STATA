*C3 import dataset
use http://fmwww.bc.edu/ec-p/data/wooldridge/fringe.dta, clear
*(i)For what percentage of the workers in the sample is pension equal to zero? 
*What is the range of pension for workers with nonzero pension benefits? 
*Why is a Tobit model appropriate for modeling pension?
count if pension ==0
summarize 
* 172/616 = 0.279 (percent)
summarize if pension!=0
*min = 7.28 max = 2880.27
*range = 2880.27 - 7.28= 2272.99
* Tobit is a good model because it has 28% 0 in the pension. In other words, we have lower limit of 0.
 
*(ii)
tobit pension exper age tenure educ depends married white male,ll(0) robust 
*Yes, the coefficient for white and male is the highest. But male has p = 0, white has p = 0.166,
* so we reject the hypothesis at significance level of 5% for white. Being male has sifnificant.

*(iii) Use the results from part (ii) to estimate the difference in expected pension benefits for a white male and a nonwhite female, 
*both of whom are 35 years old, are single with no dependents, have 16 years of education, 
*and have 10 years of experience.
*(ii) equation is P= 5.2*exper+(-4.63)*age + 36.02*tenure + 93.21*educ + 35.28 depends + 53.68married
*+144.09white+308.15male -1252.429 =
*white, male =1, 1
*P(1,1) = 5.2*10+(-4.63)*35 + 36.02*10 + 93.21*16 + 35.28 *0 + 53.68 *0
*+144.09* 1+308.15 * 1 -1252.429 = 940.9
*nonwhite female = 0,0
*P()= 5.2*10+(-4.63)*35 + 36.02*10 + 93.21*16 + 35.28 *0 + 53.68 *0
*+144.09* 0+308.15 * 0 -1252.429 = 488.7


*(iv) Add union to the Tobit model and comment on its significance.
tobit pension exper age tenure educ depends married white male union, ll robust
*Union has a big coefficient 439, and the p value of 0 which is significant.

*(v)
tobit peratio exper age tenure educ depends married white male union, ll robust
*If we use the peratio as the dependent variable, the white and male coefficient is not significant anymore
* as their p values are 0.663 and 0.556 respectively. 
