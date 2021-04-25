rename quality_stateresidence qualify_stateres 
rename quality_* qualify_*
rename courtname court 

*Creating a binary variable for whether a qualification exists in each category,
*as well as a string variable recording the actual qualification for each. 
*Later, the string variables will be converted into number for year-requirements. 
foreach v of varlist qualify_* { 
gen `v'_binary = 0 
replace `v'_binary = 1 if `v'!=""
gen `v'_new = ""
replace `v'_new = `v' if `v'!=""
} 

*Renaming 
rename qualify_* qualify_*_old
rename qualify_*_binary_old qualify_*_binary
rename qualify_*_new_old qualify_*_new

*Converting variables from string to numbers for number of years 
gen qualify_county_years = qualify_countyres_new
gen qualify_city_years = qualify_cityres_new 
gen qualify_local_years = qualify_localres_new
gen qualify_state_years = qualify_stateres_new
gen qualify_practice_years = qualify_practicelaw_new 
replace qualify_local_years = "0.75" if strpos(qualify_local_years, "9 months") 
replace qualify_local_years = "0.5" if strpos(qualify_local_years, "6 months") 
replace qualify_local_years = subinstr(qualify_local_years, "1999","",.) 
replace qualify_practice_years = subinstr(qualify_practice_years, "> 5 of last 10 yrs;","5",.) 

foreach v of varlist qualify_*_years {
destring `v', replace ignore("," "[acbdefghijklmnopqrstuvwxyz] < > ( ) / ;") 
}
destring qualify_agemin_new, replace 
destring qualify_agemax_new, replace 

