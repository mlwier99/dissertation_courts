
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


save "509 Disclosures/Ethnicity_2011to2018.dta", replace 
