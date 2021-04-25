use "FJD/Datasets/Working_Federal Judicial Directory.dta", clear



********************************************************************************
********************************************************************************
********************************************************************************
*	Careers

********************************************************************************
***	Private Practice 
*Private practice working variables 
gen working_pp = profcareer_1 if strpos(profcareer_1,"private practice")
replace profcareer_1 = "" if working_pp!=""
*Stripping out non-numeric characters 
strkeep working_pp, keep("- ") numeric replace 
*Splitting the combined years into separate 
split working_pp, p(" ") gen(pp_years_)
*Separating the start-end years into separate; renaming; destringing 
foreach i of numlist 1/5 {
	split pp_years_`i', p("-") gen(pp`i'_year_)
	rename pp`i'_year_1 pp`i'_startyear
	rename pp`i'_year_2 pp`i'_endyear
	destring pp`i'_startyear, replace 
	destring pp`i'_endyear, replace 
	}
********************************************************************************
***	Law Clerk
gen working_clerk = profcareer_1 if strpos(profcareer_1,"law clerk") ///
	| strpos(profcareer_1,"clerk") 
replace profcareer_1 = "" if working_clerk!=""
// Stripping out non-numeric characters 
strkeep working_clerk, keep("- ") numeric replace 
replace working_clerk = trim(strtrim(stritrim(working_clerk)))
replace working_clerk = ustrregexrf(working_clerk, "- ", "")
replace working_clerk = trim(strtrim(stritrim(working_clerk)))
*Splitting the combined years into separate 
split working_clerk, p(" ") gen(clerk_years_)
*Separating the start-end years into separate; renaming; destringing 
foreach i of numlist 1/2 {
	split clerk_years_`i', p("-") gen(clerk`i'_year_)
	replace clerk`i'_year_1 = "" if ustrlen(clerk`i'_year_1)==1
	replace clerk`i'_year_2 = "" if ustrlen(clerk`i'_year_2)==1
	rename clerk`i'_year_1 clerk`i'_startyear
	rename clerk`i'_year_2 clerk`i'_endyear
	replace clerk1_endyear = clerk1_startyear if ustrlen(clerk_years_1)<6
	}
foreach i of numlist 1/2 {
	destring clerk`i'_startyear, replace 
	destring clerk`i'_endyear, replace 
	}

********************************************************************************
***	Military
*browse profcareer_1 if profcareer_1!=""
gen working_military = profcareer_1 if strpos(profcareer_1,"military") ///
	| strpos(profcareer_1,"army") | strpos(profcareer_1,"navalreserve") ///
	| strpos(profcareer_1,"national guard") | strpos(profcareer_1,"marines") ///
	| strpos(profcareer_1,"navy") | strpos(profcareer_1,"naval reserve") ///
	| strpos(profcareer_1,"air force") | strpos(profcareer_1,"marine corp") ///
	| strpos(profcareer_1,"cadet") | strpos(profcareer_1,"coast guard") ///
	| strpos(profcareer_1,"u.s. naval") | strpos(profcareer_1,"u.s. army") ///
	| strpos(profcareer_1,"u.s. maritime service") /// 
	| strpos(profcareer_1,"territorial guard") ///
	| strpos(profcareer_1,"new mexico national guard ") 
replace profcareer_1 = "" if working_military!=""
//Stripping out non-numeric characters 
strkeep working_military, keep("- ") numeric replace 
replace working_military = trim(strtrim(stritrim(working_military)))
replace working_military = ustrregexrf(working_military, "- ", "")
replace working_military = ustrregexrf(working_military, "--", "")
*Splitting the combined years into separate 
split working_military, p(" ") gen(military_years_)
*browse military_years_1 if military_years_1!=""
*Separating the start-end years into separate; renaming; destringing 
foreach i of numlist 1/3 {
	replace military_years_`i' = "" if strlen(military_years_`i')<4
	split military_years_`i', p("-") gen(military`i'_year_)
	rename military`i'_year_1 military`i'_startyear
	rename military`i'_year_2 military`i'_endyear
	} 
replace military1_endyear = military1_startyear if ustrlen(military_years_1)<6 ///
	& strpos(military_years_1, "-")==0
replace military1_endyear = "" if strpos(military_years_1, "-") 
foreach i of numlist 1/3 {
	destring military`i'_startyear, replace 
	destring military`i'_endyear, replace 
	}

********************************************************************************
***	Education
sort profcareer_1
*browse profcareer_1 if profcareer_1!=""
gen working_education = profcareer_1 if strpos(profcareer_1,"teacher") ///
	| strpos(profcareer_1,"professor") | strpos(profcareer_1,"lecturer") ///
	| strpos(profcareer_1,"principal") | strpos(profcareer_1,"fellow") ///
	| strpos(profcareer_1,"university") | strpos(profcareer_1,"faculty") ///
	| strpos(profcareer_1,"instructor") | strpos(profcareer_1,"college")
replace profcareer_1 = "" if working_education!=""
//Stripping out non-numeric characters 
strkeep working_education, keep("- ") numeric replace 
replace working_education = trim(strtrim(stritrim(working_education)))
replace working_education = ustrregexrf(working_education, "- ", "")
replace working_education = ustrregexrf(working_education, "--", "")
*Splitting the combined years into separate 
split working_education, p(" ") gen(education_years_)
**browse education_years_1 if education_years_1!=""
*Separating the start-end years into separate; renaming; destringing 
foreach i of numlist 1/3 {
	replace education_years_`i' = "" if strlen(education_years_`i')<4
	split education_years_`i', p("-") gen(education`i'_year_)
	rename education`i'_year_1 education`i'_startyear
	rename education`i'_year_2 education`i'_endyear
	} 
replace education1_endyear = education1_startyear if ustrlen(education_years_1)<6 ///
	& strpos(education_years_1, "-")==0
foreach i of numlist 1/3 {
	destring education`i'_startyear, replace 
	destring education`i'_endyear, replace 
	}

********************************************************************************
***	Attorney of Any Kind
*browse profcareer_1 if profcareer_1!=""
gen working_attorney = profcareer_1 if strpos(profcareer_1,"lawyer") ///
	| strpos(profcareer_1,"attorney")  | strpos(profcareer_1,"counsel") ///
	| strpos(profcareer_1,"prosecutor") | strpos(profcareer_1,"public defender") 
replace profcareer_1 = "" if working_attorney!=""

********************************************************************************
***	Judge
*browse profcareer_1 if profcareer_1!=""
gen working_judge = profcareer_1 if strpos(profcareer_1,"judge") ///
	| strpos(profcareer_1,"magistrate") | strpos(profcareer_1,"chancellor") /// 
	| strpos(profcareer_1,"associate justice") ///
	| strpos(profcareer_1,"justice, city court") ///
	| strpos(profcareer_1,"justice, nebraska supreme court") ///
	| strpos(profcareer_1,"kansas district court") ///
	| strpos(profcareer_1,"justice, tenth court of appeals") ///
	| strpos(profcareer_1,"justice, supreme court") 
replace profcareer_1 = "" if working_judge!=""

********************************************************************************
***	Sports
*browse profcareer_1 if profcareer_1!=""
gen working_sports = profcareer_1 if strpos(profcareer_1,"baseball") ///
	| strpos(profcareer_1,"football") | strpos(profcareer_1,"hockey") ///
	| strpos(profcareer_1,"soccer") | strpos(profcareer_1,"basketball")  ///
	| strpos(profcareer_1,"coach") 
replace profcareer_1 = "" if working_sports!=""

********************************************************************************
***	Criminal Justice
*browse profcareer_1 if profcareer_1!=""
gen working_crimjust_notfed = profcareer_1 if strpos(profcareer_1,"police") ///
	| strpos(profcareer_1,"bailiff") | strpos(profcareer_1,"probation") ///
	| strpos(profcareer_1,"parole") | strpos(profcareer_1,"warden") ///
	| strpos(profcareer_1,"federal bureau of investigation") 
replace profcareer_1 = "" if working_crimjust_notfed!=""

********************************************************************************
***	Other Legal (Secretary, Researcher, Reporter, Etc) 
*browse profcareer_1 if profcareer_1!=""
gen working_otherlegal = profcareer_1 if strpos(profcareer_1,"law librarian") ///
	| strpos(profcareer_1,"law secretary") ///
	| strpos(profcareer_1,"legal editor") ///
	| strpos(profcareer_1,"legal assistant") ///
	| strpos(profcareer_1,"legal editor") ///
	| strpos(profcareer_1,"legal publication") ///
	| strpos(profcareer_1,"legal researcher") ///
	| strpos(profcareer_1,"legal secretary") ///
	| strpos(profcareer_1,"court intern") ///
	| strpos(profcareer_1,"legal publish") 
replace profcareer_1 = "" if working_otherlegal!=""	
	
********************************************************************************
***	Federal Bureaucracy
gen working_fedbureau = profcareer_1 if ustrrpos(profcareer_1,"u.s. department") ///
	| ustrrpos(profcareer_1,"u.s. marshal") /// 
	| ustrrpos(profcareer_1,"u.s. patent and trademark office") ///
	| ustrrpos(profcareer_1,"u.s. war labor board") ///
	| ustrrpos(profcareer_1,"u.s. border patrol") ///
	| ustrrpos(profcareer_2,"u.s. department of labor") ///
	| strpos(profcareer_1,"u.s. environmental protection agency") ///
	| strpos(profcareer_1,"u.s. civil service commission") ///
	| strpos(profcareer_2,"u.s. veterans administration") ///
	| strpos(profcareer_1,"u.s. office of price administration") ///
	| strpos(profcareer_1,"u.s. judicial panel") ///
	| strpos(profcareer_1,"u.s. atomic energy commission") ///
	| strpos(profcareer_1,"national labor relations board")
replace profcareer_1 = "" if working_fedbureau!=""

********************************************************************************
***	Federal Government
gen working_fedgov = profcareer_1 if strpos(profcareer_1,"u.s. senate") ///
	| strpos(profcareer_1,"assistant, u.s.") ///
	| strpos(profcareer_1,"office of u.s. rep.") ///
	| strpos(profcareer_1,"staff member, u.s. rep.") ///
	| strpos(profcareer_1,"assistant, u.s. sen.") ///
	| strpos(profcareer_1,"national security council") ///
	| strpos(profcareer_1,"staff, u.s. sen.") ///
	| strpos(profcareer_1,"field secretary, u.s. rep.") ///
	| strpos(profcareer_1,"assistant, u.s. sen.") ///
	| strpos(profcareer_1,"legislative director, u.s. house") 
replace profcareer_1 = "" if working_fedgov!="" 


********************************************************************************
***	Local Government
*browse profcareer_1 if profcareer_1!=""
gen working_othergov = profcareer_1 if strpos(profcareer_1,"mayor") ///
	| strpos(profcareer_1,"alderman") ///
	| strpos(profcareer_1,"village manager") ///
	| strpos(profcareer_1,"city councilman") ///
	| strpos(profcareer_1,"city treasurer") ///
	| strpos(profcareer_1,"city councilor")
	 
replace profcareer_1 = "" if working_othergov!=""


********************************************************************************
***	State Government
gen working_stategov = profcareer_1 if strpos(profcareer_1, "state representative") ///
	| strpos(profcareer_1, "state legislature") ///
	| strpos(profcareer_1, "texas legislative") /// 
	| strpos(profcareer_1, "texas employment commission") ///
	| strpos(profcareer_1, "commissioner, state of north dakota") ///
	| strpos(profcareer_1, "gov. lamar alexander, nashville, tennessee") ///
	| strpos(profcareer_1, "illinois commerce commission") ///
	| strpos(profcareer_1, "puerto rico department") ///
	| strpos(profcareer_1, "officer, state of ohio") ///
	| strpos(profcareer_1, "connecticut general statutes") ///
	| strpos(profcareer_1, "human resources, commonwealth of puerto rico") ///
	| strpos(profcareer_1, "examiner, commonwealth of pennsylvania") ///
	| strpos(profcareer_1,"pennsylvania liquor control board") ///
	| strpos(profcareer_1,"wyoming department of") ///
	| strpos(profcareer_1,"louisiana board of tax appeals") ///
	| strpos(profcareer_1,"new jersey state board") ///
	| strpos(profcareer_1,"new jersey department") ///
	| strpos(profcareer_1,"inspector general, state") ///
	| strpos(profcareer_1,"kentucky department") ///
	| strpos(profcareer_1,"georgia house of representatives") 
replace profcareer_1 = "" if working_stategov!=""

********************************************************************************
********************************************************************************
********************************************************************************

* Second 
drop working_* *years_* *startyear* *endyear* 


********************************************************************************
********************************************************************************
********************************************************************************
*	Careers

********************************************************************************
***	Private Practice 
*Private practice working variables 
gen working_pp = profcareer_2 if strpos(profcareer_2,"private practice")
replace profcareer_2 = "" if working_pp!=""

********************************************************************************
***	Law Clerk
gen working_clerk = profcareer_2 if strpos(profcareer_2,"law clerk") ///
	| strpos(profcareer_2,"clerk") 
replace profcareer_2 = "" if working_clerk!=""

********************************************************************************
***	Military
*browse profcareer_2 if profcareer_2!=""
gen working_military = profcareer_2 if strpos(profcareer_2,"military") ///
	| strpos(profcareer_2,"army") | strpos(profcareer_2,"navalreserve") ///
	| strpos(profcareer_2,"national guard") | strpos(profcareer_2,"marines") ///
	| strpos(profcareer_2,"navy") | strpos(profcareer_2,"naval reserve") ///
	| strpos(profcareer_2,"air force") | strpos(profcareer_2,"marine corp") ///
	| strpos(profcareer_2,"cadet") | strpos(profcareer_2,"coast guard") ///
	| strpos(profcareer_2,"u.s. naval") | strpos(profcareer_2,"u.s. army") ///
	| strpos(profcareer_2,"u.s. maritime service") ///
	| strpos(profcareer_1,"territorial guard") ///
	| strpos(profcareer_1,"new mexico national guard ") 
replace profcareer_2 = "" if working_military!=""

********************************************************************************
***	Education
sort profcareer_2
*browse profcareer_2 if profcareer_2!=""
gen working_education = profcareer_2 if strpos(profcareer_2,"teacher") ///
	| strpos(profcareer_2,"professor") | strpos(profcareer_2,"lecturer") ///
	| strpos(profcareer_2,"principal") | strpos(profcareer_2,"fellow") ///
	| strpos(profcareer_2,"university") | strpos(profcareer_2,"faculty") ///
	| strpos(profcareer_2,"instructor") | strpos(profcareer_2,"college")
replace profcareer_2 = "" if working_education!=""

********************************************************************************
***	Attorney of Any Kind
*browse profcareer_2 if profcareer_2!=""
gen working_attorney = profcareer_2 if strpos(profcareer_2,"lawyer") ///
	| strpos(profcareer_2,"attorney")  | strpos(profcareer_2,"counsel") ///
	| strpos(profcareer_2,"prosecutor") | strpos(profcareer_2,"public defender") 
replace profcareer_2 = "" if working_attorney!=""

********************************************************************************
***	Judge
*browse profcareer_2 if profcareer_2!=""
gen working_judge = profcareer_2 if strpos(profcareer_2,"judge") ///
	| strpos(profcareer_2,"magistrate") | strpos(profcareer_2,"chancellor") /// 
	| strpos(profcareer_2,"associate justice") ///
	| strpos(profcareer_2,"justice, city court") ///
	| strpos(profcareer_2,"justice, nebraska supreme court") ///
	| strpos(profcareer_2,"kansas district court") ///
	| strpos(profcareer_2,"justice, tenth court of appeals") ///
	| strpos(profcareer_2,"justice, supreme court") 
replace profcareer_2 = "" if working_judge!=""

********************************************************************************
***	Sports
*browse profcareer_2 if profcareer_2!=""
gen working_sports = profcareer_2 if strpos(profcareer_2,"baseball") ///
	| strpos(profcareer_2,"football") | strpos(profcareer_2,"hockey") ///
	| strpos(profcareer_2,"soccer") | strpos(profcareer_2,"basketball")  ///
	| strpos(profcareer_2,"coach") 
replace profcareer_2 = "" if working_sports!=""

********************************************************************************
***	Criminal Justice
*browse profcareer_2 if profcareer_2!=""
gen working_crimjust_notfed = profcareer_1 if strpos(profcareer_1,"police") ///
	| strpos(profcareer_1,"bailiff") | strpos(profcareer_1,"probation") ///
	| strpos(profcareer_1,"parole") | strpos(profcareer_1,"warden") ///
	| strpos(profcareer_1,"federal bureau of investigation") 
replace profcareer_2 = "" if working_crimjust_notfed!=""

********************************************************************************
***	Other Legal (Secretary, Researcher, Reporter, Etc) 
*browse profcareer_2 if profcareer_2!=""
gen working_otherlegal = profcareer_2 if strpos(profcareer_2,"law librarian") ///
	| strpos(profcareer_2,"law secretary") ///
	| strpos(profcareer_2,"legal editor") ///
	| strpos(profcareer_2,"legal assistant") ///
	| strpos(profcareer_2,"legal editor") ///
	| strpos(profcareer_2,"legal publication") ///
	| strpos(profcareer_2,"legal researcher") ///
	| strpos(profcareer_2,"legal secretary") ///
	| strpos(profcareer_2,"court intern") ///
	| strpos(profcareer_2,"legal publish") 
replace profcareer_2 = "" if working_otherlegal!=""	
	
********************************************************************************
***	Federal Bureaucracy
gen working_fedbureau = profcareer_2 if ustrrpos(profcareer_2,"u.s. department") ///
	| ustrrpos(profcareer_2,"u.s. marshal") /// 
	| ustrrpos(profcareer_2,"u.s. patent and trademark office") ///
	| ustrrpos(profcareer_2,"u.s. war labor board") ///
	| ustrrpos(profcareer_2,"u.s. border patrol") ///
	| strpos(profcareer_2,"u.s.e environmental protection agency") ///
	| strpos(profcareer_2,"u.s. department of labor") ///
	| strpos(profcareer_2,"u.s. civil service commission") ///
	| strpos(profcareer_2,"u.s. veterans administration") ///
	| strpos(profcareer_2,"u.s. office of price administration") ///
	| strpos(profcareer_2,"u.s. judicial panel") ///
	| strpos(profcareer_2,"u.s. atomic energy commission") ///
	| strpos(profcareer_2,"national labor relations board") /// 
	| strpos(profcareer_2,"federal judicial center") ///
	| strpos(profcareer_2,"u.s. veterans administration") ///
	| strpos(profcareer_2,"department, commonwealth of") ///
	| strpos(profcareer_2,"u.s. office of naval intelligence") /// 
	| strpos(profcareer_2,"u.s. securities and exchange commission") 
replace profcareer_2 = "" if working_fedbureau!=""

********************************************************************************
***	Federal Government
gen working_fedgov = profcareer_2 if strpos(profcareer_2,"u.s. senate") ///
	| strpos(profcareer_2,"assistant, u.s.") ///
	| strpos(profcareer_2,"office of u.s. rep.") ///
	| strpos(profcareer_2,"staff member, u.s. rep.") ///
	| strpos(profcareer_2,"special assistant, u.s. sen.") ///
	| strpos(profcareer_2,"national security council") ///
	| strpos(profcareer_2,"staff, u.s. sen.") ///
	| strpos(profcareer_2,"field secretary, u.s. rep.") ///
	| strpos(profcareer_2,"assistant, u.s. sen.") ///
	| strpos(profcareer_2,"assistant, u.s. house.") ///
	| strpos(profcareer_2,"legislative director, u.s. house") 
replace profcareer_2 = "" if working_fedgov!="" 


********************************************************************************
***	Local Government
*browse profcareer_2 if profcareer_2!=""
gen working_othergov = profcareer_2 if strpos(profcareer_2,"mayor") ///
	| strpos(profcareer_2,"alderman") ///
	| strpos(profcareer_2,"village manager") ///
	| strpos(profcareer_2,"city councilman") ///
	| strpos(profcareer_2,"city treasurer") ///
	| strpos(profcareer_2,"city councilor") ///
	| strpos(profcareer_2,"assistant city solicitor") 
	 
replace profcareer_2 = "" if working_othergov!=""


********************************************************************************
***	State Government
gen working_stategov = profcareer_2 if strpos(profcareer_2, "state representative") ///
	| strpos(profcareer_2,"state legislature") ///
	| strpos(profcareer_2,"texas legislative") /// 
	| strpos(profcareer_2,"texas employment commission") ///
	| strpos(profcareer_2,"commissioner, state of north dakota") ///
	| strpos(profcareer_2,"gov. lamar alexander, nashville, tennessee") ///
	| strpos(profcareer_2,"illinois commerce commission") ///
	| strpos(profcareer_2,"puerto rico department") ///
	| strpos(profcareer_2,"officer, state of ohio") ///
	| strpos(profcareer_2,"connecticut general statutes") ///
	| strpos(profcareer_2,"human resources, commonwealth of puerto rico") ///
	| strpos(profcareer_2,"examiner, commonwealth of pennsylvania") ///
	| strpos(profcareer_2,"pennsylvania liquor control board") ///
	| strpos(profcareer_2,"wyoming department of") ///
	| strpos(profcareer_2,"louisiana board of tax appeals") ///
	| strpos(profcareer_2,"new jersey state board") ///
	| strpos(profcareer_2,"new jersey department") ///
	| strpos(profcareer_2,"inspector general, state") ///
	| strpos(profcareer_2,"kentucky department") ///
	| strpos(profcareer_2,"georgia house of representatives") ///
	| strpos(profcareer_2,"office of the child advocate, state of rhode island") ///
	| strpos(profcareer_2,"state industrial board") ///
	| strpos(profcareer_2,"tennessee department of") ///
	| strpos(profcareer_2,"assistant, gov.") /// 
	| strpos(profcareer_2,"new york state advisory council") ///
	| strpos(profcareer_2,"ohio bureau of") ///
	| strpos(profcareer_2,"west virginia state board of education") ///
	| strpos(profcareer_2,"office of gov.") ///
	| strpos(profcareer_2,"ohio bureau of compensation") ///
	| strpos(profcareer_2,"state senator") ///
	| strpos(profcareer_2,"commission of indiana") /// 
	| strpos(profcareer_2,"state delegate") ///
	| strpos(profcareer_2,"state assemblyman")
	
replace profcareer_2 = "" if working_stategov!=""
browse profcareer_2 if profcareer_2!=""

sort working_military
browse working_military if working_military!=""


/* 
\singlespacing
\begin{longtable}[h]{|c|c|c|c|}
\caption{Careers}\label{tab:prof_experience}
\hline Category & Variable & Coding &  &  \\ \hline 
Career Type & Career Number & Job Name & Job Coding \\ 
Private Practice & .1 &  &  \\ 
Military & .2 & Army &  \\ 
Military & .2 & Army Reserve &  \\ 
Military & .2 & Naval Reserve &  \\ 
Military & .2 & National Guard &  \\ 
Military & .2 & Coast Guard &  \\ 
Military & .2 & Air Force &  \\ 
Military & .2 & Marines &  \\ 
Military & .2 & Navy &  \\ 
State Gov. & .3 &  &  \\ 
Fed. Gov. & .4 & House Rep. &  \\ 
Fed. Gov. & .4 & Senator &  \\ 
Fed. Gov. & .4 & Leg. Aid/Assistant &  \\ 
Fed. Bureaucracy & .5 & Dep. of Agriculture &  \\ 
Fed. Bureaucracy & .5 & Dep. of Energy &  \\ 
Fed. Bureaucracy & .5 & Dep. of Labor &  \\ 
Fed. Bureaucracy & .5 & Dep. of Defense &  \\ 
Fed. Bureaucracy & .5 & Dep. of Justice\footnote{Broken into } &  \\ 
Fed. Bureaucracy & .5 & Treasury &  \\ 
Fed. Bureaucracy & .5 & EEOC &  \\ 
Fed. Bureaucracy & .5 & SEC &  \\ 
Fed. Bureaucracy & .5 & Civil Service Commission &  \\ 
Fed. Bureaucracy & .5 & Tennessee Valley Authority &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Fed. Bureaucracy & .5 &  &  \\ 
Clerk & .6 &  &  \\ 
Education & .7 &  &  \\ 
Education & .7 &  &  \\ 
Education & .7 &  &  \\ 
Education & .7 &  &  \\ 
Education & .7 &  &  \\ 
Education & .7 & Instructor &  \\ 
Education & .7 & Lecturer &  \\ 
Education & .7 & Professor, Associate &  \\ 
Education & .7 & High School Teacher &  \\ 
Attorney & .8 & Staff Attorney &  \\ 
Attorney & .8 & Corporate Counsel &  \\ 
Attorney & .8 & Supervising Attorney &  \\ 
Attorney & .8 & Trial Attorney &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 &  &  \\ 
Attorney & .8 & Minority Counsel &  \\ 
Attorney & .8 & Public Defender &  \\ 
Attorney & .8 & Prosecutor &  \\ 
Attorney & .8 & General Counsel &  \\ 
Attorney & .8 & District Attorney &  \\ 
Attorney & .8 & District Attorney, Assistant &  \\ 
Attorney & .8 & State Attorney &  \\ 
Attorney & .8 & State Attorney, Assistant &  \\ 
Attorney & .8 & Attorney General &  \\ 
Attorney & .8 & Attorney General, Assistant &  \\ 
Attorney & .8 & U.S. Attorney &  \\ 
Attorney & .8 & U.S. Attorney, Assistant &  \\ 
Attorney & .8 & City Attorney &  \\
Attorney & .8 & City Attorney, Assistant/Deputy &  \\
Attorney & .8 & Commonwealth Attorney &  \\ 
Attorney & .8 & Commonwealth Attorney, Assistant/Deputy &  \\ 
Attorney & .8 & County Attorney &  \\ 
Attorney & .8 & County Attorney, Assistant &  \\ 
Judge & .9 &  &  \\ 
Sports & .11 & Football Coach, Assistant &  \\ 
Sports & .11 & Football Player, Professional &  \\ 
Sports & .11 &  &  \\ 
Sports & .11 &  &  \\ 
State Judge & .12 & Trial &  \\
State Judge & .12 & IAC &  \\ 
State Judge & .12 & High Court &  \\ 
Federal Judge & .13 &  &  \\ 
Criminal Justice & .14 & Police &  \\ 
Criminal Justice & .14 & Bailiff &  \\ 
Other Legal/Law & .15 & Law/Legal Secretary &  \\
Other Legal/Law & .15 & Researcher/Research Clerk &  \\
Other Legal/Law & .15 & Legal Investigator &  \\
Other Legal/Law & .15 & Law/Legal Publisher &  \\
Other Legal/Law & .15 & Law/Legal Editor &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Other Legal/Law & .15 &  &  \\
Local Gov. & .16 &  &  \\ 
\hline 

\end{longtable} 

