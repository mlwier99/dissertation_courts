capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics/Judicial Directory"

********************************************************************************
*Aggregating number of women and men on bench by year
use "Datasets/Working_Federal Judicial Directory.dta", clear 
drop if deathyear<1970
gen deathage = deathyear - birthyear

***Creating variables to record the start of service and end of service 
*First nomination year for each cout
gen dist_firstnom = . 
gen circuit_firstnom = .
gen other_firstnom = . 
gen scotus_firstnom = . 

*Last termination year for each court
gen dist_lasttermin = . 
gen circuit_lasttermin = .
gen other_lasttermin = . 
gen scotus_lasttermin = . 

*Number of years served by court 
gen dist_years_served = .
gen circuit_years_served = .
gen other_years_served = .
gen scotus_years_served = .

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

*Filling in the nomination, termination, and years served vars for each court
foreach i of numlist 1/6 { 
	destring terminationyear`i', replace 
	destring nomyear`i', replace 
	destring seniorstatusyear`i', replace 
	gen other_nom`i' = nomyear`i' if courttype`i'_code==4
	gen dist_nom`i' = nomyear`i' if courttype`i'_code==3 
	gen circuit_nom`i' = nomyear`i' if courttype`i'_code==2 
	gen scotus_nom`i' = nomyear`i' if courttype`i'_code==1
	gen other_term`i' = terminationyear`i' if courttype`i'_code==4
	gen dist_term`i' = terminationyear`i' if courttype`i'_code==3 
	gen circuit_term`i' = terminationyear`i' if courttype`i'_code==2 
	gen scotus_term`i' = terminationyear`i' if courttype`i'_code==1
	
	*First nomination 
	replace dist_firstnom = dist_nom`i' if dist_firstnom==.
	replace circuit_firstnom = circuit_nom`i' if circuit_firstnom==.
	replace other_firstnom = other_nom`i' if other_firstnom==. 
	replace scotus_firstnom = scotus_nom`i' if scotus_firstnom==.
	
	replace dist_lasttermin = dist_term`i' if dist_lasttermin==.
	replace dist_lasttermin = seniorstatusyear`i' if dist_lasttermin==.
	replace circuit_lasttermin = circuit_term`i' if circuit_lasttermin==.
	replace circuit_lasttermin = seniorstatusyear`i' if circuit_lasttermin==.
	replace other_lasttermin = other_term`i' if other_lasttermin==. 
	replace other_lasttermin = seniorstatusyear`i' if other_lasttermin==. 
	replace scotus_lasttermin = scotus_term`i' if scotus_lasttermin==.
	replace scotus_lasttermin = seniorstatusyear`i' if scotus_lasttermin==.

	*Years Served
	replace dist_years_served = dist_lasttermin-dist_firstnom
	replace circuit_years_served = circuit_lasttermin-circuit_firstnom
	replace other_years_served = other_lasttermin-other_firstnom
	replace scotus_years_served = scotus_lasttermin-scotus_firstnom
	} 
	
*Dummy variables for whether or not a judge served in a given year.  
foreach i of numlist 1900/2019 { 
	gen float served_`i' = 0
	replace served_`i' = 1 if firstnom==`i'
	replace served_`i' = 1 if (`i'<=(firstnom+(lasttermin-firstnom)) & ///
		`i'>firstnom) 
	replace served_`i' = 0 if `i'>lasttermin
	replace served_`i' = 0 if `i'>deathyear
	*District
	gen float dist_served_`i' = 0
	replace dist_served_`i' = 1 if dist_firstnom==`i'
	replace dist_served_`i' = 1 if (`i'<=(dist_firstnom ///
		+(dist_lasttermin-dist_firstnom)) & `i'>dist_firstnom) 
	replace dist_served_`i' = 0 if `i'>dist_lasttermin
	replace dist_served_`i' = 0 if `i'>deathyear
	*Circuit 
	gen float circuit_served_`i' = 0
	replace circuit_served_`i' = 1 if circuit_firstnom==`i'
	replace circuit_served_`i' = 1 if (`i'<=(circuit_firstnom ///
		+(circuit_lasttermin-scotus_firstnom)) & `i'>circuit_firstnom) 
	replace circuit_served_`i' = 0 if `i'>circuit_lasttermin
	replace circuit_served_`i' = 0 if `i'>deathyear
	*Other 
	gen float other_served_`i' = 0
	replace other_served_`i' = 1 if other_firstnom==`i'
	replace other_served_`i' = 1 if ///
		(`i'<=(other_firstnom+other_years_served) & ///
		`i'>other_firstnom & `i'>other_lasttermin) 
	*Scotus 
	gen float scotus_served_`i' = 0
	replace scotus_served_`i' = 1 if scotus_firstnom==`i'
	
	replace scotus_served_`i' = 1 if (`i'<=(scotus_firstnom ///
		+(scotus_lasttermin-scotus_firstnom)) & `i'>scotus_firstnom) 
	replace scotus_served_`i' = 0 if `i'>scotus_lasttermin
	replace scotus_served_`i' = 0 if `i'>deathyear
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
	*District
	gen dist_judgetotal_n_`i' = 0
	gen dist_femalejudge_n_`i' = 0 
	gen dist_malejudge_n_`i' = 0 
	replace dist_judgetotal_n_`i' = 1 if dist_served_`i'==1 
	replace dist_femalejudge_n_`i' = 1 if female==1 & dist_served_`i'==1 
	replace dist_malejudge_n_`i' = 1 if female==0 & dist_served_`i'==1 
	*Circuit
	gen circuit_judgetotal_n_`i' = 0
	gen circuit_femalejudge_n_`i' = 0 
	gen circuit_malejudge_n_`i' = 0 
	replace circuit_judgetotal_n_`i' = 1 if circuit_served_`i'==1 
	replace circuit_femalejudge_n_`i' = 1 if female==1 & circuit_served_`i'==1 
	replace circuit_malejudge_n_`i' = 1 if female==0 & circuit_served_`i'==1 
	*Other
	gen other_judgetotal_n_`i' = 0
	gen other_femalejudge_n_`i' = 0 
	gen other_malejudge_n_`i' = 0 
	replace other_judgetotal_n_`i' = 1 if other_served_`i'==1 
	replace other_femalejudge_n_`i' = 1 if female==1 & other_served_`i'==1 
	replace other_malejudge_n_`i' = 1 if female==0 & other_served_`i'==1 
	*SCOTUS
	gen scotus_judgetotal_n_`i' = 0
	gen scotus_femalejudge_n_`i' = 0 
	gen scotus_malejudge_n_`i' = 0 
	replace scotus_judgetotal_n_`i' = 1 if scotus_served_`i'==1 
	replace scotus_femalejudge_n_`i' = 1 if female==1 & scotus_served_`i'==1 
	replace scotus_malejudge_n_`i' = 1 if female==0 & scotus_served_`i'==1 
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
	gen dist_timeonbench_`i' = `i' - dist_firstnom if dist_firstnom<`i'
	gen circuit_timeonbench_`i' = `i' - circuit_firstnom if circuit_firstnom<`i'
	gen other_timeonbench_`i' = `i' - other_firstnom if other_firstnom<`i'
	gen scotus_timeonbench_`i' = `i' - scotus_firstnom if scotus_firstnom<`i'
	}

*Dropping vars I don't need, otherwise I have so freaking many 
keep female other_malejudge_n_* other_femalejudge_n_* other_judgetotal_n_* ///
	dist_malejudge_n_* dist_femalejudge_n_* dist_judgetotal_n_* ///
	circuit_malejudge_n_* circuit_femalejudge_n_* circuit_judgetotal_n_* ///
	scotus_malejudge_n_* scotus_femalejudge_n_* scotus_judgetotal_n_* ///
	firstname lastname jid judgetotal_n_* femalejudge_n_* malejudge_n_* 
	
*Reshpaing from wide to long; this means I'll now have a year var and 
*an obvs for each year, rather than a variable for each year/var. 
*This takes a while because I have years going back...really far. 
reshape long other_malejudge_n_ other_femalejudge_n_ other_judgetotal_n_ ///
	dist_malejudge_n_ dist_femalejudge_n_ dist_judgetotal_n_ ///
	circuit_malejudge_n_ circuit_femalejudge_n_ circuit_judgetotal_n_ ///
	scotus_malejudge_n_ scotus_femalejudge_n_ scotus_judgetotal_n_ ///
	served_ malejudge_n_ femalejudge_n_ judgetotal_n_ ///
	, i(jid) j(year) 
*	
*Renaming 'cause it's messy.
rename *_ *

count if scotus_judgetotal_n==1 & year==2010
count if scotus_judgetotal_n==1 & year==2009
count if judgetotal_n==1 & year==1970
scalar judgetotal_n1970 = r(N)
count if judgetotal_n==1 & year==1980
scalar judgetotal_n1980 = r(N)
count if judgetotal_n==1 & year==1990
scalar judgetotal_n1990 = r(N)
count if judgetotal_n==1 & year==2000
scalar judgetotal_n2000 = r(N)
count if judgetotal_n==1 & year==2010
scalar judgetotal_n2010 = r(N)
count if judgetotal_n==1 & year==2018
scalar judgetotal_n2018 = r(N)

*Collapsing. 
*This should give me the sum of, well, all the listed variables. 
collapse (sum) other_malejudge_n other_femalejudge_n malejudge_n ///
	dist_malejudge_n dist_femalejudge_n  femalejudge_n ///
	circuit_malejudge_n circuit_femalejudge_n  ///
	scotus_malejudge_n scotus_femalejudge_n judgetotal_n ///
	other_judgetotal_n dist_judgetotal_n circuit_judgetotal_n ///
	scotus_judgetotal_n ///
	, by(year)

di judgetotal_n2018
list judgetotal_n if year==2018
di judgetotal_n2018
list judgetotal_n if year==2010
di judgetotal_n2010
list judgetotal_n if year==2000
di judgetotal_n2000
list judgetotal_n if year==1990
di judgetotal_n1990
list judgetotal_n if year==1980
di judgetotal_n1980
list judgetotal_n if year==1970
di judgetotal_n1970

*Percent Variables 
gen femalejudge_p = (femalejudge_n/judgetotal_n)*100
gen malejudge_p = (malejudge_n/judgetotal_n)*100
gen dist_femalejudge_p = (dist_femalejudge_n/dist_judgetotal_n)*100
gen dist_malejudge_p = (dist_malejudge_n/dist_judgetotal_n)*100
gen circuit_femalejudge_p = (circuit_femalejudge_n/circuit_judgetotal_n)*100
gen circuit_malejudge_p = (circuit_malejudge_n/circuit_judgetotal_n)*100
gen scotus_femalejudge_p = (scotus_femalejudge_n/scotus_judgetotal_n)*100
gen scotus_malejudge_p = (scotus_malejudge_n/scotus_judgetotal_n)*100
gen other_femalejudge_p = (other_femalejudge_n/other_judgetotal_n)*100
gen other_malejudge_p = (other_malejudge_n/other_judgetotal_n)*100

save "Judges per Year.dta", replace 


*All Federal Judgeships 
line femalejudge_n year || line malejudge_n year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	ytitle("Raw Number") xtitle("Year") ///
	title("Women and Men Judges in the Federal Courts")
graph bar (asis) femalejudge_n malejudge_n if year>1980, over(year, ///
	label(angle(75))) legend(label(1 "Women") label(2 "Men")) ///
	ytitle("Raw Number") stack ///
	title("Women and Men Judges in the Federal Courts") 
	
***Final Figures for Judges over Time 

drop if year<1970
line femalejudge_p year if year<2019 || line malejudge_p year if year<2019  ///
	, legend(label(1 "Female") label(2 "Male")) ///
	ylabel(0(10)100, labsize(medsmall) ///
	angle(360)) xlabel(1970(3)2018, labsize(medsmall) angle(75))  ///
	ytitle("Percent") xtitle("Year") ///
	title("Female and Male Judges in the Federal Courts")
	
*Combined but Separate 
gen circuit_gendergap = circuit_malejudge_p - circuit_femalejudge_p 
gen dist_gendergap = dist_malejudge_p - dist_femalejudge_p 
gen scotus_gendergap = scotus_malejudge_p - scotus_femalejudge_p 
gen gendergap = malejudge_p - femalejudge_p 
tab circuit_femalejudge_p year 

graph bar (asis) femalejudge_p if year<2019, over(year ///
	, label(angle(75) labsize(small))) title("Percent") ///
	title("Female Federal Judges") ///
	yla(0(10)50) ytitle("Percent")
	
line femalejudge_p year || line circuit_femalejudge_p year ///
	|| line dist_femalejudge_p year  ///
	, legend(label(2 "Circuit") label(3 "District") lab(1 "Overall")) ///
	ylabel(0(5)50, labsize(medsmall) ///
	angle(360)) xlabel(1970(3)2018, labsize(medsmall) angle(75))  ///
	ytitle("Percent") xtitle("Year") ///
	title("Female Federal Judges")	
	
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
	
gen avgage_all = (nomyear1 - birthyear) 
gen avgage_female = (nomyear1 - birthyear) if female==1 
gen avgage_male = (nomyear1 - birthyear) if female==0
gen dist_avgage_all = (nomyear1 - birthyear) if courttype1_code==3
gen dist_avgage_female = (nomyear1 - birthyear) if female==1 & courttype1_code==3
gen dist_avgage_male = (nomyear1 - birthyear) if female==0 & courttype1_code==3
gen circuit_avgage_all = (nomyear1 - birthyear) if courttype1_code==2
gen circuit_avgage_female = (nomyear1 - birthyear) if female==1 & courttype1_code==2
gen circuit_avgage_male = (nomyear1 - birthyear) if female==0 & courttype1_code==2
gen otherfed_avgage_all = (nomyear1 - birthyear) if courttype1_code==4
gen otherfed_avgage_female = (nomyear1 - birthyear) if female==1 &courttype1_code==4
gen otherfed_avgage_male = (nomyear1 - birthyear) if female==0 & courttype1_code==4
gen scotus_avgage_all = (nomyear1 - birthyear) & courttype1_code==1
gen scotus_avgage_female = (nomyear1 - birthyear) if female==1 & courttype1_code==1
gen scotus_avgage_male = (nomyear1 - birthyear) if female==0 & courttype1_code==1


gen avgyear_all = (nomyear1 - lawdegreeyear) 
gen avgyear_female = (nomyear1 - lawdegreeyear) if female==1 
gen avgyear_male = (nomyear1 - lawdegreeyear) if female==0
gen dist_avgyear_all = (nomyear1 - lawdegreeyear) if courttype1_code==3
gen dist_avgyear_female = (nomyear1 - lawdegreeyear) if female==1 & courttype1_code==3
gen dist_avgyear_male = (nomyear1 - lawdegreeyear) if female==0 & courttype1_code==3
gen circuit_avgyear_all = (nomyear1 - lawdegreeyear) if courttype1_code==2
gen circuit_avgyear_female = (nomyear1 - lawdegreeyear) if female==1 & courttype1_code==2
gen circuit_avgyear_male = (nomyear1 - lawdegreeyear) if female==0 & courttype1_code==2
gen otherfed_avgyear_all = (nomyear1 - lawdegreeyear) if courttype1_code==4
gen otherfed_avgyear_female = (nomyear1 - lawdegreeyear) if female==1 &courttype1_code==4
gen otherfed_avgyear_male = (nomyear1 - lawdegreeyear) if female==0 & courttype1_code==4
gen scotus_avgyear_all = (nomyear1 - lawdegreeyear) & courttype1_code==1
gen scotus_avgyear_female = (nomyear1 - lawdegreeyear) if female==1 & courttype1_code==1
gen scotus_avgyear_male = (nomyear1 - lawdegreeyear) if female==0 & courttype1_code==1

collapse (sum) female *_n (mean) *avgyear* *avgage*, by(nomyear1) //gives me the first mumber of 
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

save "Ages of Federal Judges by Year.dta", replace 



