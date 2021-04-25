cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics" 

use "FJD/Datasets/Working_Federal Judicial Directory.dta", clear

gen active = 1

foreach v of varlist deathyear { 
	replace active = 0 if `v'!=.
}

count if seniorjudge==1
count if seniorjudge==1 &  deathyear>2017
count if seniorjudge==1 &  deathyear==.

lab var seniorjudge "Senior Judge" 
lab var active "Active Judge" 
lab def binary 0 "No" 1"Yes" 
lab def active 0"Inactive Judges" 1"Active Juges" 
lab def seniorjudge 0"Judges" 1"Senior Judges"
lab val active active 
lab val seniorjudge seniorjudge

estpost tab seniorjudge active, label 
esttab using "/home/michelle/Desktop/class.tex", unstack nonum replace 
 
tab active if active==1
scalar active_notdead = r(N)

count if active==1
count if active==1 & seniorjudge==0
tab seniorjudge active

codebook senior*
tab nomyear1 if active==1 
count if active==1 & highestcourt_appeal!=1
count if active==1 & terminatedjudge==0 & highestcourt_appeal!=1
count if active==1 & seniorjudge==0 
scalar active_notdead = r(N)

foreach v of varlist seniorstatusdate1 { 
	replace active = 0 if `v'!=""
}


tab  
tab active 

foreach v of varlist seniorstatusdate* terminationdate* { 
	replace active = 0 if `v'!=""
}


di (860/1302)*100
di (265/1302)*100
di (2/1302)*100
di (142/1302)*100
di (92/1302)*100
di (29/1302)*100
di (11/1302)*100
di (956/1302)*100
di (346/1302)*100

di (1302/860)*100
di (265/860)*100
di (2/860)*100
di (142/860)*100
di (92/860)*100
di (29/860)*100
di (11/860)*100
di (956/860)*100
di (346/860)*100

di (1302/890)*100
di (265/890)*100
di (2/890)*100
di (142/890)*100
di (92/890)*100
di (29/890)*100
di (11/890)*100
di (956/890)*100
di (346/890)*100

di 860 - 2 - 142 - 92 - 29 
di  2 + 142 + 92 + 29 

