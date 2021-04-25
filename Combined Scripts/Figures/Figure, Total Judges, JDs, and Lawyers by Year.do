cd "/home/michelle/Dropbox/Dissertation/Data/"

********************************************************************************
********************************************************************************
********************************************************************************
				*JUDGES*	
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
	
describe 
*Reshpaing from wide to long; this means I'll now have a year var and 
*an obvs for each year, rather than a variable for each year/var. 
*This takes a while because I have years going back...really far. 
quietly reshape long malejudge_n_ femalejudge_n_ judgetotal_n_ ///
	, i(jid) j(year) 
*	
*Renaming 'cause it's messy.
quietly rename *_ *

*Collapsing. 
*This should give me the sum of, well, all the listed variables. 
collapse (sum) femalejudge_n malejudge_n judgetotal_n ///
	, by(year)
	
drop if year<1980

gen femalejudge_p = (femalejudge_n/judgetotal_n)*100, after(femalejudge_n)
gen malejudge_p = (malejudge_n/judgetotal_n)*100, after(malejudge_n)

gen diff_judge_p = malejudge_p - femalejudge_p 
gen diff_judge_n = malejudge_n - femalejudge_p 

save "Judge Demographics/Judges by Year.dta", replace 
	
********************************************************************************
********************************************************************************
********************************************************************************
				*JD EARNERS*	
cd "/home/michelle/Dropbox/Dissertation/Data/"				
use "Legal Education/Student Information/JD Earners, 1980 to 2013.dta", clear

*Using spring semester year as year				
rename year_end year 
sort year 
*Accumulated supply of J.Ds, starting from 1980 
gen acc_male_jdearn_n = male_jdearn_n, after(male_jdearn_n)
gen acc_female_jdearn_n = female_jdearn_n, after(female_jdearn_n)
gen acc_total_jdearn_n = total_jdearn_n, after(total_jdearn_n)

sort year 
foreach v of varlist acc_* { 
replace `v' = `v' + `v'[_n-1] if year>1981
} 

foreach v of varlist *_jdearn_p { 
replace `v' = regexr(`v', "%", "") 
destring `v', replace 
} 

gen diff_jdearn_p = male_jdearn_p - female_jdearn_p 
gen diff_jdearn_n = male_jdearn_n - female_jdearn_n

drop year_start 

*Dealing with different numbers of schools, so divide total N by schools number 
*then create percentages from that. 
foreach v of varlist *_n { 
	gen `v'_sch = `v'/number_schools, after(`v') 	
} 
gen male_jdearn_p_sch = (male_jdearn_n_sch/total_jdearn_n_sch)*100, after(male_jdearn_n)
gen female_jdearn_p_sch = (female_jdearn_n_sch/total_jdearn_n_sch)*100, after(female_jdearn_n)


save "Legal Education/Student Information/JD_Earn_1980_2013.dta", replace

********************************************************************************
********************************************************************************
********************************************************************************
				*LAW STUDENTS*
import excel "Legal Education/Student Information/Enrollment, FY, JD, Law School, 1963 to 2013.xlsx" ///
	, sheet("Stata") firstrow case(lower) clear
destring year, replace
sort year 
			
foreach v of varlist *fy_n *jdenroll_n { 
	gen acc_`v' = `v', after(`v')
}
foreach v of varlist acc_* { 
sort year 
replace `v' = `v' + `v'[_n-1] if year>1964
} 

gen diff_fy_p = male_fy_p - female_fy_p 
gen diff_fy_n = male_fy_n - female_fy_n
gen diff_jdenroll_p = male_jdenroll_p - female_jdenroll_p 
gen diff_jdenroll_n = male_jdenroll_n - female_jdenroll_n

drop year_*
drop *_yeardiff*

*Dealing with different numbers of schools, so divide total N by schools number 
*then create percentages from that. 
foreach v of varlist total_*_n female_*_n male_*_n { 
	gen `v'_sch = `v'/number_schools, after(`v') 	
} 
gen male_fy_p_sch = (male_fy_n_sch/total_fy_n_sch)*100, after(male_fy_n)
gen female_fy_p_sch = (female_fy_n_sch/total_fy_n_sch)*100, after(female_fy_n)
gen male_jdenroll_p_sch = (male_jdenroll_n_sch/total_jdenroll_n_sch)*100, after(male_jdenroll_n)
gen female_jdenroll_p_sch = (female_jdenroll_n_sch/total_jdenroll_n_sch)*100, after(female_jdenroll_n)

gen diff = total_fy_n - total_fy_n_sch
gen diff2 = male_fy_n - male_fy_n_sch
gen diff3= male_fy_p - male_fy_p_sch
browse year number_schools total_fy_n total_fy_n_sch diff ///
	male_fy_p male_fy_p_sch diff3
save "Legal Education/Student Information/FY_JD_Enroll_1963_2013.dta", replace 

line male_fy_p year ///
|| line male_fy_p_sch year ///
|| line female_fy_p year ///
|| line female_fy_p_sch year 
********************************************************************************
********************************************************************************
********************************************************************************
				*MERGING*	

use "Legal Education/Student Information/FY_JD_Enroll_1963_2013.dta", clear

merge 1:1 year using "Judge Demographics/Judges by Year.dta", gen(merge_dir)
merge 1:1 year using "Legal Education/Student Information/JD_Earn_1980_2013.dta" ///
	, gen(merge_jdearn) 

save "Judges_JDEarners_LawStudents.dta", replace 

********************************************************************************
********************************************************************************
********************************************************************************
				*FIGURES*	
use "Judges_JDEarners_LawStudents.dta", clear

destring number_schools, replace
line number_schools year 

*Not factoring in the number of schools 
sort year 				
line female_jdearn_p year if year<2012 & year>1980 ///
	|| line male_jdearn_p year if year<2012 & year>1980 ///
	, title("J.D. Earners") legend(lab(1 "Female") lab(2 "Male")) ///
	ytitle("Percent") xtitle("Year") xlabel(1980(4)2012, angle(60)) 
line femalejudge_p year if year<2012 & year>1980 ///
	|| line malejudge_p year if year<2012  & year>1980 ///
	, title("Federal Judges") legend(lab(1 "Female") lab(2 "Male")) ///
	ytitle("Percent") xtitle("Year") xlabel(1980(4)2012, angle(60)) 
line female_fy_p year if year<2014 ///
	|| line male_fy_p year if year<2014 ///
	, title("First Year Enrollment") legend(lab(1 "Female") lab(2 "Male"))
line female_jdenroll_p year if year<2014 ///
	|| line male_jdenroll_p year if year<2014 ///
	, title("J.D. Enrollment") legend(lab(1 "Female") lab(2 "Male")) ///
	ytitle("Percent") xtitle("Year") xlabel(1980(4)2012, angle(60)) 

line female_jdearn_p year if year<2012 & year>1980 ///
	|| line male_jdearn_p year if year<2012 & year>1980 ///
	, title("J.D. Earners") legend(lab(1 "Female") lab(2 "Male")) ///
	ytitle("Percent") xtitle("Year") xlabel(1980(4)2012, angle(60)) 
	

*Number of first-years by year and gender 
gen total_fy_n2 = total_fy_n/1000
gen male_fy_n2 = male_fy_n/1000
gen female_fy_n2 = female_fy_n/1000
graph bar (asis) total_fy_n2 male_fy_n2 female_fy_n2 ///
	, over(year, label(angle(75) labsize(small))) stack ///
	title("First Year Enrollment") ///
	 legend(lab(1 "Total") lab(2 "Male") lab(3 "Female"))
line male_fy_n year || line female_fy_n year || line total_fy_n year


*Graphing number of first year students and j.d. earners per year 

line female_jdenroll_p year || line female_jdearn_p year	
line diff_jdearn_p year 
line diff_judge_p year
line diff_jdenroll_p year 

line diff_jdenroll_p year if year<2012 & year>1980 ///
	|| line diff_jdearn_p year if year<2012 & year>1980  ///
	|| line diff_judge_p year if year<2012 & year>1980  ///
	, title("Difference between Male and Female") ///
	legend(lab(1 "J.D. Enrollment") ///
	lab(2 "J.D. Earners") lab(3 "Federal Judges") )

line female_jdenroll_p year if year<2012 & year>1980 ///
	|| line female_jdearn_p year if year<2012 & year>1980  ///
	|| line femalejudge_p year if year<2012 & year>1980  ///
	, title("Percent Female") ///
	legend(lab(1 "J.D. Enrollment") lab(2 "First Year Enrollment") ///
	lab(3 "J.D. Earners") lab(4 "Federal Judges") )
	

line female_jdenroll_p year 
line female_jdearn_p year if year<2011 & year>1981 ///
	, title("Female J.D. Earners") xtitle("Year") ytitle("Percent") /// 
	 xlab(1981(2)2011, angle(60) labsize(medsmall))  ///
	 ylab(0(5)70, angle(360) labsize(small))
line female_jdenroll_p year if year<2011 & year>1981 ///
	, title("Female J.D. Enrollment") xtitle("Year") ytitle("Percent") /// 
	 xlab(1981(2)2011, angle(60) labsize(medsmall))  ///
	 ylab(0(5)70, angle(360) labsize(medsmall))	

line female_jdearn_p male_jdearn_p year if year<2011 & year>1981 ///
	, title("J.D. Earners") xtitle("Year") ytitle("Percent") /// 
	 xlab(1981(2)2011, angle(60) labsize(medsmall))  ///
	 legend(lab(1 "Female") lab(2 "Male")) ///
	 ylab(0(5)70, angle(360) labsize(small))
	
line female_jdenroll_p male_jdenroll_p year if year<2011 & year>1981 ///
	, title("J.D. Enrollment") xtitle("Year") ytitle("Percent") /// 
	 xlab(1981(2)2011, angle(60) labsize(medsmall))  ///
	 legend(lab(1 "Female") lab(2 "Male")) ///
	 ylab(0(5)70, angle(360) labsize(small))
		
	
	
	|| line female_jdearn_p year if year<2012 & year>1980  ///
	, title("Percent Female") ///
	legend(lab(1 "J.D. Enrollment") lab(2 "First Year Enrollment") ///
	lab(3 "J.D. Earners") lab(4 "Federal Judges") )
graph bar (asis) diff_judge_p, over(year)
graph bar (asis) diff_jdearn_p, over(year)
