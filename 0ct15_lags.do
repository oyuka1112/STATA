import excel using /Users/oyukaagi/Documents/BAU_hicheel/2021fall_2022/EconometricsII/inf.xlsx,  clear cellrange(A11:B257) firstr

gen year = year(observation_date)
gen quarter = quarter(observation_date)

gen tyq = yq(year, q)
format tyq %tq
tsset tyq  
gen inf = 400*(ln(CPALTT01USQ661S) - ln(l.CPALTT01USQ661S))
set obs 247
replace year=2021 in 247
replace q = 3 in 247
replace tyq = yq(year, q)


*
regress inf l.inf l2.inf l3.inf l4.inf
*prediction
gen inf_2021q3 = 0.5943004 + 0.5686801* 8 + 0.010373 * 3.68 + 0.3341016 * 2.4 - 0.0588136 * 4.57 in 247
tsset tyq
*another way faster
predict pred_2021q3 in 247, xb 

*ARIMA
reg inf L(1/4).inf
ereturn list
scalar AIC_STATA = 2* e(ll) +2* 5
display in ye AIC_STATA
reg inf L(1/4).inf in 6/`= _N'
* `= _N' is number of observation

*with 3 lags.
*still starts with 6 because we wanrt to keep the obs 241
reg inf L(1/3).inf in 6/`= _N'
scalar AIC_STATA = 2* e(ll) +2* 4
*with 2 lags 
reg inf L(1/2).inf in 6/`= _N'
scalar AIC_STATA = 2* e(ll) +2* 3
*with 1 lags 
reg inf L(1/1).inf in 6/`= _N'
scalar AIC_STATA = 2* e(ll) +2* 2






