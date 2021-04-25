*capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics/Judicial Directory"
*use "Datasets/Federal Judiciary Directory.dta", clear 


*Cleaning the names 
foreach v of varlist lastname firstname middlename suffix { 
	replace `v' = stritrim(ustrtrim(lower(`v')))
	}
	
*Cleaning other variables (string to missing) 
*foreach v of varlist _all { 
	*replace `v' = lower(`v')
	*}
	
foreach v of varlist *id birth* death* degreeyear* serviceaschiefjudge* { 
	replace `v' = "." if strpos(`v',"na")
	replace `v' = "." if strpos(`v',"ca")
	replace `v' = "." if strpos(`v',"ca.")
	replace `v' = "." if strpos(`v',"-")
	destring `v', replace 
	}
	
* Race/Ethnicity 
tab raceorethnicity
tab raceorethnicity, gen(race_code) 
describe race_code*

rename race_code1 race_black 
rename race_code12 race_white 
rename race_code5 race_asian 
rename race_code4 race_nativeamer
rename race_code9 ethnic_latino 

replace race_black = 1 if race_code2==1 //black/hispanic
replace ethnic_latino = 1 if race_code2==1  //black/hispanic 
replace race_black = 1 if race_code3==1 //black/white
replace race_white = 1 if race_code3==1 //black/white 
replace race_asian = 1 if race_code8==1 // asian/white 
replace race_white = 1 if race_code8==1 //asian/white 
replace race_asian = 1 if race_code11==1 //pacific islander/white
replace race_white = 1 if race_code11==1  //pacific islander/white
replace ethnic_latino = 1 if race_code6==1 //hispanic/asian
replace race_asian = 1 if race_code6==1 // hispanic/asian 
replace race_asian = 1 if race_code7==1 //asian/pacific islander 
replace ethnic_latino = 1 if race_code10==1 //hispanic/white 
replace race_white = 1 if race_code10==1 //hispanic/white 

drop race_code2-race_code3 race_code6-race_code8 race_code10-race_code11

*ABA Ratings
lab def abarating 1"exceptionally not qualified" 2"not qualified" 3"qualified" ///
	4"well qualified" 5"exceptionally well qualified" 

foreach i of numlist 1/6 {
	gen abarating`i'_code = ., after(`v')
	replace abarating`i'_code = 5 if abarating`i'=="exceptionally well qualified"
	replace abarating`i'_code = 4 if abarating`i'=="well qualified"
	replace abarating`i'_code = 3 if abarating`i'=="qualified"
	replace abarating`i'_code = 2 if abarating`i'=="not qualified"
	replace abarating`i'_code = 2 if abarating`i'=="not qualified by reason of age"
	replace abarating`i'_code = 1 if abarating`i'=="exceptionally not qualified"
	lab val abarating`i'_code abarating 
	count if abarating`i'_code==. & abarating`i'!=""
	scalar wrong_`i' = r(N)
	}
di wrong_1 wrong_2 wrong_3 wrong_4 wrong_5 wrong_6
	
*Gender--specifically, female 
gen female = 0, after(gender)
replace female = 1 if gender=="female"
lab var female "Woman"	
tab female

*Court code 
lab def courttype ///
	1 "Supreme Court" ///
	2 "Court of Appeals"  ///
	3 "District Court"  ///
	4 "Other"  ///
	5 "Old Circuit Courts", replace 
	
*Codes for each level of the system 
foreach i of numlist 1/6 {
	gen courttype`i'_code = ., after(`v')
	replace courttype`i'_code = 1  ///
		if courttype`i'=="supreme court"
	replace courttype`i'_code = 2  ///
		if courttype`i'=="u.s. court of appeals"
	replace courttype`i'_code = 3  ///
		if courttype`i'=="u.s. district court"
	replace courttype`i'_code = 4  ///
		if courttype`i'=="other" 
	replace courttype`i'_code = 5 ///
		if courttype`i'=="u.s. circuit court (1801-1802)"
	replace courttype`i'_code = 5  ///
		if courttype`i'=="u.s. circuit court (1869-1911)"
	replace courttype`i'_code = 5  ///
		if courttype`i'=="u.s. circuit court (other)"
	lab val courttype`i'_code courttype 
	count if courttype`i'_code==. & courttype`i'!=""
	scalar wrong_`i' = r(N)
	}
di wrong_1 wrong_2 wrong_3 wrong_4 wrong_5 wrong_6
	
*Highest court 
lab def highestcourt 1 "Supreme" 2 "Circuit" 3 "District" 

gen highestcourt_appeal = . //other courts as circuits
gen highestcourt_pay = . //other courts as 

foreach v of varlist courtname* {  
	replace highestcourt_appeal = 2 if `v'=="court of claims"  ///
		& highestcourt_pay==.
	replace highestcourt_appeal = 2 if `v'=="court of international trade"  ///
		& highestcourt_pay==.
	replace highestcourt_appeal = 2 if `v'=="u.s. court of claims"  ///
		& highestcourt_pay==.
	replace highestcourt_appeal = 2 if `v'=="u.s. court of international trade"  ///
		& highestcourt_pay==.
	// early Federal Circuit 
	replace highestcourt_appeal = 2 if strpos(`v', "customs") ///
		& highestcourt_pay==.

	replace highestcourt_pay = 3 if `v'=="court of claims"  ///
		& highestcourt_pay==.
	replace highestcourt_pay = 3 if `v'=="court of international trade"  ///
		& highestcourt_pay==.
	replace highestcourt_pay = 3 if `v'=="u.s. court of claims"  ///
		& highestcourt_pay==.
	replace highestcourt_pay = 3 if `v'=="u.s. court of international trade"  ///
		& highestcourt_pay==.
	// early Federal Circuit 
	replace highestcourt_pay = 2 if strpos(`v',"customs") ///
		&  highestcourt_pay==.
} 
foreach v of varlist courttype*_code { 
	replace highestcourt_appeal = 1 if `v'==1 & ///
		(`v'<highestcourt_appeal | highestcourt_appeal==.)
	replace highestcourt_appeal = 2 if `v'==2 & ///
		(`v'<highestcourt_appeal | highestcourt_appeal==.)
	replace highestcourt_appeal = 2 if `v'==5 & ///
		(`v'<highestcourt_appeal | highestcourt_appeal==.)
	replace highestcourt_appeal = 3 if `v'==3 & ///
		(`v'<highestcourt_appeal | highestcourt_appeal==.)
	replace highestcourt_pay = 1 if `v'==1 & ///
		(`v'<highestcourt_pay | highestcourt_pay==.)
	replace highestcourt_pay = 2 if `v'==2 & ///
		(`v'<highestcourt_pay | highestcourt_pay==.)
	replace highestcourt_pay = 2 if `v'==5 & ///
		(`v'<highestcourt_pay | highestcourt_pay==.)
	replace highestcourt_pay = 3 if `v'==3 & ///
		(`v'<highestcourt_pay | highestcourt_pay==.)
	}

*for circuit courts, which circuit?
lab def circuit 12"DC" 13"FED", replace 
foreach i of numlist 1/6 {
	gen circuit`i'_code = ., after(`v')
	replace circuit`i'_code = 1 ///
		if strpos(courtname`i', "first") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 2 ///
		if strpos(courtname`i', "second") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 3 ///
		if strpos(courtname`i', "third") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 4 ///
		if strpos(courtname`i', "fourth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 5 ///
		if strpos(courtname`i', "fifth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 6 ///
		if strpos(courtname`i', "sixth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 7 ///
		if strpos(courtname`i', "seventh") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 8 ///
		if strpos(courtname`i', "eighth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 9 ///
		if strpos(courtname`i', "ninth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 10 ///
		if strpos(courtname`i', "tenth") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 11 ///
		if strpos(courtname`i', "eleventh") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 12 ///
		if strpos(courtname`i', "district of columbia") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	replace circuit`i'_code = 13 ///
		if strpos(courtname`i', "federal") ///
		& courttype`i'_code==2 | courttype`i'_code==5
	count if circuit`i'_code==. & /// 
		(courttype`i'_code==2 | courttype`i'_code==5)
	scalar wrong_`i' = r(N)
	lab val circuit`i'_code circuit
	}
		
*for district courts, which state and district? 
foreach i of numlist 1/6 {
	gen courtname`i'_working = courtname`i' if courttype`i'_code==3
	replace courtname`i'_working = "" if courttype`i'_code!=3
	replace courtname`i'_working = regexr(courtname`i'_working, ///
	"u.s. district court for the ", "")
	replace courtname`i'_working = regexr(courtname`i'_working, ///
	"district of ", "")
	replace courtname`i'_working = "d.c." if courtname`i'_working== ///
		"columbia (supreme court of the district of columbia)"
	}

lab def district ///
	0"Entire" 1"Central" 2"South" 3"North" 4"East" 5"West" 6"Middle", replace 
	
foreach i of numlist 1/6 { 
	gen courtdistrict`i'_code = ., after(courtname`i')
	replace courtdistrict`i'_code = 0 if courttype`i'_code == 3
	replace courtdistrict`i'_code = 1 if strpos(courtname`i'_working, ///
		"central") & courttype`i'_code==3
	replace courtdistrict`i'_code = 2 if strpos(courtname`i'_working, ///
		"southern") & courttype`i'_code==3
	replace courtdistrict`i'_code = 3 if strpos(courtname`i'_working, ///
		"northern") & courttype`i'_code==3
	replace courtdistrict`i'_code = 4 if strpos(courtname`i'_working, ///
		"western") & courttype`i'_code==3
	replace courtdistrict`i'_code = 5 if strpos(courtname`i'_working, ///
		"eastern") & courttype`i'_code==3
	replace courtdistrict`i'_code = 6 if strpos(courtname`i'_working, ///
		"middle") & courttype`i'_code==3
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"central ", "")
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"southern ", "") 
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"northern ", "") 
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"eastern ", "") 
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"western ", "") 
	replace courtname`i'_working = regexr(courtname`i'_working, ///
		"middle ", "") 
	lab val courtdistrict`i'_code district
	rename courtname`i'_working districtstate`i'
	}

*Years 
gen nomyear1 = regexs(0) if regexm(nominationdate1, "[0-9][0-9][0-9][0-9]")
gen nomyear2 = regexs(0) if regexm(nominationdate2, "[0-9][0-9][0-9][0-9]")
gen nomyear3 = regexs(0) if regexm(nominationdate3, "[0-9][0-9][0-9][0-9]")
gen nomyear4 = regexs(0) if regexm(nominationdate4, "[0-9][0-9][0-9][0-9]")
gen nomyear5 = regexs(0) if regexm(nominationdate5, "[0-9][0-9][0-9][0-9]")
gen nomyear6 = regexs(0) if regexm(nominationdate6, "[0-9][0-9][0-9][0-9]")

destring nomyear*, replace

*Ages
foreach i of numlist 1/6 {
	*At nomination
	gen age_nom`i' = .
	replace age_nom`i' = nomyear`i' - birthyear 
	*At graduation
	if `i' < 6 {
		gen age_degree`i' = . 
		replace age_degree`i' = degreeyear`i' - birthyear
		}
}
*drop if nomyear1<1970 & nomyear1!=.
tab age_degree1
browse *name birthyear degree* school* if age_degree1<20
count if age_degree1<20
tab age_degree2
tab age_degree3
tab age_degree4
tab age_degree5
	
*Number of years between law school degree and nomination 
foreach v of varlist degree1 degree2 degree3 degree4 degree5 { 
	gen `v'_wrk = `v', after(`v')
	tostring `v'_wrk, replace 
} 

foreach v of varlist degree*_wrk* { 
	replace `v' = usubinstr(`v', ".","",.) 
	replace `v' = ustrregexrf(`v', "diplomain legal studies", ///
		"diploma, legal studies")
} 
			
gen lawdegree = .
replace lawdegree = 1 if (ustrpos(degree1_wrk,"jd")|ustrpos(degree1_wrk,"llm") ///
	|ustrpos(degree1_wrk,"llb")) & lawdegree==.
replace lawdegree = 2 if (ustrpos(degree2_wrk,"jd")|ustrpos(degree2_wrk,"llm") ///
	|ustrpos(degree2_wrk,"llb")) & lawdegree==.
replace lawdegree = 3 if (ustrpos(degree3_wrk,"jd")|ustrpos(degree3_wrk,"llm") ///
	|ustrpos(degree3_wrk,"llb")) & lawdegree==.
replace lawdegree = 4 if (ustrpos(degree4_wrk,"jd")|ustrpos(degree4_wrk,"llm") ///
	|ustrpos(degree4_wrk,"llb")) & lawdegree==.
replace lawdegree = 5 if (ustrpos(degree5_wrk,"jd")|ustrpos(degree5_wrk,"llm") ///
	|ustrpos(degree5_wrk,"llb")) & lawdegree==.
	
gen lawdegreeyear = .
replace lawdegreeyear = degreeyear1 if (ustrpos(degree1_wrk,"jd") ///
	|ustrpos(degree1_wrk,"llm") |ustrpos(degree1_wrk,"llb")) ///
	& lawdegreeyear==.
replace lawdegreeyear = degreeyear2 if (ustrpos(degree2_wrk,"jd") ///
	|ustrpos(degree2_wrk,"llm") |ustrpos(degree2_wrk,"llb")) ///
	& lawdegreeyear==.
replace lawdegreeyear = degreeyear3 if (ustrpos(degree3_wrk,"jd") ///
	|ustrpos(degree3_wrk,"llm") |ustrpos(degree3_wrk,"llb")) ///
	& lawdegreeyear==.
replace lawdegreeyear = degreeyear4 if (ustrpos(degree4_wrk,"jd") ///
	|ustrpos(degree4_wrk,"llm") |ustrpos(degree4_wrk,"llb")) ///
	& lawdegreeyear==.
replace lawdegreeyear = degreeyear5 if (ustrpos(degree5_wrk,"jd") ///
	|ustrpos(degree5_wrk,"llm") |ustrpos(degree5_wrk,"llb")) ///
	& lawdegreeyear==.

tab lawdegreeyear
foreach i of numlist 1/6 {
	gen years_degreecourt`i' = . 
	replace years_degreecourt`i' = nomyear`i' - lawdegreeyear ///
		if years_degreecourt`i'==.
}

rename degree* old_degree* 
rename old_degree*_wrk degree*
rename old_degreeyear* degreeyear*

*Issues with Variable Names 

rename otherfederaljudicialservice otherfedjudicialservice1
rename fz otherfedjudicialservice2
rename ga otherfedjudicialservice3
rename gb otherfedjudicialservice4

rename ft serviceaschiefjudgebegin2_6
rename fu serviceaschiefjudgeend2_6
rename es serviceaschiefjudgebegin2_5
rename et serviceaschiefjudgeend2_5
rename dr serviceaschiefjudgebegin2_4
rename ds serviceaschiefjudgeend2_4
rename cq serviceaschiefjudgebegin2_3
rename cr serviceaschiefjudgeend2_3
rename bp serviceaschiefjudgebegin2_2
rename bq serviceaschiefjudgeend2_2

rename fd reappointingpresparty6
rename ec reappointingpresparty5
rename db reappointingpresparty4
rename ca reappointingpresparty3
rename az reappointingpresparty2

*Termination Dates
foreach i of numlist 1/6 { 
	gen terminationyear`i' = ""
	replace terminationyear`i' = regexs(0) ///
	if regexm(terminationdate`i', ///
	"[0-9]*[0-9]*[0-9]*[0-9]")
	gen seniorstatusyear`i' = ""
	replace seniorstatusyear`i' = regexs(0) ///
	if regexm(seniorstatusdate`i', ///
	"[0-9]*[0-9]*[0-9]*[0-9]")
} 

*Career Coding 
do "Career Coding.do" 

save "Datasets/Working_Federal Judicial Directory.dta", replace 



