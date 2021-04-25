********************************************************************************
/* 

Data recording the rank of law schools between 1987 and 2009; only covers
the top 30 schools. The observations are organized by year, with the school
name recorded as both a string and with an ID code. There are also dummy
variables for each year-school dyad--zero if the school 

tab year 
*/
********************************************************************************

capture cd "/home/michelle/Dropbox/Dissertation/Data/Legal Education/"

import excel "./School Ranks/Ranks.xlsx" ///
	, sheet("T20, USA") firstrow case(lower) allstring clear 
	
*Destringing years and ranks 
destring year, replace
lab var year "Year of Rank"
destring rank, replace
lab var rank "School Rank" 

*Generating variable for old school variable 
gen orgvar_school = school 
lab var orgvar_school "Original School Variable" 
tab school 

*Encoding the schools and creating school dummies 
replace school = lower(stritrim(strtrim(school))) 
replace school = regexr(school, "univ.","university")
replace school = "george washington university" if school=="george washington"
replace school = "duke university school of law" if school=="duke"
replace school = "University of California, Los Angeles" if school="ucla"
replace school = subinstr(school, ".", "",.) 
replace school = subinstr(school, "&", "and",.) 
encode school, gen(schoolcode)
tab school, gen(school_)

*Generating group vars for the schools; seems to literally be the same as encode
sort school 
egen float schoolgroup = group(school) ///
	, missing label lname(groupnames)

*Fixing Labels
foreach v of var school_1-school_30 {
local new : var label `v'
local newer : subinstr local new "school==" "" 
local newer : subinstr local new "school==" "" 
local newer : subinstr local new "school==" ""
local newer = proper("`newer'") 
local newer : subinstr local newer "Of" "of" 
local newer : subinstr local newer "And" "and" 
local newer : subinstr local newer "Usc" "USC" 
local newer : subinstr local newer "Nyu" "NYU" 
local newer : subinstr local newer "Ucla" "UCLA" 
local newer : subinstr local newer "Uc Hastings" "UC Hastings" 
*strproper local newer 
*local newerer : subinstr local newer "==" "" 
label var `v' "`newer'"
}
/* 

help subinstr

gen degreeyear2 = year 
gen degreeyear3 = year 
gen degreeyear4 = year 
gen degreeyear5 = year
rename year degreeyear1
gen schoolrank2 = rank 
gen schoolrank3 = rank 
gen schoolrank4 = rank 
gen schoolrank5 = rank 
rename rank schoolrank1
gen clean_school1 = school
gen clean_school2 = school
gen clean_school3 = school
gen clean_school4 = school
gen clean_school5 = school

save "SchoolRank.dta", replace

browse 
browse clean_school1
/* 
*Graphing schools across years and ranks 
graph twoway ///
	(rscatter school_1 rank year if school_1!=0)
	, mlabel(rank)) /// ///
	(rscatter school_2 rank year if school_2!=0, mlabel(rank)) /// ///
	(rscatter school_3 rank year if school_3!=0, mlabel(rank)) /// ///
	(rscatter school_4 rank year if school_4!=0, mlabel(rank)) /// ///
	(rscatter school_5 rank year if school_5!=0, mlabel(rank)) /// ///
	(rscatter school_6 rank year if school_6!=0, mlabel(rank)) /// ///
	(rscatter school_7 rank year if school_7!=0, mlabel(rank) )
	(rscatter school_8 rank year if school_8!=0, mlabel(rank)) /// ///
	(rscatter school_9 year if school_9!=0, mlabel(rank)) /// ///
	(rscatter school_10 year if school_10!=0, mlabel(rank) ) ///
	(rscatter school_11 year if school_11!=0, mlabel(rank)) /// ///
	(rscatter school_12 year if school_12!=0, mlabel(rank)) /// ///
	(rscatter school_13 year if school_13!=0, mlabel(rank)) /// ///
	(rscatter school_14 year if school_14!=0, mlabel(rank) ) ///
	(rscatter school_15 year if school_15!=0, mlabel(rank)) /// ///
	(rscatter school_16 year if school_16!=0, mlabel(rank)) /// ///
	(rscatter school_17 year if school_17!=0, mlabel(rank)) /// ///
	(rscatter school_18 year if school_18!=0, mlabel(rank)) /// ///
	(rscatter school_19 year if school_19!=0, mlabel(rank)) /// ///
	(rscatter school_20 year if school_20!=0, mlabel(rank)) /// ///
	(rscatter school_21 year if school_21!=0, mlabel(rank)) /// ///
	(rscatter school_22 year if school_22!=0, mlabel(rank)) /// ///
	(rscatter school_23 year if school_23!=0, mlabel(rank)) /// ///
	(rscatter school_24 year if school_24!=0, mlabel(rank)) /// ///
	(rscatter school_25 year if school_25!=0, mlabel(rank)) /// ///
	(rscatter school_26 year if school_26!=0, mlabel(rank) ) ///
	(rscatter school_27 year if school_27!=0, mlabel(rank)) /// ///
	(rscatter school_28 year if school_28!=0, mlabel(rank)) /// ///
	(rscatter school_29 year if school_29!=0, mlabel(rank)) /// ///
	(rscatter school_30 year if school_30!=0, mlabel(rank)) ///
	(rscatter school_31 year if school_31!=0, mlabel(rank)) ///
	, legend(cols(5) size(small)) ///
	xlab(1987 1990 1991 1992 1993 1994 1995 1996 ///
	1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 ///
	2007 2008 2009, angle(45)) 
	
	
*Graph by rank 
graph twoway ///
	(scatter rank year if school_1!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_2!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_3!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_4!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_5!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_6!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_7!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_8!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_9!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_10!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_11!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_12!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_13!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_14!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_15!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_16!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_17!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_18!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_19!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_20!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_21!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_22!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_23!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_24!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_25!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_26!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_27!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_28!=0, mlabel(schoolcode)) /// ///
	(scatter rank year if school_29!=0, mlabel(schoolcode)) ///) ///
	(scatter rank year if school_30!=0, mlabel(schoolcode)) ///) ///
	(scatter rank year if school_31!=0, mlabel(schoolcode)) ///
	, legend(off) ///
	xlab(1987 1990 1991 1992 1993 1994 1995 1996 ///
	1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 ///
	2007 2008 2009, angle(45)) ///
	ylab(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)
	
msize(tiny) ///
	legend(on) mlabv(rank) mlabel(rank) 

ssc inst statplot

// I want a scatterplot with a Year y-axis and a 
// Rank x-axis, and then I want to place markers 
// on it with no labels, but each school a different
// color. 


