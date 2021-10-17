*C2 load data

use http://fmwww.bc.edu/ec-p/data/wooldridge/loanapp.dta, clear

*(i)Estimate a probit model of approve on white. 
*Find the estimated probability of loan approval for both whites and nonwhites. 
*How do these compare with the linear probability estimates?

probit approve white, robust
*P(approve) = 0.784* white +0.547
*white =1 P() = 1.33 (Z score) so P = 0.91 (91%) for them to approve for white people
*non white white =0, P() = 0.547( Zscore) 70% for them to approve
logit approve white, robust

*(ii)Now add the variables hrat, obrat, loanprc, unem, male, married, dep, sch, cosign, chist, pubrec, mortlat1, mortlat2, 
*and vr to the probit model. Is there statistically significant evidence of discrimination against nonwhites?
probit approve white hrat obrat loanprc unem male married dep sch cosign chist pubrec mortlat1 mortlat2 vr, robust
*Yes, the coeeficient is 0.52 and z score is 5.40 with p value of 0.
*If we set the significant alpha at 5% p value is 0, so we rejct the null hypotheis and 
*say that white has been statistically significant.

*(iii) Estimate the model from part (ii) by logit. 
*Compare the coefficient on white to the probit estimate.
logit approve white hrat obrat loanprc unem male married dep sch cosign chist pubrec mortlat1 mortlat2 vr, robust
*The coeeficient is 0.937 on logit 

