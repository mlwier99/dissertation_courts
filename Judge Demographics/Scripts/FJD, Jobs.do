


********************************************************************************
********************************************************************************
********************************************************************************
*	Jobs 

********************************************************************************
***	Military
browse profjob_1 if profjob_1!=""
gen job_military = ""
replace job_military = "army" if strpos(profjob_1,"army") ///
	| strpos(profjob_1,"u.s. army") 
replace job_military = "national guard" if strpos(profjob_1,"national guard") 
replace job_military = "naval reserve" if strpos(profjob_1,"navalreserve") /// 
	| strpos(profjob_1,"u.s. naval") /// 
	| strpos(profjob_1,"naval reserve") 
replace job_military = "marine corps" if strpos(profjob_1,"marines") ///
	| strpos(profjob_1,"marine corp")
replace job_military = "navy" if strpos(profjob_1,"navy") 
replace job_military = "air force" if strpos(profjob_1,"air force") 
replace job_military = "coast guard" if strpos(profjob_1,"coast guard")
replace job_military = "other" if strpos(profjob_1,"cadet") ///
	| strpos(profjob_1,"u.s. maritime service")
replace profjob_1 = "" if job_military!=""
sort profjob_1 
browse profjob_1 if profjob_1!=""

gen job_assistattorneygen = "" 
replace job_assistattorneygen = "assistant attorney general" ///
	if strpos(profjob_1,"assistant attorney general") 
replace profjob_1 = "" if job_assistattorneygen!=""


assistant public defender,
assistant state attorney, assistant state's attorney,
assistant prosecutor,
assistant u.s. attorney,
