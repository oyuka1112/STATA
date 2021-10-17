*C7 import dataset
use http://fmwww.bc.edu/ec-p/data/wooldridge/mroz.dta, clear

*(i)
drop if inlf==0
summarize
regress lwage educ exper expersq nwifeinc age kidslt6 kidsge6, robust
*the coefficient is the highest 0.1 and the p value of 0, which is significant.

*(ii)
heckman lwage educ exper expersq nwifeinc age kidslt6 kidsge6, select(educ exper expersq nwifeinc age kidslt6 kidsge6) twostep

*(iii)
probit inlf educ exper expersq nwifeinc age kidslt6 kidsge6
predict yhat, xb
gen imr = normalden(yhat)/normal(yhat)
regress imr educ exper expersq nwifeinc age kidslt6 kidsge6, if inlf ==1


