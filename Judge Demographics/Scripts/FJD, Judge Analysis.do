capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics/Judicial Directory"
use "Datasets/Working_Federal Judicial Directory.dta", clear 


*For the first appointment only 
* dropping second 
drop abarating2 abarating2_code age_nom2 appointingpresident2 ///
	appointmenttitle2 ayesnays2 careerpath12 careerpath2 ///
	circuit2_code commissiondate2 committeeactiondate2 ///
	committeereferraldate2 confirmationdate2 courtdistrict2_code courtname2 ///
	courttype2 courttype2_code otherfedjudicialservice* serviceaschiefjudgebegin2_* ///
	serviceaschiefjudgeend2_* reappointingpresparty* districtstate2  hearingdate2 ///
	judiciarycommitteeaction2 ndserviceaschiefjudgebegi ///
	ndserviceaschiefjudgeend nominationdate2 nomyear2 ///
	partyofappointingpresident2 reappointingpresident2 ///
	recessappointmentdate2 seatid2 senatevotetype2 seniorstatusdate2 ///
	serviceaschiefjudgebegin2 serviceaschiefjudgeend2 ///
	statuteauthorizingnewseat2 termination2 terminationdate2 

*Dropping third
drop abarating3 abarating3_code age_nom3 appointingpresident3  ///
	appointmenttitle3 ayesnays3 careerpath13 careerpath3 circuit3_code ///
	commissiondate3 committeeactiondate3 committeereferraldate3 ///
	confirmationdate3 courtdistrict3_code courtname3 courttype3  ///
	courttype3_code districtstate3 hearingdate3  ///
	judiciarycommitteeaction3 nominationdate3 nomyear3  ///
	partyofappointingpresident3 reappointingpresident3  ///
	recessappointmentdate3 seatid3 senatevotetype3  ///
	seniorstatusdate3 serviceaschiefjudgebegin3 serviceaschiefjudgeend3 ///
	statuteauthorizingnewseat3 termination3 terminationdate3 
	
drop abarating4 abarating4_code age_nom4 appointingpresident4 appointmenttitle4  ///
	ayesnays4 careerpath14 careerpath4 circuit4_code commissiondate4  ///
	committeeactiondate4 committeereferraldate4 confirmationdate4  ///
	courtdistrict4_code courtname4 courttype4 courttype4_code ///
	districtstate4 hearingdate4 judiciarycommitteeaction4  ///
	nominationdate4 nomyear4 partyofappointingpresident4  ///
	reappointingpresident4 recessappointmentdate4 seatid4 senatevotetype4  ///
	seniorstatusdate4 serviceaschiefjudgebegin4 serviceaschiefjudgeend4  ///
	statuteauthorizingnewseat4 termination4 terminationdate4 

drop abarating5 abarating5_code age_nom5 appointingpresident5 appointmenttitle5  ///
	ayesnays5 careerpath15 careerpath5 circuit5_code commissiondate5  ///
	committeeactiondate5 committeereferraldate5 confirmationdate5  ///
	courtdistrict5_code courtname5 courttype5 courttype5_code   ///
	districtstate5 hearingdate5 judiciarycommitteeaction5  ///
	nominationdate5 nomyear5 partyofappointingpresident5  ///
	reappointingpresident5 recessappointmentdate5 seatid5 senatevotetype5 ///
	seniorstatusdate5 serviceaschiefjudgebegin5 serviceaschiefjudgeend5  ///
	statuteauthorizingnewseat5 termination5 terminationdate5 

drop abarating6 abarating6_code age_nom6 appointingpresident6 appointmenttitle6 ///
	 ayesnays6 careerpath16 careerpath6 circuit6_code commissiondate6 ///
	 committeeactiondate6 committeereferraldate6 confirmationdate6  ///
	courtdistrict6_code courtname6 courttype6 courttype6_code  ///
	districtstate6  hearingdate6 judiciarycommitteeaction6  ///
	nominationdate6 nomyear6 partyofappointingpresident6  ///
	reappointingpresident6 recessappointmentdate6 seatid6  ///
	senatevotetype6 seniorstatusdate6 serviceaschiefjudgebegin6  ///
	serviceaschiefjudgeend6 statuteauthorizingnewseat6 termination6  ///
	terminationdate6 

*Unncessary variables 
drop deathcity statuteauthorizingnewseat1 birthcity 
drop birthmonth birthday deathday deathmonth deathstate deathyear 
drop reappointingpresident1 partyofreappointingpresident recessappointmentdate1 
drop othernominationsrecessappoint 

*Years 
drop if nomyear1<1970 & nomyear1!=.

*Gender 
lab var female "Female"
tab female

*Nomination Year
tab nomyear1 

*Court level/type
lab def courttype 1 "Supreme Court" 2 "Court of Appeals"  3 "District Court"  ///
	4 "Other" 5 "Old Circuit Courts", replace 
tab courttype1_code female 
tab courttype1_code gender
codebook gender

*Highest-reached court
lab def highestcourt 1 "Supreme" 2 "Circuit" 3 "District" 
lab values highestcourt_pay highestcourt
lab values highestcourt_appeal highestcourt

tab highestcourt_pay 
tab highestcourt_appeal

*Code for the federal circuit 
lab def circuit 12"DC" 13"FED", replace 
tab circuit1_code

*Code for the federal court district 
lab def district ///
	0"Entire" 1"Central" 2"South" 3"North" 4"East" 5"West" 6"Middle", replace 
tab courtdistrict1_code 

*Number of years between receiving J.D. and reaching bench
sum years_degreecourt1 if female==1
sum years_degreecourt1 if female==0

reg years_degreecourt1 female i.nomyear1
esttab, keep(female)

*Age at Nomination 
tab age_nom1 
sum age_nom1 if female==1
sum age_nom1 if female==0

tab school1
tab school2 if courttype1_code==2, sort 

browse if nomyear1==1970 & female==1

reg age_nom1 female i.nomyear1
esttab, keep(female)

*ABA Rating Codes
lab def abarating 1"exceptionally not qualified" 2"not qualified" 3"qualified" ///
	4"well qualified" 5"exceptionally well qualified", replace 
tab abarating1_code female, col

reg abarating1_code female i.nomyear1
esttab, keep(female)

*Title/position appointed to 
tab appointmenttitle1 

*Appointing president 
tab appointingpresident1 

*Appointing president's party 
tab partyofappointingpresident1
gen appointpresparty_d = 0 
replace appointpresparty_d = 1 if partyofappointingpresident1=="democratic"

gen appointpresparty_r = 0 
replace appointpresparty_r = 1 if partyofappointingpresident1=="republican"

*Race/Ethnicity
tab race_black 
tab race_nativeamer 
tab race_asian 
tab ethnic_latino 
tab race_white 

*Career Path 
*career_* "Career P/th"


*Analysis 

probit female ///
	age_nom1 abarating1_code race_black race_white nomyear1 ///
	appointpresparty_d
	
esttab, drop(nomyear1) lab 
margins, dydx(*)

*Average years between law school and judgeship 
tab lawdegreeyear
tab nomyear1
gen yearsbetween = nomyear1 - lawdegreeyear
drop if nomyear1<1970
tab yearsbetween
browse if yearsbetween<10
sum yearsbetween 
global scalar avg_yearsbetween = r(mean)
sum yearsbetween if female==1 
global scalar avg_yearsbetween_f = r(mean)
sum yearsbetween if female==0
global scalar avg_yearsbetween_m = r(mean)

di avg_yearsbetween_m 
di avg_yearsbetween_f 
di avg_yearsbetween

