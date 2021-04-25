********************************************************************************
********************************************************************************
********************************************************************************
***	Basics 
* Loading Working FJD
capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics" 
use "FJD/Datasets/Working_Federal Judicial Directory.dta", clear

* Extra packages 
// capture ssc install charlist // gives back character lists; verifies ascii/not
// capture ssc install strkeep // string manipulation 

********************************************************************************
********************************************************************************
********************************************************************************
***	Data: Reducing 

*Cutting down to those born >= 1950's youngest nominee
drop if deathyear<1950 // dropping those who died before 1950 

*Variable for if nominated in 1950 or after; which nom. 
gen nom_1950after = .  
foreach i of numlist 1950/2020 { 
	replace nom_1950after = 1 if nomyear1==`i' & nom_1950after==. 
	replace nom_1950after = 2 if nomyear2==`i' & nom_1950after==. 
	replace nom_1950after = 3 if nomyear3==`i' & nom_1950after==.
	replace nom_1950after = 4 if nomyear4==`i' & nom_1950after==.
	replace nom_1950after = 5 if nomyear5==`i' & nom_1950after==.
	replace nom_1950after = 6 if nomyear6==`i' & nom_1950after==.
} 
replace nom_1950after = 0 if nom_1950after==. 

*Dropping those outside year range. 
drop if nom_1950after==0  

*Getting the earliest birthyear of everyone included 
sum birthyear 
scalar earliest_birthyear = r(min)

********************************************************************************
********************************************************************************
********************************************************************************
***	*Professional Experience 

*Cursatory view, splitting variable. 
*browse professional*
split professionalcareer, gen(profcareer_) p(";")
split professionalcareer, gen(profjob_) p(";")

sort profcareer_1
browse profcareer_1
save "FJD/Datasets/Working2_Federal Judicial Directory.dta", replace 

/*
*do "FJD/Scripts/FJD, Jobs.do" 
do "FJD/Scripts/FJD, Careers.do" 
********************************************************************************
********************************************************************************
********************************************************************************
***	Year Variables

*Generating year variables for each, well, year 
di earliest_birthyear
foreach i of numlist 1884/2020 { 
gen year1_`i' = . // BASICS 
gen year2_`i' = . // CAREER
gen year3_`i' = . // JOB 
} 

* BASICS 
*Replacing year variables with numbers; create a year_`i'_2 if necessary 
foreach i of numlist 1884/2020 { 
	*Birth and death years. 
replace year1_`i' = 1 if `i'==birthyear 
replace year1_`i' = 4 if `i'>=deathyear 

	*Nomination years. 
replace year1_`i' = 5.1 if `i'==nomyear1 
replace year1_`i' = 5.2 if `i'>nomyear1 & `i'<terminationyear1
replace year1_`i' = 5.3 if `i'==terminationyear1
replace year1_`i' = 6.1 if `i'==nomyear2 
replace year1_`i' = 6.2 if `i'>nomyear2 & `i'<terminationyear2
replace year1_`i' = 6.3 if `i'==terminationyear2
replace year1_`i' = 7.1 if `i'==nomyear3 
replace year1_`i' = 7.2 if `i'>nomyear3 & `i'<terminationyear3
replace year1_`i' = 7.3 if `i'==terminationyear3
replace year1_`i' = 8.1 if `i'==nomyear4 
replace year1_`i' = 8.2 if `i'>nomyear4 & `i'<terminationyear4 
replace year1_`i' = 8.3 if `i'==terminationyear4
replace year1_`i' = 9.1 if `i'==nomyear5 
replace year1_`i' = 9.2 if `i'>nomyear5 & `i'<terminationyear5
replace year1_`i' = 9.3 if `i'==terminationyear5
replace year1_`i' = 10.1 if `i'==nomyear6 
replace year1_`i' = 10.2 if `i'>nomyear6 & `i'<terminationyear6
replace year1_`i' = 10.3 if `i'==terminationyear6

	*Degree years; no differentiation between types of degrees
replace year1_`i' = 11 if `i'==degreeyear1
replace year1_`i' = 12 if `i'==degreeyear2
replace year1_`i' = 13 if `i'==degreeyear3
replace year1_`i' = 14 if `i'==degreeyear4
replace year1_`i' = 15 if `i'==degreeyear5
}

* CAREER
foreach i of numlist 1884/2020 { 
	
*Private Practice
foreach k of numlist 1/5 { 
	replace year2_`i' = 20.1 if (`i'>=pp`k'_startyear) & (`i'<=pp`k'_endyear)
	}
*Clerk
foreach k of numlist 1/2 { 
	replace year2_`i' = 20.6 if (`i'>=clerk`k'_startyear) & ///
		(`i'<=clerk`k'_endyear)
	}
*Military
foreach k of numlist 1/3 { 
	replace year2_`i' = 20.2 if (`i'>=military`k'_startyear) & ///
		(`i'<=military`k'_endyear)
	}
*Education
foreach k of numlist 1/3 { 
	replace year2_`i' = 20.7 if (`i'>=military`k'_startyear) & ///
		(`i'<=military`k'_endyear)
	}
	 
} 

* JOB 
*/
********************************************************************************
********************************************************************************
********************************************************************************
***	Characteristic Coding 

gen foreignborn = 0 
replace foreignborn = 1 if  ///
	  birthstate=="italy" | | birthstate=="england" | birthstate=="japan" ///
	| birthstate=="germany" | birthstate=="mexico" | birthstate=="india" ///
	| birthstate=="colombia" | birthstate=="russia" | birthstate=="spain" ///
	| birthstate=="venezuela" | birthstate=="antigua" | birthstate=="france" ///
	| birthstate=="australia" | birthstate=="brazil" | birthstate=="denmark" ///
	| birthstate=="ecuador" | birthstate=="hong kong" | birthstate=="hungary" ///
	| birthstate=="latvia" | birthstate=="nigeria" | birthstate=="poland" ///
	| birthstate=="sierra leone" | birthstate=="sweden" | birthstate=="cuba" ///
	| birthstate=="syria" | birthstate=="taiwan" | birthstate=="ukraine" ///
	| birthstate=="romania" | birthstate=="saudi arabia" 

tab foreignborn 
tab nomyear1 if foreignborn==1, sort
*Attending an Ivy League school at some point 
gen conference_ivy = 0 
foreach v of varlist school1 school2 school3 school4 school5 { 
replace conference_ivy = 1 ///
	if strpos(`v',"brown university") ///
	| strpos(`v',"columbia") ///
	| strpos(`v',"cornell") ///
	| strpos(`v',"yale") ///
	| strpos(`v',"harvard") ///
	| strpos(`v',"dartmouth college") ///
	| strpos(`v',"princeton") ///
	| strpos(`v',"university of pennsylvania")
	}
		
*Having a degree before nomination 
gen degree_nom = nomyear1 - degreeyear1
replace degree_nom = nomyear1 - degreeyear2 if degreeyear1==. & degree_nom==.
replace degree_nom = nomyear1 - degreeyear3 if degreeyear2==. & degree_nom==.
replace degree_nom = nomyear1 - degreeyear4 if degreeyear3==. & degree_nom==.
replace degree_nom = nomyear1 - degreeyear5 if degreeyear4==. & degree_nom==.


********************************************************************************
********************************************************************************
********************************************************************************
***	Frequency of Characteristics 

tab birthyear
tab nomyear1

tab nomyear1 female if nomyear1>1949
tab birthstate if nomyear1>1949, sort 
tab degree1 if nomyear1>1949, sort 
tab school1 if nomyear1>1949, sort 



save "FJD/Datasets/Working_Federal Judicial Directory.dta", replace 




sort degree_nom 
browse degree_nom nomyear1 degreeyear* if nomyear1>1949 
browse jid *name nomyear1 birthyear degree* if degreeyear1==.

tab degree_nom

tab degree1 if
/* 
********************************************************************************
********************************************************************************
********************************************************************************
***	Dropping
*Keeping only ``useful'' variables 
drop years_degreecourt* 
drop working_military military_years_*
drop working_clerk clerk_years_*
drop working_pp pp_years_*
keep /// 
	year* lastname middlename firstname suffix female jid nid ///
	courttype* courtname* raceorethnicity appointingpresident* ///
	partyofappointingpresident* abarating* seatid* school* ///
	degree* degreeyear* profession* *_code 
	

/*

**** Codes for years 
1 - birth 
4 - death 
5 - nomyear1 
6 - nomyear2 
7 - nomyear3 
8 - nomyear4 
9 - nomyear5 
10 - nomyear6
11 - first degree 
12 - second degree
13 - third degree
14 - fourth degree
15 - fifth degree
20 - career 
	20.1 - private practice 
	20.2 - military 
	20.3 - state gov
	20.4 - federal gov 
	20.5 - federal bureaucracy 
	20.6 - court clerk
	20.7 - education
	20.8 - attorney of any kind
	20.9 - judge
	20.11 - sports
	20.12 - state judge 
	20.13 - federal judge
	20.14 - criminal Justice
	20.15 - other legal (secretary, researcher, reporter, etc) 
	20.16 - local government
	20.17 -  
	20.18 - 
	20.19 -  
	20.21 -
	20.22 -
	20.23 -
	20.24 -
	20.25 -
30 - job 
	30.1 - 
	30.2 - 
	30.3 - 
	30.4 - 
	30.5 - 
	30.6 - 
	30.7 - 
	30.8 - 
	30.9 - 
	30.11 -
	30.12 -
	30.13 -
	30.14 -
	30.15 -
	30.16 -
	30.17 -
	30.18 -
	30.19 -
	30.21 -
	30.22 -
	30.23 -
	30.24 -
	30.25 -

keep /// 
	*name suffix female jid nij ///
	courttype* courtname* raceorethnicity appointingpresident* ///
	partyofappointingpresident* abarating* *chiefjust* seatid* school* ///
	degree* degreeyear* profession* 
