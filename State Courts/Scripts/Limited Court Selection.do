use "Judicial Selection/State/Limited Courts.dta", clear 
foreach v of varlist selection* { 
	replace `v' = lower(stritrim(strtrim(trim(`v'))))
} 
foreach v of varlist selection_elected selection_appoint {
	replace `v' = "1" if `v'=="yes"
	replace `v' = "0" if `v'==""
	}
rename selection_elected select_elect 
rename selection_appoint select_appoint
rename selection_electiontype select_electtype
rename selection_appointer select_appentity

gen select_either = 0 
replace select_either = 1 if strpos(select_electtype,"elect") ///
	& strpos(select_electtype, "appoint") 

tab select_electtype if select_either==0
replace select_electtype = subinstr(select_electtype, "election","",.)
replace select_electtype = subinstr(select_electtype, "(mostly)","",.)
replace select_electtype = subinstr(select_electtype, "*","",.)
replace select_electtype = regexr(select_electtype, "\(","")
replace select_electtype = regexr(select_electtype, "\)","")
replace select_electtype = "NP" if strpos(select_electtype, "nonpartisan")
replace select_electtype = "P" if strpos(select_electtype, "partisan")

tab select_electtype if select_either==0
