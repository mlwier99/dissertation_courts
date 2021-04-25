*Dichotomous jurisdiction variables 
gen j_civil = 0
gen j_crime = 0 
gen j_family = 0
gen j_contracts = 0  
gen j_felony = 0
gen j_misdeam = 0
gen j_equity = 0
gen j_mentalhealth = 0 
gen j_minorcivil = 0
gen j_minorcriminal = 0
gen j_waterrights = 0
gen j_traffic = 0 
gen j_tax = 0
gen j_constitution = 0 
gen j_probate = 0
gen j_adminestates = 0
gen j_workerscomp = 0
gen j_renter = 0 
gen j_kids = 0
gen j_smallclaims = 0
gen j_property = 0
gen j_spouse = 0
gen j_ordinance = 0 
gen j_prelimhear = 0 
gen j_varies = 0 
gen j_other = 0 

gen j_county = 0 
gen j_town = 0 
gen j_state = 0 
gen j_municipal = 0 
gen j_city = 0 

sort court 
list j1 if j1!=""

foreach i of numlist 1/8 {
replace j_county = 1 if strpos(court, "county") | strpos(j`i', "county")
replace j_town = 1 if strpos(court, "town") | strpos(j`i', "town")
replace j_city = 1 if strpos(court, "city") | strpos(j`i', "city")
replace j_county = 1 if strpos(court, "state") | strpos(j`i', "state")
replace j_municipal = 1 if strpos(court, "municipal") | strpos(j`i', "municipal")

 
replace j_mentalhealth = j_mentalhealth + 1 if strpos(j`i', "mental health") ///
	| strpos(j`i', "sanity") ///
	| strpos(j`i', "involuntary commitment") 

replace j_prelimhear = j_prelimhear + 1 if strpos(j`i', "preliminary hearing")

replace j_varies = j_varies + 1 if strpos(j`i', "varies")

replace j_equity = j_equity + 1 if strpos(j`i', "equity")

replace j_constitution = j_constitution + 1 if strpos(j`i', "constitution")

replace j_probate = j_probate + 1 if strpos(j`i', "probate") ///
	| strpos(j`i', "wills") ///
	| strpos(j`i', "estate") ///
	| strpos(j`i', "trusts") ///
	| strpos(j`i', "administration of estate") ///
	| strpos(j`i', "guardians, assignees, executors")
	
replace j_traffic = j_traffic+1 if strpos(j`i', "traffic")  ///
	| strpos(j`i', "motor vehicle") ///
	| strpos(j`i', "parking") ///
	| strpos(j`i', "dmv") ///
	| strpos(j`i', "dui") ///
	| strpos(j`i', "dwi") 

replace j_renter = j_renter+1 if strpos(j`i', "landlord") ///
	| strpos(j`i', "tenant") ///
	| strpos(j`i', "eviction") 

replace j_kids = j_kids+1 if strpos(j`i', "children") ///
	| strpos(j`i', "orphan") ///
	| strpos(j`i', "juvenile") ///
	| strpos(j`i', "child") ///
	| strpos(j`i', "adoption") ///
	| strpos(j`i', "parental") ///
	| strpos(j`i', "guardianship") ///
	| strpos(j`i', "custody") ///
	| strpos(j`i', "delinquency") ///
	| strpos(j`i', "paternity") ///
	| strpos(j`i', "family") ///
	| strpos(j`i', "guardian")
	
replace j_tax = j_tax+1 if strpos(j`i', "original tax appeal") ///
	| strpos(j`i', "tax law") ///
	| strpos(j`i', "tax decision") ///
	| strpos(j`i', "taxation") ///
	| strpos(j`i', "taxes") 
	
replace j_workerscomp = j_workerscomp+1 if strpos(j`i', "workers compensation") ///
	| strpos(j`i', "worker compensation") ///
	| strpos(court, "worker compensation") ///
	| strpos(court, "workers compensation") ///
	| strpos(court, "workers compensation") ///
	| strpos(j`i', "injury compensation claim") 
	
replace j_waterrights = j_waterrights+1 if strpos(j`i', "water") 
	
replace j_property = j_property+1 if strpos(j`i', "land right") ///
	| strpos(j`i', "property right") ///
	| strpos(j`i', "property rights") ///
	| strpos(j`i', "landlord") ///
	| strpos(j`i', "tenant") /// 
	| strpos(j`i', "eviction") /// 
	| strpos(j`i', "rights in land") ///
	| strpos(j`i', "property case") ///
	| strpos(j`i', "real property") ///
	| strpos(j`i', "land") 
	
replace j_spouse = j_spouse+1 if strpos(j`i', "divorce") ///
	| strpos(j`i', "marriage") /// 
	| strpos(j`i', "domestic abuse") ///
	| strpos(j`i', "domestic violence") ///
	| strpos(j`i', "domestic relation") ///
	| strpos(j`i', "domestic case") ///
	| strpos(j`i', "domestic matter") 
	
replace j_crime = j_crime+1 if strpos(j`i', "felony") ///
	| strpos(j`i', "criminal")  ///
	| strpos(j`i', "felonies")  ///
	| strpos(j`i', "misdemeanor") ///
	| strpos(j`i', "parole") ///
	| strpos(j`i', "bail") ///
	| strpos(j`i', "warrant") ///
	| strpos(j`i', "probable cause") ///
	| strpos(j`i', "restraining order") ///
	| strpos(j`i', "orders of protection") 
		
replace j_civil = j_civil + 1 if strpos(j`i', "civil") ///
	| strpos(j`i', "personal property")

replace j_misdeam = j_misdeam+1 if strpos(j`i', "misdemeanor")

replace j_felony = j_felony+1 if strpos(j`i', "felony") 

replace j_smallclaims = j_smallclaims+1 if strpos(j`i', "small claim")

replace j_ordinance = j_ordinance+1 if strpos(j`i', "ordinance") 

replace j_contracts = j_contracts+1 if strpos(j`i', "contract") 
}
di "Done"

foreach i of numlist 1/8 {
	replace j`i' = "" if strpos(j`i', "probate") ///  
     | strpos(j`i', "wills") ///  
     | strpos(j`i', "estate case")  ///  
     | strpos(j`i', "tenant")   ///  
     | strpos(j`i', "traffic")   ///  
     | strpos(j`i', "paternity") ///
     | strpos(j`i', "landlord") ///  
     | strpos(j`i', "personal property") ///
     | strpos(j`i', "guardian") ///
     | strpos(j`i', "trusts") ///
     | strpos(j`i', "children") ///  
     | strpos(j`i', "motor vehicle") ///
     | strpos(j`i', "preliminary hearing") ///
     | strpos(j`i', "probable cause") ///
     | strpos(j`i', "parking") ///
     | strpos(j`i', "dmv") ///
     | strpos(j`i', "felonies")  ///
     | strpos(j`i', "dui") ///
     | strpos(j`i', "dwi") ///
     | strpos(j`i', "family") ///
     | strpos(j`i', "orphan") ///  
     | strpos(j`i', "juvenile") ///  
     | strpos(j`i', "water") ///  
     | strpos(j`i', "child") ///  
     | strpos(j`i', "adoption") ///  
     | strpos(j`i', "parental") ///  
     | strpos(j`i', "guardianship") ///  
     | strpos(j`i', "custody") ///  
     | strpos(j`i', "land") ///
     | strpos(j`i', "administration of estates") ///
     | strpos(j`i', "guardians, assignees, executors") ///
     | strpos(j`i', "delinquency")   ///  
     | strpos(j`i', "workers compensation") /// 
     | strpos(j`i', "original tax appeal")   ///
     | strpos(j`i', "sanity") ///
     | strpos(j`i', "bail") ///
     | strpos(j`i', "involuntary commitment")  ///
     | strpos(j`i', "tax law") /// 
     | strpos(j`i', "mental health") ///
     | strpos(j`i', "domestic violence") ///
     | strpos(j`i', "restraining order") ///
     | strpos(j`i', "tax decision") /// 
     | strpos(j`i', "taxation") ///  
     | strpos(j`i', "taxes")   ///  
     | strpos(j`i', "property case") ///
     | strpos(j`i', "real property") ///
     | strpos(j`i', "worker compensation") /// 
     | strpos(court, "worker compensation") /// 
     | strpos(court, "workers compensation") /// 
     | strpos(court, "workers compensation") /// 
     | strpos(j`i', "injury compensation claim") ///  
     | strpos(j`i', "water right") /// 
     | strpos(j`i', "contract") ///
     | strpos(j`i', "domestic matter") ///
     | strpos(j`i', "water resource")  ///  
     | strpos(j`i', "property right")  ///  
     | strpos(j`i', "landlord") ///  
     | strpos(j`i', "estate") ///
     | strpos(j`i', "constitution") ///
     | strpos(j`i', "tenant") ///  
     | strpos(j`i', "land right") /// 
     | strpos(j`i', "rights in land") /// 
     | strpos(j`i', "divorce") ///  
     | strpos(j`i', "marriage") ///  
     | strpos(j`i', "domestic abuse") /// 
     | strpos(j`i', "domestic relation") /// 
     | strpos(j`i', "domestic case")  ///           
     | strpos(j`i', "felony") ///  
     | strpos(j`i', "criminal") ///  
     | strpos(j`i', "misdemeanor") ///  
     | strpos(j`i', "parole") ///  
     | strpos(j`i', "warrants")   ///  
     | strpos(j`i', "civil")   ///           
     | strpos(j`i', "misdemeanor")  ///  
     | strpos(j`i', "felony")   /// 
     | strpos(j`i', "orders of protection") ///
     | strpos(j`i', "small claim") ///           
     | strpos(j`i', "ordinance")   ///
     | strpos(j`i', "varies") ///
     | strpos(j`i', "eviction") ///
     | strpos(j`i', "equity")
}
di "Done"
foreach v of varlist j_* { 
quietly count if `v'!=0
scalar count = r(N) 
if r(N)!=0 {
	*di r(N) " limited juridisction courts oversee `v'." 
	di "`v': " r(N)
	}
}

foreach i of numlist 1/8 { 
replace j_other = 1+j_other if j`i'!=""
replace j`i' = "" if j_other!=0
quietly count if j`i'!="" 
quietly scalar left_`i' = r(N)
di "j`i' left: " left_`i'
if `i'==7 { 
di "total j left: " left_1 + left_2 + left_3 + left_4 + left_5 + left_6 + left_7 + left_8
}
}
tab j_county
tab j_town
tab j_city
tab j_state
tab j_municipal

replace j_family = 1 if (j_kids==1 | j_spouse==1) & j_family==0


describe j_*
save "Judicial Selection/State/Limited Court Jurisdictions.dta", replace 
