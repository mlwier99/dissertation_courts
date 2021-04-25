capture cd "/home/michelle/Dropbox/Dissertation/Data/Law School Data/" 

********************************************************************************
*	Law School Enrollment, 1960s to 2013 
import excel "Enrollment, 1963 to 2013.xlsx" ///
	, sheet("Sheet1") firstrow case(lower) clear 
	
rename *_enroll* *
rename *_male* *_male*_n
rename *_female* *_female*_n
rename jd_llb_award  jd_llb_award_n
rename lawschool lawschool_enrolled_n
rename *_total *_total_n

save "Enrollment, 1963 to 2013.dta", replace 

********************************************************************************
*	Number of Female Judges over Time

import excel "../Women Judges over Time.xlsx" ///
	, sheet("State Judges, 08 to 18") firstrow case(lower) allstring clear 

destring year, replace 
rename women womenjudges_n 
rename total totaljudges_n
destring womenjudges_n, replace 
destring totaljudges_n, replace 

save "../State Judges over Time, by Court.dta", replace 

collapse (sum) womenjudges_n totaljudges_n, by(year)

gen laggedyear1 = year 
gen laggedyear2 = year
gen laggedyear3 = year

gen endyear1 = year-10 
gen endyear2 = year-20 
gen endyear3 = year-30  

save "../State Judges over Time.dta", replace 


********************************************************************************
*	J.D. Enrollment from 509 Disclosures (ABA) 

import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2011") firstrow case(lower) allstring clear 
save "509 Disclosures/Ethnicity_2011.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2012") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2012.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2013") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2013.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2014") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2014.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2015") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2015.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2016") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2016.dta", replace 

import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2017") firstrow case(lower) allstring clear 
save "509 Disclosures/Ethnicity_2017.dta", replace 
	
import excel "509 Disclosures/J.D._Enrollment_and_Ethnicity_All_Years.xlsx" ///
	, sheet("2018") firstrow case(lower) allstring clear
save "509 Disclosures/Ethnicity_2018.dta", replace 
