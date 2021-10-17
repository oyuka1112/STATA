*C1 Import the dataset
use "http://fmwww.bc.edu/ec-p/data/wooldridge/pntsprd.dta", clear
*(i) OLS
regress favwin spread, robust

*(ii) OLS Test Ho: bo=0.05
*% level of significance the confidence interval is between 0.155 and 0.231
*So, reject the hypothesis

*(iii)
*Model = 0.019 spread + 0.577
* If spread =10 : P() = 0.019x10+0.577 =0.767

*(iv) probit
probit favwin spread, robust

*(v)
*If spread = 10: P() = 10x 0.092 - 0.011 = 0.91

*(vi)
probit favwin spread favhome fav25 und25, robust


