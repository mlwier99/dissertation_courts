
capture cd "/home/michelle/Dropbox/Dissertation/Data/Law School Data/" 

********************************************************************************
*	Appending 
use "509 Disclosures/Ethnicity_2011.dta", clear

append using "509 Disclosures/Ethnicity_2012.dta", gen(append_12) 
append using "509 Disclosures/Ethnicity_2013.dta", gen(append_13) 
append using "509 Disclosures/Ethnicity_2014.dta", gen(append_14) 
append using "509 Disclosures/Ethnicity_2015.dta", gen(append_15) 
append using "509 Disclosures/Ethnicity_2016.dta", gen(append_16) 
*append using "509 Disclosures/Ethnicity_2017.dta", gen(append_17) 
*append using "509 Disclosures/Ethnicity_2018.dta", gen(append_18) 

save "509 Disclosures/Ethnicity_2011to2018.dta", replace 

drop ep eq er es et eu ev ew ex ey ez fa fb fc fd fe ff fg fh fi fj 
drop fl fm fn fo fp fq fr fs ft fu fv 
drop if all_female_p=="perc_Total Women"

foreach v of varlist *{
destring `v', replace 
} 

********************************************************************************
* Supply-Side 

*All students in a school/year 
rename all_total_n total_students

*Gender Stats
sum all_female_p all_female_n all_male_n all_male_p
*histogram all_female_p, norm kdens
*histogram all_male_p, norm kdens

*Collapsing to see supply of men/women overall 
collapse (sum) white_male_n nonwhite_male_n  white_female_n nonwhite_female_n ///
	white_fulltime_n nonwhite_fulltime_n all_fulltime_n nonwhite_parttime_n ///
	white_parttime_n all_parttime_n all_fy_n white_fy_n nonwhite_fy_n ///
	nonwhite_total_n white_total_n total_students total_jdaward_n ///
	white_jdaward_n nonwhite_jdaward_n all_female_n all_male_n ///
	, by(year) 
		
*Creating percentage variables
gen float all_male_p = (all_male_n/total_students)*100
gen float nonwhite_male_p = (nonwhite_male_n/all_male_n)*100
gen float white_male_p = (white_male_n/all_male_n)*100

gen float all_female_p = (all_female_n/total_students)*100
gen float white_female_p = (white_female_n/all_female_n)*100
gen float nonwhite_female_p = (nonwhite_female_n/all_female_n)*100

gen float nonwhite_total_p = (nonwhite_total_n/total_students)*100
gen float white_total_p = (white_total_n/total_students)*100

gen float all_fulltime_p = (all_fulltime_n/total_students)*100
gen float white_fulltime_p = (white_fulltime_n/all_fulltime_n)*100
gen float nonwhite_fulltime_p = (nonwhite_fulltime_n/all_fulltime_n)*100

gen float all_parttime_p = (all_parttime_n/total_students)*100
gen float nonwhite_parttime_p = (nonwhite_parttime_n/all_parttime_n)*100
gen float white_parttime_p = (white_parttime_n/all_parttime_n)*100

gen float all_fy_p = (all_fy_n/total_students)*100
gen float white_fy_p = (white_fy_n/all_fy_n)*100
gen float nonwhite_fy_p = (nonwhite_fy_n/all_fy_n)*100

gen float total_jdaward_p = (total_jdaward_n/total_students)*100
gen float white_jdaward_p = (white_jdaward_n/total_jdaward_n)*100
gen float nonwhite_jdaward_p = (nonwhite_jdaward_n/total_jdaward_n)*100

*Graphing demographic percentages by year 
line all_female_p year || line all_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Percent of Male and Female Students by Year") ///
	ylabel(0 20 40 60 80 100, angle(360)) 
	
line all_female_p year || line all_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Percent of Male and Female Students by Year") ///
	ylabel(40 50 60, angle(360)) 

line nonwhite_total_p year || line white_total_p year ///
	, legend(rows(2) label(1 "Nonwhite Students") ///
	label(2 "White Students")) ylabel(0 20 40 60 80 100, angle(360)) ///
	xtitle("Year") ytitle("Percent of Students")
	
line nonwhite_female_p year || line white_female_p year ///
	|| line nonwhite_male_p year || line white_male_p year ///
	, legend(rows(2) label(1 "Nonwhite Women") label(2 "White Women") ///
	label(3 "Nonwhite Men") label(4 "White Men")) ///
	xtitle("Year") ytitle("Percent of Students") ///
	ylabel(0 20 40 60 80 100, angle(360)) 

line total_jdaward_p year ///
	|| line white_jdaward_p year || line nonwhite_jdaward_p year ///
	, legend(rows(2) label(1 "All Students") label(2 "White Students") ///
	label(3 "Nonwhite Students")) xtitle("Year") ytitle("Percent of Students") ///
	ylabel(0 20 40 60 80 100, angle(360)) ///
	title("Students who Earned a JD") 
	
line total_jdaward_p year ///
	, legend(rows(2)) ///
	xtitle("Year") ytitle("Percent of Students") ///
	ylabel(0 20 40 60 80 100, angle(360)) ///
	title("Students who Earned a JD") 


********************************************************************************
* Those who got a J.D.  
use "509 Disclosures/JDs, 1980 to 2011.dta", clear

line womenpercent endyear || line menpercent endyear ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Percent of Male and Female Law Graduates by Year") ///
	xlabel(1980 1982 1984 1986 1988 1990 1992 1994 1996 1998 ///
	2000 2002 2004 2006 2008 2010, angle(-60)) ///
	ylabel(, angle(360))
	
line difference endyear ///
	, xlabel(1980 1982 1984 1986 1988 1990 1992 1994 1996 1998 ///
	2000 2002 2004 2006 2008 2010, angle(-60)) ///
	xtitle("Year") ytitle("Percent Difference") ///
	note("% male graduates - % female graduates") 
	
gen difference = menpercent - womenpercent
line difference endyear

********************************************************************************
* Those who got a J.D. and number of women judges per year 

use "509 Disclosures/JDs, 1980 to 2011.dta", clear


