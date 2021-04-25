cd "/home/michelle/Dropbox/Dissertation/Data/"

********************************************************************************
*Aggregating number of women and men nominated by year
use "Judge Demographics/Judicial Directory/Datasets/Working_Federal Judicial Directory.dta", clear 

gen nom_n = 1 
gen malejudge_n = 1 if female==0 
gen femalejudge_n = 1 if female==1
gen district_n = 0
gen circuit_n = 0
gen supreme_n = 0
gen fedother_n = 0
replace district_n = 1 if courttype1_code==3 
replace circuit_n = 1 if courttype1_code==2 
replace supreme_n = 1 if courttype1_code==1 
replace fedother_n = 1 if courttype1_code==4
gen district_female_n = 0
gen circuit_female_n = 0
gen supreme_female_n = 0
gen fedother_female_n = 0
gen district_male_n = 0
gen circuit_male_n = 0
gen supreme_male_n = 0
gen fedother_male_n = 0
replace district_female_n = 1 if courttype1_code==3 & female==1
replace circuit_female_n = 1 if courttype1_code==2 & female==1
replace supreme_female_n = 1 if courttype1_code==1 & female==1
replace fedother_female_n = 1 if courttype1_code==4 & female==1
replace district_male_n = 1 if courttype1_code==3 & female==0
replace circuit_male_n = 1 if courttype1_code==2 & female==0
replace supreme_male_n = 1 if courttype1_code==1 & female==0
replace fedother_male_n = 1 if courttype1_code==4 & female==0
	
collapse (sum) female *_n, by(nomyear1) //gives me the first mumber of 
	// women nominated [for the first time] in a given year. 
gen femalejudge_p = (femalejudge_n/nom_n)*100 
gen malejudge_p = (malejudge_n/nom_n)*100 
gen femalejudgedistrict_p = (district_female_n/district_n)*100
gen femalejudgecircuit_p = (circuit_female_n/circuit_n)*100
gen femalejudgescotus_p = (supreme_female_n/supreme_n)*100
gen femalejudgeotherfed_p = (fedother_female_n/fedother_n)*100
gen malejudgedistrict_p = (district_male_n/district_n)*100
gen malejudgecircuit_p = (circuit_male_n/circuit_n)*100
gen malejudgescotus_p = (supreme_male_n/supreme_n)*100
gen malejudgeotherfed_p = (fedother_male_n/fedother_n)*100

save "Percent of Federal Women Judges by Year.dta", replace 
gen and1 = " & "
gen and2 = and1
gen and3 = and1
gen and4 = and1
gen and5 = and1 
gen and6 = and1 
gen and7 = and1 
gen and8 = and1 
gen and9 = and1 
gen and10 = and1 
gen and11 = and1 
gen and12 = and1 
gen and13 = and1 
gen and14 = and1 
gen and15 = and1 
gen end = "\\" 


sort nomyear1
gen malejudge_n_since1920=malejudge_n
replace malejudge_n_since1920=malejudge_n_since1920[_n] + ///
	malejudge_n_since1920[_n-1] if _n>1

gen femalejudge_n_since1920=femalejudge_n
replace femalejudge_n_since1920=femalejudge_n_since1920[_n] + ///
	femalejudge_n_since1920[_n-1] if _n>1

gen alljudges_n_since1920 = nom_n 
replace alljudges_n_since1920=alljudges_n_since1920[_n] + ///
	alljudges_n_since1920[_n-1] if _n>1

gen malejudge_p_since1920 = malejudge_n_since1920/alljudges_n_since1920
gen femalejudge_p_since1920 = femalejudge_n_since1920/alljudges_n_since1920

foreach v of varlist *_p_* *_p { 
format `v' %9.2fc
} 

browse  nomyear1 and1 nom_n  and2  malejudge_n ///
	and3 femalejudge_n and5  ///
	 and8 malejudge_p and4 femalejudge_p 
	 end if nomyear1>=1920 
	


*Number of nominees by gender over time
graph bar (asis) femalejudge_n malejudge_n ///
	if nomyear1>1929 & nomyear1<1950 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Number") ///
	title("Federal Judges Nominated by Year") subtitle("1930 to 1949") ///
	b1title("Year") ylabel(0(10)30,angle(360)) stack
graph bar (asis) femalejudge_n malejudge_n ///
	if nomyear1>1949 & nomyear1<1970 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Number") ///
	title("Federal Judges Nominated by Year") subtitle("1960 to 1969") ///
	b1title("Year") ylabel(0(5)60,angle(360)) stack
graph bar (asis) femalejudge_n malejudge_n ///
	if nomyear1>1969 & nomyear1<1990 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Number") ///
	title("Federal Judges Nominated by Year") subtitle("1970 to 1989") ///
	b1title("Year") ylabel(0(10)150,angle(360) labsize(small)) stack
graph bar (asis) femalejudge_n malejudge_n ///
	if nomyear1>1989 & nomyear1<2010 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Number") ///
	title("Federal Judges Nominated by Year") subtitle("1990 to 2009") ///
	b1title("Year") ylabel(0(5)100,angle(360) labsize(small)) stack
graph bar (asis) femalejudge_n malejudge_n ///
	if nomyear1>2010 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Number") ///
	title("Federal Judges Nominated by Year") subtitle("2010 to 2019") ///
	b1title("Year") ylabel(0(5)100,angle(360) labsize(small)) stack
	
*Percent of nominees by gender over time
foreach v of varlist *_p { 
replace `v' = `v'/100 
}
graph bar (asis) femalejudge_p malejudge_p ///
	if nomyear1>1929 & nomyear1<1950 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Federal Judges Nominated by Year") subtitle("1930 to 1949") ///
	b1title("Year") ylabel(0(0.1)1,angle(360) labsize(small))
graph bar (asis) femalejudge_p malejudge_p ///
	if nomyear1>1949 & nomyear1<1970 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Federal Judges Nominated by Year") subtitle("1960 to 1969") ///
	b1title("Year") ylabel(0(0.1)1,angle(360) labsize(small))
graph bar (asis) femalejudge_p malejudge_p ///
	if nomyear1>1969 & nomyear1<1990 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Federal Judges Nominated by Year") subtitle("1970 to 1989") ///
	b1title("Year") ylabel(0(0.1)1,angle(360) labsize(small))
graph bar (asis) femalejudge_p malejudge_p ///
	if nomyear1>1989 & nomyear1<2010 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Federal Judges Nominated by Year") subtitle("1990 to 2009") ///
	b1title("Year") ylabel(0(0.1)1,angle(360) labsize(small))
graph bar (asis) femalejudge_p malejudge_p ///
	if nomyear1>2010 ///
	, over(nomyear1, sort(nomyear1) label(labsize(small) angle(40))) ///
	legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Federal Judges Nominated by Year") subtitle("2010 to 2019") ///
	b1title("Year") ylabel(0(0.1)1,angle(360) labsize(small))


line femalejudge_n nomyear1 if nomyear1>1930 ///
|| line malejudge_n nomyear1 if nomyear1>1930 /// 
	, legend(lab(1 "Female") lab(2 "Male")) ytitle("Percent") ///
	title("Female Federal Judges Nominated by Year") /// 
	xtitle("Year") ylabel(0(10)150,angle(360) labsize(small)) ///
	xlab(1930(5)2020, labsize(small) angle(40))

