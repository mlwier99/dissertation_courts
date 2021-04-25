*Labe definitions 
lab def district ///
	0"Entire" 1"Central" 2"South" 3"North" 4"East" 5"West" 6"Middle", replace 
lab def black 1"Black" 0"Not-Black", replace 
lab def white 1"White" 0"Not-White", replace 
lab def asian 1"Asian" 0"Not-Asian", replace 
lab def nativeamerican 1"Aboriginal" 0"Not-Aboriginal", replace 
lab def latino 1"Latino" 0"Not-Latino" , replace 
lab def female 1"Female" 0"Male", replace
lab def abarating ///
	1"exceptionally not qualified" 2"not qualified" 3"qualified" ///
	4"well qualified" 5"exceptionally well qualified", replace 
lab def courttype ///
	1 "Supreme Court" ///
	2 "Court of Appeals"  ///
	3 "District Court"  ///
	4 "Other"  ///
	5 "Old Circuit Courts", replace 
lab def highestcourt 1 "Supreme" 2 "Circuit" 3 "District", replace 
lab def circuit 12"DC" 13"FED", replace 


*Labeling Values 	
lab val highestcourt_appeal highestcourt
lab val highestcourt_pay highestcourt 
lab val race_black black 
lab val race_white white
lab val race_asian asian
lab val race_nativeamer nativeamerican
lab val ethnic_latino latino
lab val female female 
foreach i of numlist 1/6 {
	lab val courttype`i'_code courttype
	lab val courtdistrict`i'_code district 
	lab val abarating`i'_code abarating
}

*Labeling Variables
foreach v of varlist nomyear* { 
	lab var `v' "Nomination Year "`i' 
} 
foreach v of varlist courttype*_code { 
	lab var `v' "Court Type "`i' 
} 
foreach v of varlist circuit*_code { 
	lab var `v' "Circuit Court "`i' 
} 
foreach v of varlist age_degree* { 
	lab var `v' "Age at Law School Graduation "`i' 
} 
foreach v of varlist age_nom* { 
	lab var `v' "Age at Nomination "`i' 
} 
foreach v of varlist years_degreecourt* { 
	lab var `v' "Law School to Nomination, Years"`i' 
} 
foreach v of varlist courtdistrict*_code { 
	lab var `v' "District "`i'
} 
foreach v of varlist seniorstatusyear* { 
	lab var `v' "Senior Status, Year "`i'
} 
foreach v of varlist terminationyear* { 
	lab var `v' "Termination, Year "`i'
} 
foreach v of varlist yearsonbench_term* { 
	lab var `v' "Years Served (Termination) "`i'
} 
foreach v of varlist yearsonbench_ss* { 
	lab var `v' "Years Served (Senior Status)"`i'
} 
foreach v of varlist abarating*_code { 
	lab var `v' "ABA Rating "`i'
} 
lab var lawdegreeyear "Law School Graduation Year" 
lab var race_black "Race: Black"
lab var race_white "Race: White"
lab var race_nativeamer "Race: Native American"
lab var race_asian "Race: Asian"
lab var ethnic_latino "Ethnicity: Latino"
