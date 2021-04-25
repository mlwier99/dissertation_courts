cd "/home/michelle/Dropbox/Dissertation/Data/"

********************************************************************************
********************************************************************************
********************************************************************************
*	Federal Juridicial Directory 
use "Judge Demographics/Judicial Directory/Working_Federal Judicial Directory.dta", clear 

drop if nomyear1<1920

foreach v of varlist seniorstatusyear* terminationyear* { 
destring `v', replace
} 

foreach i of numlist 1/6 { 
gen yearsonbench_ss`i' = seniorstatusyear`i' - nomyear`i' 
gen yearsonbench_term`i' = terminationyear`i' - nomyear`i' 
} 


********************************************************************************
*	Labels 
do "./Do Files/Judicial Directory Labels.do"

********************************************************************************
*	Tabulars
*Appointing President
estimates clear 
eststo pres: tabulate appointingpresident1 female, 
esttab pres ///
	using "../Results/Summary Statistics/tab_appointpres.tex" ///
	, cells("b(label(freq)) pct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) unstack replace
esttab pres ///
	using "../Results/Summary Statistics/tab_appointpres.tex" ///
	, cells("b(label(freq)) pct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) append

*Appointing President Party
estimates clear 
eststo presparty: estpost tabulate partyofappointingpresident1 female
esttab presparty ///
	using "../Results/Summary Statistics/tab_appointpresparty.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) unstack replace
esttab presparty ///
	using "../Results/Summary Statistics/tab_appointpresparty.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) append

*Race by Gender
estimates clear 
eststo black: estpost tabulate race_black female
eststo white: estpost tabulate race_white female 
eststo asian: estpost tabulate race_asian female
eststo aboriginal: estpost tabulate race_nativeamer female
eststo latino: estpost tabulate ethnic_latino female 
esttab black white asian aboriginal latino  ///
	using "../Results/Summary Statistics/tab_genderrace.tex" ///
	, cell(b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))) replace ///
	 noobs modelwidth(15) varlabels(`e(labels)') eqlabels(`e(eqlabels)')
esttab black white asian aboriginal latino  ///
	using "../Results/Summary Statistics/tab_genderrace.tex" ///
	, cell(b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))) append ///
	 noobs modelwidth(15) varlabels(`e(labels)') unstack eqlabels(`e(eqlabels)')
	
*ABA Rating by Gender
estimates clear 
eststo abarating: estpost tabulate abarating1_code female
esttab abarating ///
	using "../Results/Summary Statistics/tab_abarating.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) replace
esttab abarating ///
	using "../Results/Summary Statistics/tab_abarating.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) unstack append

*Highest Court by Gender
estimates clear 
eststo highestcourt: estpost tabulate highestcourt_appeal female
esttab highestcourt ///
	using "../Results/Summary Statistics/tab_highestcourt.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) replace
esttab highestcourt ///
	using "../Results/Summary Statistics/tab_highestcourt.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) unstack append

*Court Type by Gender	
estimates clear 
eststo courtype: estpost tabulate courttype1_code female, lab
esttab courtype ///
	using "../Results/Summary Statistics/tab_courttype.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) replace
esttab courtype ///
	using "../Results/Summary Statistics/tab_courttype.tex" ///
	, cells("b(label(freq)) pct(fmt(2)) colpct(fmt(2)) rowpct(fmt(2))") ///
	nonumber lab varlabels(`e(labels)') varwidth(20) unstack append

*Circuit and District by Gender
eststo: estpost tabulate circuit1_code
eststo: estpost tabulate courtdistrict1
estimates clear 

********************************************************************************
*	Summary Statistics 

estimates clear
estpost tabstat birthyear lawdegreeyear years_degreecourt1 age_nom1 ///
	nomyear1 seniorstatusyear1 yearsonbench_ss1 ///
	terminationyear1 yearsonbench_term1, by(female) ///
	statistics(mean sd min max) columns(statistics) listwise
esttab	using "../Results/Summary Statistics/sum_years.tex" ///
	, cells("mean(fmt(2)) sd(fmt(2)) min max") ///
	noobs nomtitle nonumber noomit replace float ///
	title("Federal Judges") lab fragment
	
foreach i of numlist 1/6 { 
gen democratpresparty`i' = 0
replace democratpresparty`i' = 1 if partyofappointingpresident1=="democratic"
gen republicanpresparty`i' = 0
replace republicanpresparty`i' = 1 if partyofappointingpresident1=="republican"
gen appointpres`i'_id = .
replace appointpres`i'_id = 16 if appointingpresident`i'== "abraham lincoln"
replace appointpres`i'_id = 7 if appointingpresident`i'== "andrew jackson"
replace appointpres`i'_id = 17 if appointingpresident`i'== "andrew johnson"
replace appointpres`i'_id = 44 if appointingpresident`i'== "barack obama"
replace appointpres`i'_id = 23 if appointingpresident`i'== "benjamin harrison"
replace appointpres`i'_id = 30 if appointingpresident`i'== "calvin coolidge"
replace appointpres`i'_id = 21 if appointingpresident`i'== "chester a. arthur"
replace appointpres`i'_id = 45 if appointingpresident`i'== "donald j. trump"
replace appointpres`i'_id = 34 if appointingpresident`i'== "dwight d. eisenhower"
replace appointpres`i'_id = 32 if appointingpresident`i'== "franklin d. roosevelt"
replace appointpres`i'_id = 14 if appointingpresident`i'== "franklin pierce"
replace appointpres`i'_id = 41 if appointingpresident`i'== "george h.w. bush"
replace appointpres`i'_id = 43 if appointingpresident`i'== "george w. bush"
replace appointpres`i'_id = 1 if appointingpresident`i'== "george washington"
replace appointpres`i'_id = 38 if appointingpresident`i'== "gerald ford"
replace appointpres`i'_id = 33 if appointingpresident`i'== "harry s truman"
replace appointpres`i'_id = 31 if appointingpresident`i'== "herbert hoover"
replace appointpres`i'_id = 20 if appointingpresident`i'== "james a. garfield"
replace appointpres`i'_id = 15 if appointingpresident`i'== "james buchanan"
replace appointpres`i'_id = 11 if appointingpresident`i'== "james k. polk"
replace appointpres`i'_id = 4 if appointingpresident`i'== "james madison"
replace appointpres`i'_id = 5 if appointingpresident`i'== "james monroe"
replace appointpres`i'_id = 39 if appointingpresident`i'== "jimmy carter"
replace appointpres`i'_id = 2 if appointingpresident`i'== "john adams"
replace appointpres`i'_id = 35 if appointingpresident`i'== "john f. kennedy"
replace appointpres`i'_id = 6 if appointingpresident`i'== "john quincy adams"
replace appointpres`i'_id = 10 if appointingpresident`i'== "john tyler"
replace appointpres`i'_id = 36 if appointingpresident`i'== "lyndon b. johnson"
replace appointpres`i'_id = 8 if appointingpresident`i'== "martin van buren"
replace appointpres`i'_id = 13 if appointingpresident`i'== "millard fillmore"
replace appointpres`i'_id = 37 if appointingpresident`i'== "richard m. nixon"
replace appointpres`i'_id = 40 if appointingpresident`i'== "ronald reagan"
replace appointpres`i'_id = 19 if appointingpresident`i'== "rutherford b. hayes"
replace appointpres`i'_id = 26 if appointingpresident`i'== "theodore roosevelt"
replace appointpres`i'_id = 3 if appointingpresident`i'== "thomas jefferson"
replace appointpres`i'_id = 18 if appointingpresident`i'== "ulysses grant"
replace appointpres`i'_id = 29 if appointingpresident`i'== "warren g. harding"
replace appointpres`i'_id = 27 if appointingpresident`i'== "william h. taft"
replace appointpres`i'_id = 42 if appointingpresident`i'== "william j. clinton"
replace appointpres`i'_id = 25 if appointingpresident`i'== "william mckinley"
replace appointpres`i'_id = 28 if appointingpresident`i'== "woodrow wilson"
replace appointpres`i'_id = 12 if appointingpresident`i'== "zachary taylor"
} 
