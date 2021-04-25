cd "/home/michelle/Dropbox/Dissertation/Data/" 

use "State Courts/State Court Org, 2011.dta", clear

count

gen and1 = "&"
gen and2 = "&"
gen and3 = "&"
gen and4 = "&"
gen and5 = "&"
gen and6 = "&"
gen and7 = "&"
gen and8 = "&"
gen and9 = "&"
gen and10 = "&"
gen end = " \\" 

replace state_name = strproper(state_name) 
codebook gj_select_retend
codebook appeals_select_fullterm appeals_select_retend appeals_select_unexpire


*Appeals Courts
edit state_abbrev and1 highcourt_courts_n and2 highcourt_judges_n and3 ///
	highcourt_termlen and5 iac_courts_n and6 iac_judges_n and7 iac_termlen ///
	and8 appeals_select_fullterm and9 appeals_select_retend and10 ///
	appeals_select_unexpire end ///
	if state_name=="Arizona" | state_name=="Colorado" | state_name=="Florida" ///
	| state_name=="Maryland"| state_name=="Missouri" | state_name=="Utah" ///
	| state_name=="New Hampshire" | state_name=="New Mexico" ///
	| state_name=="Rhode Island" | state_name=="Tennessee" 

edit state_abbrev and1 highcourt_courts_n and2 highcourt_judges_n and3 ///
	highcourt_termlen and5 iac_courts_n and6 iac_judges_n and7 iac_termlen ///
	and8 appeals_select_fullterm and9 appeals_select_retend and10 ///
	appeals_select_unexpire end 
	

*Gen., Limit. Jurd. Courts
edit state_abbrev and1 gj_courts_n and2 gj_judges_n  and3 gj_termlen ///
	and4 gj_select_fullterm and5 gj_select_retend and6 ///
	gj_select_unexpire and9 lj_courts_n and10 lj_judges_n end ///
	if state_name=="Arizona" | state_name=="Colorado" | state_name=="Florida" ///
	| state_name=="Maryland"| state_name=="Missouri" | state_name=="Utah" ///
	| state_name=="New Hampshire" | state_name=="New Mexico" ///
	| state_name=="Rhode Island" | state_name=="Tennessee" 
	
edit state_abbrev and1 gj_courts_n and2 gj_judges_n  and3 gj_termlen ///
	and4 gj_select_fullterm and5 gj_select_retend and6 ///
	gj_select_unexpire and9 lj_courts_n and10 lj_judges_n end 
 
 

 


 
 


browse state_name and1 
