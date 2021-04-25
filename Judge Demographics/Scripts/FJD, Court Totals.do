capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics/Judicial Directory"
/*Director of...
gen career_directorof = "" 
replace career_directorof = `v' if strpos(`v', "director")
replace `v' = "" if strpos(`v', "director") & career_director==1 & career_directorof!=""
*/ 
use "Datasets/Working_Federal Judicial Directory.dta", clear
/*browse irstname lastname nomyear* courtname* if ///
	courtname1=="supreme court of the united states" ///
	| courtname2=="supreme court of the united states" ///
	| courtname3=="supreme court of the united states" ///
	| courtname4=="supreme court of the united states" ///
	| courtname5=="supreme court of the united states" ///
	| courtname6=="supreme court of the united states" 
*/
capture drop scotus* 
gen scotus_nomyear = .
gen scotus = . 
gen scotus_senioryear = .
gen scotus_terminationyear = .
gen senioryear = . 
gen termyear = . 

foreach i of numlist 1/6 { 
replace scotus_nomyear = nomyear`i' if courtname`i'=="supreme court of the united states" 
replace scotus = 1 if courtname`i'=="supreme court of the united states" 
destring terminationyear`i', replace  
destring seniorstatusyear`i', replace
replace scotus_terminationyear = terminationyear`i' ///
	if courtname`i'=="supreme court of the united states" ///
	& terminationyear`i'!=. 
replace scotus_senioryear = seniorstatusyear`i' ///
	if courtname`i'=="supreme court of the united states" ///
	& seniorstatusyear`i'!=.
replace senioryear = seniorstatusyear`i' if senioryear==. 
replace termyear = terminationyear`i' if termyear==. 
	
}	

foreach i of numlist 1900/2019 { 
gen year_`i' = . 
replace year_`i' = 1 if nomyear1<=`i' /// 
	& year_`i'==.
replace year_`i' = 1 if nomyear2<=`i' ///
	& year_`i'==.  
replace year_`i' = 1 if nomyear3<=`i' ///
	& year_`i'==. 
replace year_`i' = 1 if nomyear4<=`i' ///
	& year_`i'==.
replace year_`i' = 1 if nomyear5<=`i' ///
	& year_`i'==.
replace year_`i' = 1 if nomyear6<=`i' ///
	& year_`i'==.
replace year_`i' = 0 if senioryear<`i'
replace year_`i' = 0 if termyear<`i' 	
} 


foreach i of numlist 1960/2019 { 
gen scotus_`i' = . 
replace scotus_`i' = 1 if nomyear1<=`i' /// 
	& courtname1=="supreme court of the united states" & scotus_`i'==.
replace scotus_`i' = 1 if nomyear2<=`i' ///
	& courtname2=="supreme court of the united states" & scotus_`i'==.  
replace scotus_`i' = 1 if nomyear3<=`i' ///
	& courtname3=="supreme court of the united states" & scotus_`i'==. 
replace scotus_`i' = 1 if nomyear4<=`i' ///
	& courtname4=="supreme court of the united states" & scotus_`i'==.
replace scotus_`i' = 1 if nomyear5<=`i' ///
	& courtname5=="supreme court of the united states" & scotus_`i'==.
replace scotus_`i' = 1 if nomyear6<=`i' ///
	& courtname6=="supreme court of the united states" & scotus_`i'==.
replace scotus_`i' = 0 if scotus_senioryear<`i'
replace scotus_`i' = 0 if scotus_terminationyear<`i' 	
} 

foreach i of numlist 2000/2019 { 
	quietly count if scotus_`i'==1 
	di `i' " has " r(N) " justices."
	} 
	
foreach i of numlist 1900/2019 { 
	quietly count if female==1 & year_`i'==1
	di `i' " has " r(N) " female judges."
	quietly count if female==0 & year_`i'==1
	di `i' " has " r(N) " male judges."
	} 

tab female 


