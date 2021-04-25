*JD Earners
*This is only 
use "509 Disclosures/JDs, 1980 to 2011.dta", clear
rename womenpercent jdearn_women_p 
rename menpercent jdearn_men_p 
rename total_graduates jdearn_total_n
gen year = endyear 
gen jdearn_total_n_byk = jdearn_total_n/1000
gen lagminus1_year = year-1 //lag year; students from last year compared to this year's grads
gen lagplus1_year = year+1 //lag year; students from last year compared to this year's grads
gen lagminus2_year = year-2 //lag year; students from last year compared to this year's grad
gen lagminus3_year = year-3 //lag year; students from last year compared to this year's grad
save "509 Disclosures/JD Earners, 1980 to 2011.dta", replace 

* JD Earners and Enrollment 
use "509 Disclosures/Ethnicity_2011to2018.dta", clear
keep all_male_* all_female_* total_jdaward_p total_jdaward_n year 
rename total_jdaward_n jdearn_total_n
rename total_jdaward_p jdearn_total_p
rename all_male_n male_total_n 
rename all_male_p male_total_p 
rename all_female_n female_total_n 
rename all_female_p female_total_p 
gen all_total_n = female_total_n + male_total_n 
gen jdearn_total_n_byk = jdearn_total_n/1000
gen lagminus1_year = year-1 //lag year; students from last year compared to this year's grads
gen lagplus1_year = year+1 //lag year; students from last year compared to this year's grads
gen lagminus2_year = year-2 //lag year; students from last year compared to this year's grad
gen lagminus3_year = year-3 //lag year; students from last year compared to this year's grad
rename all_total_n total_enroll_n 
save "JD Awards and Enrollment, 2011 to 2018.dta", replace 

*Enrollment, first-years, jd earners 
use "Enrollment, 1963 to 2013.dta", clear 
gen year = endyear 
gen fy_female_p = (fy_female_n/fy_total_n)*100
gen fy_male_p = (fy_male_n/fy_total_n)*100
gen jd_male_p = (jd_male_n/jd_total_n)*100
gen jd_female_p = (jd_female_n/jd_total_n)*100
rename jd_female_p female_total_p
rename jd_female_n female_total_n
rename jd_male_p male_total_p
rename jd_male_n male_total_n
rename jd_total_* total_enroll_*
rename lawschool_enrolled_n nonjd_enroll_n
gen male_enroll_n_byk = male_total_n/1000
gen female_enroll_n_byk = female_total_n/1000
gen total_enroll_n_byk = total_enroll_n/1000
gen fy_female_n_byk = fy_female_n/1000
gen fy_male_n_byk = fy_male_n/1000
gen fy_total_n_byk = fy_total_n/1000
gen lagminus1_year = year-1 //lag year; students from last year compared to this year's grads
gen lagplus1_year = year+1 //lag year; students from last year compared to this year's grads
gen lagminus2_year = year-2 //lag year; students from last year compared to this year's grad
gen lagminus3_year = year-3 //lag year; students from last year compared to this year's grad
save "Enrollment, Total and FY, 1963 to 2013.dta", replace 
