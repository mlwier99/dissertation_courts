cd "/home/michelle/Dropbox/Dissertation/Data/"

********************************************************************************
*Aggregating number of women and men on bench by year
use "Judge Demographics/Judicial Directory/Datasets/Working_Federal Judicial Directory.dta", clear 
gen deathage = deathyear - birthyear

*Filling in the firstnomination, termination vars for overall 
gen firstnom = nomyear1 
gen lasttermin = . 
foreach i of numlist 1/6 { 
	destring terminationyear`i', replace 
	destring seniorstatusyear`i', replace
	}
replace lasttermin = terminationyear6 if lasttermin!=. 
replace lasttermin = terminationyear5 if lasttermin==. 
replace lasttermin = terminationyear4 if lasttermin==. 
replace lasttermin = terminationyear3 if lasttermin==. 
replace lasttermin = terminationyear2 if lasttermin==. 
replace lasttermin = terminationyear1 if lasttermin==. 
replace lasttermin = deathyear if lasttermin==.
replace lasttermin = seniorstatusyear6 if lasttermin!=. 
replace lasttermin = seniorstatusyear5 if lasttermin==. 
replace lasttermin = seniorstatusyear4 if lasttermin==. 
replace lasttermin = seniorstatusyear3 if lasttermin==. 
replace lasttermin = seniorstatusyear2 if lasttermin==. 
replace lasttermin = seniorstatusyear1 if lasttermin==. 
gen years_served = lasttermin-firstnom
tab years_served

foreach i of numlist 1900/2019 { 
	gen float served_`i' = 0
	replace served_`i' = 1 if firstnom==`i'
	replace served_`i' = 1 if (`i'<=(firstnom+(lasttermin-firstnom)) & ///
		`i'>firstnom) 
	replace served_`i' = 0 if `i'>lasttermin
	replace served_`i' = 0 if `i'>deathyear

}

*Variable recording the total number of judges in a given year, and by gender.
foreach i of numlist 1900/2019 { 	
	*All 
	gen judgetotal_n_`i' = 0
	gen femalejudge_n_`i' = 0 
	gen malejudge_n_`i' = 0 
	replace judgetotal_n_`i' = 1 if served_`i'==1 
	replace femalejudge_n_`i' = 1 if female==1 & served_`i'==1 
	replace malejudge_n_`i' = 1 if female==0 & served_`i'==1 
}

*Variable for age since apppointment; important b/c not all retired judges 
*are recorded as retired/have a term date--if any judge is over a certain age, 
*or recordered as dead but still is "Active", then...yeah. That's for this. 
gen age_since_appointment = . 
replace age_since_appointment = firstnom - birthyear if age_since_appointment==.
replace age_since_appointment = . if deathyear<age_since_appointment 
replace age_since_appointment = . if deathyear<age_since_appointment 
replace age_since_appointment = . if age_since_appointment>(lasttermin-birthyear)

*Age in a given yera. I don't remember why I created this, but whatever. 
foreach i of numlist 1900/2019 { 
**	*Age in a given year 
	gen age_`i' = `i' - birthyear if birthyear<`i'
	replace age_`i' = . if deathage<age_`i'
	gen timeonbench_`i' = `i' - firstnom if firstnom<`i'
} 

*Dropping vars I don't need, otherwise I have so freaking many 
keep female femalejudge_n_* malejudge_n_* judgetotal_n_* ///
	 firstname lastname jid 
	
*Reshpaing from wide to long; this means I'll now have a year var and 
*an obvs for each year, rather than a variable for each year/var. 
*This takes a while because I have years going back...really far. 
quietly reshape long malejudge_n_ _femalejudge_n_ judgetotal_n_ ///
	, i(jid) j(year) 
*	
*Renaming 'cause it's messy.
quietly rename *_ *

*Collapsing. 
*This should give me the sum of, well, all the listed variables. 
collapse (sum) femalejudge_n malejudge_n judgetotal_n ///
	, by(year)

********************************************************************************
*Aggregating number of women and men nominated by year
use "Datasets/Working_Federal Judicial Directory.dta", clear 
gen nom_n = 1 
gen malejudge_n = 1 if female==0 
gen district_n = 0
gen circuit_n = 0
gen supreme_n = 0
gen fedother_n = 0
replace district_n = 1 if courttype1_code==3 
replace circuit_n = 1 if courttype1_code==2 
replace supreme_n = 1 if courttype1_code==1 
replace fedother_n = 1 if courttype1_code==4
gen district_female_n = 0
gen circuit_female_n = 0
gen supreme_female_n = 0
gen fedother_female_n = 0
gen district_male_n = 0
gen circuit_male_n = 0
gen supreme_male_n = 0
gen fedother_male_n = 0
replace district_female_n = 1 if courttype1_code==3 & female==1
replace circuit_female_n = 1 if courttype1_code==2 & female==1
replace supreme_female_n = 1 if courttype1_code==1 & female==1
replace fedother_female_n = 1 if courttype1_code==4 & female==1
replace district_male_n = 1 if courttype1_code==3 & female==0
replace circuit_male_n = 1 if courttype1_code==2 & female==0
replace supreme_male_n = 1 if courttype1_code==1 & female==0
replace fedother_male_n = 1 if courttype1_code==4 & female==0

	
collapse (sum) female *_n, by(nomyear1) //gives me the first mumber of 
	// women nominated [for the first time] in a given year. 
gen femalejudge_p = (female/nom_n)*100 
gen malejudge_p = (malejudge_n/nom_n)*100 
gen femalejudgedistrict_p = (district_female_n/district_n)*100
gen femalejudgecircuit_p = (circuit_female_n/circuit_n)*100
gen femalejudgescotus_p = (supreme_female_n/supreme_n)*100
gen femalejudgeotherfed_p = (fedother_female_n/fedother_n)*100
gen malejudgedistrict_p = (district_male_n/district_n)*100
gen malejudgecircuit_p = (circuit_male_n/circuit_n)*100
gen malejudgescotus_p = (supreme_male_n/supreme_n)*100
gen malejudgeotherfed_p = (fedother_male_n/fedother_n)*100

save "Percent of Federal Women Judges by Year.dta", replace 
