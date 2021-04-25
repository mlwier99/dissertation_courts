capture cd "/home/michelle/Dropbox/Dissertation/Data/Law School Data/" 
********************************************************************************
********************************************************************************
********************************************************************************
*	Legal Education 

********************************************************************************
* Law School Students

*use "509 Disclosures/Ethnicity_2011to2018.dta", clear
use "Enrollment, 1963 to 2013.dta", clear 

gen fy_female_p = (fy_female_n/fy_total_n)*100
gen fy_male_p = (fy_male_n/fy_total_n)*100
gen jd_male_p = (jd_male_n/jd_total_n)*100
gen jd_female_p = (jd_female_n/jd_total_n)*100

gen year = endyear 

*Graphing demographic percentages by year 
line fy_female_p year || line fy_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("Percent of Male and Female First-Year Students") ///
	subtitle("by Year") /// 
	ylabel(0 10 20 30 40 50 60 70 80 90 100, angle(360) labsize(small)) ///
	xlabel(1963 1965 1967 1969 1971 1973 1975 1977 1979 1981 1983 1985  ///
	1987 1989 1991 1993 1995 1997 1999 2001 2003 2005 2007 2009 2011 2013 ///
	, angle(75))

line jd_female_p year || line jd_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("Percent of Male and Female JD Students") ///
	subtitle("by Year") /// 
	ylabel(0 10 20 30 40 50 60 70 80 90 100, angle(360) labsize(small)) ///
	xlabel(1963 1965 1967 1969 1971 1973 1975 1977 1979 1981 1983 1985  ///
	1987 1989 1991 1993 1995 1997 1999 2001 2003 2005 2007 2009 2011 2013 ///
	, angle(75))

gen diff_fy = fy_male_p - fy_female_p 
gen diff_jd = jd_male_p - jd_female_p

line diff_fy year ///
	, legend(rows(1)) /// 
	xtitle("Year") ytitle("Percent") ///
	title("Difference between percent male and female first-year students") ///
	ylabel(0 10 20 30 40 50 60 70 80 90 100, angle(360) labsize(small)) ///
	xlabel(1963 1965 1967 1969 1971 1973 1975 1977 1979 1981 1983 1985  ///
	1987 1989 1991 1993 1995 1997 1999 2001 2003 2005 2007 2009 2011 2013 ///
	, angle(75))
	
line diff_jd year ///
	, legend(rows(1)) /// 
	xtitle("Year") ytitle("Percent") ///
	title("Difference between percent male and female JD students") ///
	ylabel(0 10 20 30 40 50 60 70 80 90 100, angle(360) labsize(small)) ///
	xlabel(1963 1965 1967 1969 1971 1973 1975 1977 1979 1981 1983 1985  ///
	1987 1989 1991 1993 1995 1997 1999 2001 2003 2005 2007 2009 2011 2013 ///
	, angle(75))
	
	help graph bar 
graph bar (asis) diff_jd ///
	, over(year, relabel(`r(relabel)') label(labsize(small) angle(-75))) 
	 
	title("Female Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	stack

line all_female_p year || line all_male_p year ///
	, legend(rows(1) label(1 "Female") label(2 "Male")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Percent of Male and Female Students by Year") ///
	ylabel(46 47 48 49 50 51 52 53 54 55, angle(360)) 

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
tab womenpercent endyear

line womenpercent endyear || line menpercent endyear ///
	, legend(rows(1) label(1 "Female") label(2 "Male")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Female and Male Law Graduates by Year") ///
	xlabel(1980 1982 1984 1986 1988 1990 1992 1994 1996 1998 ///
	2000 2002 2004 2006 2008 2010, angle(75)) ///
	ylabel(0 10 20 30 40 50 60 70 80 90 100, angle(360) labsize(small))

gen difference = (menpercent - womenpercent)/100

line difference endyear ///
	, xlabel(1980 1982 1984 1986 1988 1990 1992 1994 1996 1998 ///
	2000 2002 2004 2006 2008 2010, angle(-60)) ///
	xtitle("Year") ytitle("Percent Difference") ///
	note("% male graduates - % female graduates") ///
	title("Difference in Gender Ratio of Graduatation Rates") ///
	ylabel(0 .1 .2 .3 .4 .5 .6, angle(360))  

********************************************************************************
* Those who got a J.D. and number of state judges per year 

use "../Judge Demographics/State Judges over Time.dta", clear
capture drop yearmerge*
gen yearmerge = year
gen yearmerge_f = year
gen yearmerge_m = year
save "../Judge Demographics/State Judges over Time.dta", replace 

use "509 Disclosures/JDs, 1980 to 2011.dta", clear
gen year = endyear
gen yearmerge = round(year + avg_yearsbetween)
gen yearmerge_f = round(year + avg_yearsbetween_f)
gen yearmerge_m = round(year + avg_yearsbetween_m)

merge 1:1 yearmerge using "../Judge Demographics/State Judges over Time.dta", gen(avg_merge)
replace yearmerge = . if yearmerge>2019
gen womenjudges_p = (womenjudges_n/totaljudges_n)*100
gen menjudges_n = (totaljudges_n-womenjudges_n)
gen menjudges_p = (menjudges_n/totaljudges_n)*100


line womenjudges_p yearmerge || line menjudges_p yearmerge ///
	|| line womenpercent yearmerge || line menpercent yearmerge ///
	, legend(size(medsmall)) legend(rows(2) label(1 "Female Judges") ///
	label(2 "Male Judges") label(3 "Female Graduates") ///
	label(4 "Male Graduates")) xtitle("Year") ytitle("Percent") ///
	title("J.D. Holders and State Judges") ///
	subtitle("by Gender and Year") ylabel(, angle(360))
	
line womenjudges_p yearmerge || line womenpercent yearmerge ///
	, legend(size(medsmall)) legend(rows(2) label(1 "Female Judges") ///
	label(2 "Female Graduates")) ///
	 xtitle("Year") ytitle("Percent") ///
	title("Women J.D. Holders and State Judges") ///
	subtitle("by Year") ylabel(, angle(360))
	
gen difference_jds = menpercent - womenpercent
gen difference_judges = menjudges_p - womenjudges_p

line difference_judges yearmerge || line difference_jds yearmerge ///
	, legend(size(medsmall)) legend(rows(2) ///
	label(1 "State Judges") label(2 "JD Holders")) ///
	 xtitle("Year") ytitle("Difference in Percent") ///
	title("Difference in J.D. Holders and State Judges") ///
	subtitle("by Year") ylabel(, angle(360))
	
	
********************************************************************************
* Those who got a J.D. and number of federal judges per year, raw year 

use "../Judicial Directory/Judges per Year.dta", clear
capture drop yearmerge*
gen yearmerge = year
gen yearmerge_f = year
gen yearmerge_m = year
save "../Judicial Directory/Judges per Year.dta", replace 

use "509 Disclosures/JDs, 1980 to 2011.dta", clear
gen year = endyear
gen yearmerge = round(year + avg_yearsbetween)
gen yearmerge_f = round(year + avg_yearsbetween_f)
gen yearmerge_m = round(year + avg_yearsbetween_m)

merge 1:1 year using "../Judicial Directory/Judges per Year.dta"
replace yearmerge = . if yearmerge>2019
drop if year<1980 | year>2018

line femalejudge_p year 

|| line malejudge_p year ///
	|| line womenpercent year || line menpercent year  ///
	, legend(size(medsmall)) legend(rows(2) label(1 "Male Fed. Judges") ///
	label(2 "Female Fed. Judges") label(3 "Female JDs") label(4 "Male JDs")) 

graph bar (asis) femalejudge_p womenpercent malejudge_p menpercent ///
	if year<2012 & year>1980, over(year, label(labsize(small) angle(-75))) ///
	title("Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs") ///
	label(3 "Male Judges") label(4 "Male JDs")) ///
	ytitle("Percent")
	
graph bar (asis) femalejudge_p womenpercent ///
	if year<2012 & year>1980, over(year, label(labsize(small) angle(-75))) ///
	title("Female Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	ytitle("Percent")

gen diff_jds = menpercent - womenpercent
gen diff_judges = malejudge_p - femalejudge_p
graph bar (asis) diff_judges diff_jds ///
	if year<2012 & year>1980, over(year, label(labsize(small) angle(-75))) ///
	title("Female Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	ytitle("Percent")
	
********************************************************************************
* Those who got a J.D. and number of federal judges per year, years adj. for avg.
* number of years between law school and emergence. 

use "509 Disclosures/JDs, 1980 to 2011.dta", clear
gen year = endyear
gen yearmerge = round(year + avg_yearsbetween)
gen yearmerge_f = round(year + avg_yearsbetween_f)
gen yearmerge_m = round(year + avg_yearsbetween_m)

merge 1:1 yearmerge using "../Judicial Directory/Judges per Year.dta"
replace yearmerge = . if yearmerge>2019

graph bar (asis) femalejudge_p womenpercent ///
	if yearmerge>2004, over(yearmerge, label(labsize(small) angle(-75))) ///
	title("Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	ytitle("Percent") ylabel(0 10 20 30 40 50 60 70 80 90 100)
drop if yearmerge>2018
	
graph bar (asis) femalejudge_p womenpercent ///
	if year<2012 & year>1980, over(year, label(labsize(small) angle(-75))) ///
	title("Female Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	ytitle("Percent")

gen diff_jds = menpercent - womenpercent
gen diff_judges = malejudge_p - femalejudge_p
graph bar (asis) diff_judges diff_jds ///
	if year<2012 & year>1980, over(year, label(labsize(small) angle(-75))) ///
	title("Female Federal Judges v. JD Holders") ///
	legend(label(1 "Female Judges") label(2 "Female JDs")) ///
	ytitle("Percent")
	
********************************************************************************
********************************************************************************
********************************************************************************
* Judge Figures 


********************************************************************************
********************************************************************************
********************************************************************************
* Legal Profession 
