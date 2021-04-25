cd "/home/michelle/Dropbox/Dissertation/Data/Legal Education/" 
********************************************************************************
********************************************************************************
********************************************************************************
*	Legal Education 

/* 
Need: 
	(1) bar graph of first-years by gender
	(2) bar graph of those who got their JD by gender 
	(3) graph that overlays (2) and (1)
	(4) line graph that does (2) and (1) 
	
*/ 

********************************************************************************
* First-year students, JD Awards, all students

use "Enrollment, 1963 to 2013.dta", clear 
gen year = endyear 
gen fy_female_p = (fy_female_n/fy_total_n)*100
gen fy_male_p = (fy_male_n/fy_total_n)*100
gen jd_male_p = (jd_male_n/jd_total_n)*100
gen jd_female_p = (jd_female_n/jd_total_n)*100
rename lawschool_enrolled_n  all_total_n
gen lag1_year = year-1 //lag year; students from last year compared to this year's grads

drop if year==1993

*First-Years, line graph, 1963-2013
line fy_female_p year || line fy_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("First-Year Students by Year and Gender") ///
	ylabel(0(10)100, angle(360) labsize(small)) ///
	xlabel(1963(2)2013, angle(75))

*All students 
drop if year==1993
line fy_female_p year || line fy_male_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("First-Year Students by Year and Gender") ///
	ylabel(0(10)100, angle(360) labsize(small)) ///
	xlabel(1963(2)2013, angle(75))
	
*All law students, 1963 to 2013 
*Line, Percent
use "Enrollment, Total and FY, 1963 to 2013.dta", clear 
line female_enroll_p year || line male_enroll_p year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("J.D. Students by Year and Gender") ///
	ylabel(0(10)100, angle(360) labsize(small)) ///
	xlabel(1963(2)2013, angle(75))

*Line, Number
use "Enrollment, Total and FY, 1963 to 2013.dta", clear 
line female_enroll_n_byk year || line male_enroll_n_byk year ///
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Number") ///
	title("J.D. Students by Year and Gender") ///
	xlabel(1963(2)2013, angle(75) labsize(medsmall))
*Bar
use "Enrollment, Total and FY, 1963 to 2013.dta", clear 
graph bar (asis) female_enroll_n_byk male_enroll_n_byk ///
	if year>1959 & year<1980, over(year, ///
	lab(labsize(small) angle(70))) ytitle("Number (in Thousands)") ///
	title("Enrollment by Year and Gender") subtitle("1960-1979")
graph bar (asis) female_enroll_n_byk male_enroll_n_byk ///
	if year>1979 & year<2000, over(year, sort(year) ///
	lab(labsize(small) angle(70))) ytitle("Number (in Thousands)") ///
	title("Enrollment by Year and Gender") subtitle("1980-1999")
graph bar (asis) female_enroll_n_byk male_enroll_n_byk ///
	if year>1999, over(year,  sort(year) ///
	lab(labsize(small) angle(70))) ytitle("Number (in Thousands)") ///
	title("Enrollment by Year and Gender") subtitle("2000-2013")

*Total first-years with women first-years overlaid 
graph bar (asis) fy_female_n_byk fy_male_n_byk ///
	, over(year, sort(year) lab(labsize(small) angle(70))) ///
	ytitle("Number (in Thousands)") ///
	title("First-Year Enrollment by Year and Gender") subtitle("1963-2013") ///
	legend(label(1 "All First-Years") label(2 "Women")) stack 
*First Year by gender 
line fy_female_p year || line fy_male_p year /// 
	, legend(rows(1) label(1 "Women") label(2 "Men")) /// 
	xtitle("Year") ytitle("Number") ///
	title("First Year Students by Year and Gender") ///
	xlabel(1963(2)2013, angle(75) labsize(medsmall))
	
********************************************************************************
* J.D. Earners

*JD-Earners, 1980 to 2011 and 2011 to 2018 (second data source); no gender rates
*use "509 Disclosures/JD Earners, 1980 to 2011.dta", clear
use "Enrollment, 1971 to 2013.dta", clear
merge m:m year using "JD Awards and Enrollment, 2011 to 2018.dta", gen(merge_80) 
merge m:m year using "Enrollment, Total and FY, 1963 to 2013.dta", gen(merge_63) update

*All law students, 2011 to 2018
sort year 
gen female_total_p2 = (female_total_n/total_enroll_n)*100
gen male_total_p2 = (male_total_n/total_enroll_n)*100
line female_total_p year if year>1979 || line male_total_p year if year>1979  ///
	|| line female_total_p2 year if year>1979 || line male_total_p2 year if year>1979  ///
	, legend(rows(1) label(1 "Female") label(2 "Male")) /// 
	xtitle("Year") ytitle("Percent of Students") ///
	title("Percent of Male and Female Students by Year") ///
	ylabel(30(5)70, angle(360) labsize(small))  xlabel(1980(2)2018, angle(75)) 	
	
	sort year
	browse year female_total_p male_total_p
	
*Total, line
line jdearn_total_n_byk year if merge_63!=2, legend(rows(2)) /// 
	xtitle("Year") ytitle("Number") xlabel(1981(1)2017, angle(60) labsize(small)) ///
	title("J.D. Earners") ylabel(30(2)50 ///
	, labsize(small) angle(360))

*Number of First-Year law students, JD Earners, line 
sort year
line jdearn_total_n_byk year if year>1979 & year<=2013 || line fy_total_n_byk ///
	year if year>1979  & year<=2013  ///
	, legend(label(1 "J.D. Earners") label(2 "First-Year Enrollment")) ///
	 ytitle("Number (in Thousands)") ///
	title("J.D. Earners, First Years") ///
	xlabel(1980(2)2012, angle(75)) 	
	
*Number of First-Year law students three years ago v. JD Earners, line 
sort year 
line jdearn_total_n_byk year if year>1979 & year<=2010 || line fy_total_n_byk ///
	lagminus3_year if lagminus3_year>1979  & lagminus3_year<=2010 ///
	, legend(label(1 "J.D. Earners") label(2 "First-Year Enrollment (t-3)")) ///
	 ytitle("Number (in Thousands)") ///
	title("J.D. Earners (t) and First-Year (t-3)") ///
	xlabel(1980(2)2012, angle(75)) 	

*Tried to overlay bar graphs of first-years three-t and jd earners at t 
twoway bar fy_total_n_byk lagminus1_year if lagminus1_year>=1980 & ///
	lagminus1_year<2014 /// 
	|| bar jdearn_total_n_byk year if year>=1980 & year<2014 ///
	, ytitle("Number (in Thousands)") ///
	title("J.D. Earners and Enrollment by Year") ///
	legend(label(2 "J.D. Earners") label(1 "First-Year Enrollment (t-3)")) 

*Total, bar 
graph bar (asis) jdearn_total_n_byk if merge_63!=2, over(year, sort(year) label(labsize(medsmall) ///
	angle(75))) ytitle("Number (in Thousands)") ///
	title("J.D. Earners by Year")
	
*By gender, line 
line jdearn_women_p year || line jdearn_men_p year if _merge!=2 ///
	, legend(rows(1) label(1 "Female") label(2 "Male")) /// 
	xtitle("Year") ytitle("Percent") ///
	title("J.D. Earners by Year") ///
	xlabel(1980(2)2010, angle(75)) ///
	ylabel(0(10)100, angle(360) labsize(small))
		
********************************************************************************
********************************************************************************
********************************************************************************
* Judge Figures 

/* 
Need: 

	(1) First nomination over time--YES
	(2) Number of women serving over the years 
	(3) Average years from law school to first nomination
	(4) Average age at first nomination 
	(5) First nomination by court
	(6) Number of women serving by court

*/

********************************************************************************
* First nomination 
cd "/home/michelle/Dropbox/Dissertation/Data/" 
use "Judicial Directory/Percent of Federal Women Judges by Year.dta", clear
drop if nomyear1<1965
*Line graph of women/men appointed, percent
sort nomyear1
line femalejudge_p nomyear1 || line malejudge_p nomyear1 ///
	, title("Federal Judges Nominated by Year") ///
	xtitle("Year") ytitle("Percent") ylabel(0(10)100, labsize(medsmall) ///
	angle(360)) xlabel(1965(2)2019, labsize(medsmall) angle(75)) ///
	legend(label(1 "Female") label(2 "Male"))

*Line graph of women/men appointed, number
line female nomyear1 || line malejudge_n nomyear1 ///
	, title("Federal Judges Nominated by Year") ///
	xtitle("Year") ytitle("Raw Number") xlabel(1965(2)2019, angle(75)) ///
	legend(label(1 "Female") label(2 "Male"))
	
*Percent of women appointed to the federal judiciary, by branch
sort nomyea1
line femalejudgedistrict_p nomyear1 || line malejudgedistrict_p nomyear1 ///
	, xlabel(1965(3)2019, angle(75)) ylabel(0(10)100, angle(360)) ///
	ytitle("Percent") xtitle("Year") title("District Court Nominations") 
line femalejudgecircuit_p nomyear1 || line malejudgecircuit_p nomyear1 ///
	, xlabel(1965(3)2019, angle(75)) ylabel(0(10)100, angle(360)) ///
	ytitle("Percent") xtitle("Year") title("Circuit Court Nominations") 
line femalejudgeotherfed_p nomyear1 || line malejudgeotherfed_p nomyear1 ///
	, xlabel(1965(3)2019, angle(75)) ylabel(0(10)100, angle(360)) ///
	ytitle("Percent") xtitle("Year") title("Other Federal Court Nominations") 
line femalejudgescotus_p nomyear1 || line malejudgescotus_p nomyear1 ///
	, xlabel(1965(3)2019, angle(75)) ylabel(0(10)100, angle(360)) ///
	ytitle("Percent") xtitle("Year") title("Supreme Court Nominations") 

graph bar (asis) femalejudgedistrict_p femalejudgecircuit_p ///
	femalejudgescotus_p  ///
	, over(nomyear1, sort(nomyer1) label(labsize(small) angle(-75))) ///
	title("Female Federal Judges Appointed by Year and Court") ///
	legend(label(1 "District") label(2 "Circuit") ///
	label(3 "Supreme") label(4 "Other")) ///
	ytitle("Percentage")  
	
* Women appointed to federal, separated by court type 
graph bar (asis) district_female_n circuit_female_n ///
	supreme_female_n fedother_female_n ///
	, over(nomyear1, label(labsize(small) angle(-75))) ///
	title("Female Federal Judges Appointed by Year and Court") ///
	legend(label(1 "District") label(2 "Circuit") ///
	label(3 "Supreme") label(4 "Other")) ///
	ytitle("Raw Number")
	
*Men and women appointed to each of the court types, raw number
graph bar (asis) circuit_female_n circuit_male_n ///
	, over(nomyear1, label(labsize(small) angle(-75))) ///
	title("Men and Women Appointed to the Federal Circuit Courts") ///
	legend(label(1 "Women") label(2 "Men")) ///
	ytitle("Percentage") stack 
graph bar (asis) supreme_female_n supreme_male_n ///
	, over(nomyear1, label(labsize(small) angle(-75))) ///
	title("Men and Women Appointed to Supreme Court") ///
	legend(label(1 "Women") label(2 "Men")) ///
	ytitle("Percentage") stack
graph bar (asis) fedother_female_n fedother_male_n ///
	, over(nomyear1, label(labsize(small) angle(-75))) ///
	title("Men and Women Appointed to the Other Federal Courts") ///
	legend(label(1 "Women") label(2 "Men")) ///
	ytitle("Percentage") stack 

line femalejudgeotherfed_p nomyear1 || line femalejudgescotus_p nomyear1 ///
	|| line femalejudgecircuit_p nomyear1 || line femalejudgedistrict_p nomyear1 ///
	, title("Female Federal Judges Appointed by Year and Court") ///
	xtitle("Year") ytitle("Percent") ylabel(0 20 40 60 80 100)
	
********************************************************************************
* Number of women serving by year 
use "Judicial Directory/Percent of Federal Women Judges by Year.dta", clear
drop if year<1965
tab year 
line femalejudge_p year || line malejudge_p year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(0(10)100, angle(360))  ytitle("Percent") /// 
	title("Active Federal Judges") ///
	legend(label(1 "Women") label(2 "Men"))
line femalejudge_n year || line malejudge_n year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(, angle(360)) ytitle("Number") /// 
	title("Active Federal Judges") ///
	legend(label(1 "Women") label(2 "Men"))
	
********************************************************************************
* Average years from law school to first nomination 
* Average age at first nomination 
cd "/home/michelle/Dropbox/Dissertation/Data/" 
use "Judicial Directory/Ages of Federal Judges by Year.dta", clear
drop if nomyear1<1965

*Average age at nomination	
quietly sum avgage_all
return list
graph bar avgage_all avgage_female avgage_male ///
	, legend(label(1 "Everyone") label(2 "Women") label(3 ///
	"Men")) ylabel(0(5)60, angle(360)) blabel(bar) ///
	ytitle("Number of Years") title("Average Age at Nomination") ///
	subtitle("Federal Judges") 

*Average number of years between JD attainment and Nomination	
graph bar avgyear_female avgyear_male avgyear_all ///
	, legend(label(3 "Everyone") label(1 "Women") label(2 "Men")) ///
	 ylabel(0(2)30, angle(360)) blabel(bar) ytitle("Number of Years") ///
	title("Avg. Years between J.D. and Nomination")  ///
	subtitle("Federal Judges")

*Each Court
*Average number of years between JD attainment and nomination	
graph bar dist_avgyear_all circuit_avgage_all ///
	dist_avgyear_female circuit_avgage_female ///
	dist_avgyear_male circuit_avgage_male   ///
	, legend(label(1 "District, Everyone") label(5 "District, Men") ///
	label(3 "District, Women") label(2 "Circuit, Everyone") ///
	label(6 "Circuit, Men") label(4 "Circuit, Women")) ///
	ylabel(0(5)60, angle(360) labsize(small)) blabel(bar)  ///
	title("Avg. Years between J.D. and Nomination")  ///
	subtitle("Federal District and Circuit Courts") ytitle("Number of Years")  

*Average age at nomination
graph bar dist_avgage_all circuit_avgage_all ///
	dist_avgage_female circuit_avgage_female ///
	dist_avgage_male circuit_avgage_male   ///
	, legend(label(1 "District, Everyone") label(5 "District, Men") ///
	label(3 "District, Women") label(2 "Circuit, Everyone") ///
	label(6 "Circuit, Men") label(4 "Circuit, Women")) ///
	ylabel(0(5)60, angle(360) labsize(small)) blabel(bar)  ///
	title("Avg. Ages at Nomination")  ///
	subtitle("Federal District and Circuit Courts") ytitle("Number of Years")  

********************************************************************************
* First nomination by court 

********************************************************************************
* Number of women serving by year, by court
use "Judicial Directory/Judges per Year.dta", clear
drop if year<1965
tab year 
*District 
line dist_femalejudge_p year || line dist_malejudge_p year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(0(10)100, angle(360))  ytitle("Percent") /// 
	title("Active Federal District Judges") ///
	legend(label(1 "Women") label(2 "Men"))
line dist_femalejudge_n year || line dist_malejudge_n year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(, angle(360)) ytitle("Number") /// 
	title("Active Federal District Judges") ///
	legend(label(1 "Women") label(2 "Men"))
*Circuit
line circuit_femalejudge_p year || line circuit_malejudge_p year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(0(10)100, angle(360))  ytitle("Percent") /// 
	title("Active Federal Circuit Judges") ///
	legend(label(1 "Women") label(2 "Men"))
line circuit_femalejudge_n year || line circuit_malejudge_n year ///
	, legend(label(1 "Women") label(2 "Men")) ///
	xlabel(1965(2)2019, angle(75) labsize(medsmall)) xtitle("Year") ///
	ylabel(, angle(360)) ytitle("Number") /// 
	title("Active Federal Circuit Judges") ///
	legend(label(1 "Women") label(2 "Men"))
	
line dist_femalejudge_n circuit_femalejudge_n other_femalejudge_n year ///
	|| line dist_malejudge_n circuit_malejudge_n other_malejudge_n year ///
	, legend(rows(2) lab(1 "Female District") lab(2 "Female Circuit") ///
	lab(3 "Female Other") lab(4 "Male District") lab(5 "Male Circuit") ///
	lab(6 "Male Other")) title("Nominations by Year and Court") ///
	subtitle("Federal Courts") ytitle("Number") xtitle("Year")
	
	sort year
line dist_femalejudge_p circuit_femalejudge_p other_femalejudge_p year ///
	, legend(lab(1 "Female District") lab(2 "Female Circuit") ///
	lab(4 "Male District") lab(5 "Male Circuit") lab(5 "Male Other Fed.") ///
	lab(3 "Female Other Fed.")) title("Nominations by Year and Court") ///
	subtitle("Federal Courts") ytitle("Percent") xtitle("Year")

********************************************************************************
********************************************************************************
********************************************************************************
* Legal Profession 

/* 
Need: 
	(1) Placement right out of law school
	(2) Rates of different segement within the profession
	(3) How many people leave the profession over time

*/
