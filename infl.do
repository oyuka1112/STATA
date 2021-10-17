import excel using /Users/oyukaagi/Documents/Stock_Returns_1931_2002.xlsx, clear cellrange(A11:B257) firstr
tsset observation_date 
gen year = year(observation_date)
gen q = quarter(observation_date)
gen tyq = yq(year, q)
format tyq %tq
tsset tyq


gen lag_CPALTT01USQ661 = l.CPALTT01USQ661 
gen lag2_CPALTT01USQ661 = l2.CPALTT01USQ661 

gen inf = (ln(CPALTT01USQ661) - ln(l.CPALTT01USQ661))*100
gen infalt = (CPALTT01USQ661/l.CPALTT01USQ661-1)*100

*AR models (p =3)
reg inf l.inf l2.inf l3.inf 
replace = year =2021 if year ==.
replace q =3 if q ==.
replace q3 == if q3==.
gen tyq2 = yq(year, q)

format tyq2 %tq
tsset tyq2

*Prediction
predict pre_q2_2021 in 246/246, xb

predict pre_q3_2021 in 247/247, xb
