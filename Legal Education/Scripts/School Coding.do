capture cd "/home/michelle/Dropbox/Dissertation/Data/Judicial Directory" 
use "Datasets/Working_Federal Judicial Directory.dta", clear

*Schools
tab school1
sort school1
rename school* old_school*

foreach i of numlist 1/5 {
	gen school`i' = old_school`i'
}
*School Replacement 
foreach v of varlist school* { 
replace `v' = "texas a & m university" if old_`v' =="agricultural and mechanical college of texas (now texas a & m university)"
replace `v' = "arkansas tech university" if old_`v' =="arkansas polytechnic college (now arkansas tech university)"
replace `v' = "georgia regents university" if old_`v' =="augusta college (now georgia regents university)"
replace `v' = "university of massachusetts boston" if old_`v' =="boston state college (now university of massachusetts boston)"
replace `v' = "case western reserve university" if old_`v' =="case institute of technology (now case western reserve university)"
replace `v' = "college of central florida" if old_`v' =="central florida community college (now college of central florida)"
replace `v' = "chicago state university" if old_`v' =="chicago teachers college (now chicago state university)"
replace `v' = "baruch college" if old_`v' =="city college of new york, school of business (now baruch college)"
replace `v' = "clark atlanta university" if old_`v' =="clark college (now clark atlanta university)"
replace `v' = "east texas baptist university" if old_`v' =="college of marshall (now east texas baptist university)"
replace `v' = "s. car. state u." if old_`v' =="colored normal industrial & mechanical college of s. car. (now s. car. state u.)"
replace `v' = "connecticut college" if old_`v' =="connecticut college for women (now connecticut college)"
replace `v' = "michigan state university college of law" if old_`v' =="detroit college of law (now michigan state university college of law)"
replace `v' = "univ. of the district of columbia" if old_`v' =="district of columbia teachers college (now univ. of the district of columbia)"
replace `v' = "montana state university billings" if old_`v' =="eastern montana college (now montana state university billings)"
replace `v' = "california state university, fresno" if old_`v' =="fresno state college (now california state university, fresno)"
replace `v' = "georgetown university" if old_`v' =="georgetown college (now georgetown university)"
replace `v' = "georgetown university, school of foreign service" if old_`v' =="georgetown college (now georgetown university), school of foreign service"
replace `v' = "harris-stowe state university" if old_`v' =="harris teachers college (now harris-stowe state university)"
replace `v' = "maurer school of law" if old_`v' =="indiana university school of law -- bloomington (now maurer school of law)"
replace `v' = "jersey city university" if old_`v' =="jersey city state college (now jersey city university)"
replace `v' = "kansas state univ." if old_`v' =="kansas state college of agriculture and applied science (now kansas state univ.)"
replace `v' = "pittsburg state university" if old_`v' =="kansas state college of pittsburg (now pittsburg state university)"
replace `v' = "university of nebraska kearney" if old_`v' =="kearney state college (now university of nebraska kearney)"
replace `v' = "kutztown university of pennsylvania" if old_`v' =="kutztown state college (now kutztown university of pennsylvania)"
replace `v' = "metropolitan community college" if old_`v' =="longview community college (now metropolitan community college)"
replace `v' = "california state university, los angeles" if old_`v' =="los angeles state college (now california state university, los angeles)"
replace `v' = "loyola marymount university" if old_`v' =="loyola university of los angeles (now loyola marymount university)"
replace `v' = "university of memphis" if old_`v' =="memphis state university (now university of memphis)"
replace `v' = "university of charleston" if old_`v' =="morris harvey college (now university of charleston)"
replace `v' = "wichita state university" if old_`v' =="municipal university of wichita (now wichita state university)"
replace `v' = "rutgers school of law -- newark" if old_`v' =="new jersey law school (now rutgers school of law -- newark)"
replace `v' = "west virginia institute of technology" if old_`v' =="new river state college (now west virginia institute of technology)"
replace `v' = "university of north texas" if old_`v' =="north texas state university (now university of north texas)"
replace `v' = "university of louisiana at monroe" if old_`v' =="northeast louisiana university (now university of louisiana at monroe)"
replace `v' = "point loma nazarene university" if old_`v' =="point loma college (now point loma nazarene university)"
replace `v' = "interamerican university" if old_`v' =="polytechnic institute of puerto rico (now interamerican university)"
replace `v' = "randolph college" if old_`v' =="randolph-macon woman`s college (now randolph college)"
replace `v' = "rice university" if old_`v' =="rice institute (now rice university)"
replace `v' = "brigham young university -- idaho" if old_`v' =="ricks college (now brigham young university -- idaho)"
replace `v' = "university of san diego" if old_`v' =="san diego college for men (now university of san diego)"
replace `v' = "southeastern oklahoma state university" if old_`v' =="southeastern state college (now southeastern oklahoma state university)"
replace `v' = "missouri state university" if old_`v' =="southwest missouri state university (now missouri state university)"
replace `v' = "texas state university" if old_`v' =="southwest texas state university (now texas state university)"
replace `v' = "rhodes college" if old_`v' =="southwestern at memphis (now rhodes college)"
replace `v' = "st. joseph`s university" if old_`v' =="st. joseph`s college (now st. joseph`s university)"
replace `v' = "texas tech university" if old_`v' =="texas technical college (now texas tech university)"
replace `v' = "university of toledo" if old_`v' =="toledo university (now university of toledo)"
replace `v' = "trinity washington university" if old_`v' =="trinity college (now trinity washington university)"
replace `v' = "alliant international university" if old_`v' =="united states international university (now alliant international university)"
replace `v' = "university of detroit mercy" if old_`v' =="university of detroit (now university of detroit mercy)"
replace `v' = "university of detroit mercy school of law" if old_`v' =="university of detroit law school (now university of detroit mercy school of law)"
replace `v' = "university of new orleans" if old_`v' =="university of louisiana in new orleans (now university of new orleans)"
replace `v' = "santa clara university" if old_`v' =="university of santa clara (now santa clara university)"
replace `v' = "university of louisiana at lafayette" if old_`v' =="university of southwestern louisiana (now university of louisiana at lafayette)"
replace `v' = "wayne state university" if old_`v' =="wayne university (now wayne state university)"
replace `v' = "wayne state university law school" if old_`v' =="wayne university (now wayne state university) law school"
replace `v' = "case western reserve university" if old_`v' =="western reserve university (now case western reserve university)"
replace `v' = "western state colorado university" if old_`v' =="western state college (now western state colorado university)"
replace `v' = "youngstown state university" if old_`v' =="youngstown college (now youngstown state university)"
replace `v' = "georgetown university law center" if old_`v' =="georgetown college (now georgetown university) law center"
replace `v' = "mckinney school of law" if old_`v' =="indiana university school of law -- indianapolis (now mckinney school of law)"
replace `v' = "case western reserve university school of law" if old_`v' =="western reserve university (now case western reserve university) school of law"
replace `v' = "georgetown university law center" if old_`v' =="georgetown college law school (now georgetown university law center)"
replace `v' = "university of akron school of law" if old_`v' =="akron school of law (now university of akron school of law)"
replace `v' = "texas a & m university -- commerce" if old_`v' =="east texas state university (now texas a & m university -- commerce)"
replace `v' = "princeton university" if old_`v' =="college of new jersey (now princeton university)"
replace `v' = "antonin scalia law school" if old_`v' =="george mason university school of law (now antonin scalia law school)"
replace `v' = "university of new hampshire school of law" if old_`v' =="franklin pierce law center (now university of new hampshire school of law)"
replace `v' = "george mason university school of law" if old_`v' =="international school of law (now george mason university school of law)"
replace `v' = "mitchell hamline school of law" if old_`v' =="william mitchell college of law (now mitchell hamline school of law)"
replace `v' = "clark atlanta university" if old_`v' =="atlanta university (now clark atlanta university)"
replace `v' = "university of southern mississippi" if old_`v' =="mississippi southern college (now university of southern mississippi)"
replace `v' = "university of san diego school of law" if old_`v' =="san diego school of law (now university of san diego school of law)"
replace `v' = "george washington university law school" if old_`v' =="columbian university school of law (now george washington university law school)"
replace `v' = "santa clara university, school of law" if old_`v' =="university of santa clara (now santa clara university) school of law"
replace `v' = "seattle university school of law" if old_`v' =="university of puget sound school of law (now seattle university school of law)"
replace `v' = "university of memphis, humphreys school of law" if old_`v' =="memphis state university (now university of memphis), humphreys school of law"
replace `v' = "university of central oklahoma" if old_`v' =="central state university (now university of central oklahoma)"
replace `v' = "rutgers school of law -- camden" if old_`v' =="south jersey law school (now rutgers school of law -- camden)"
replace `v' = "university of toledo college of law" if old_`v' =="toledo university (now university of toledo) college of law"
replace `v' = "sit graduate institute" if old_`v' =="school for international training (now sit graduate institute)"
replace `v' = "youngstown state university" if old_`v' =="youngstown university (now youngstown state university)"
replace `v' = "university of missouri-kansas city school of law" if old_`v' =="kansas city school of law (now university of missouri-kansas city school of law)"
replace `v' = "national judicial college" if old_`v' =="national college of state trial judges (now national judicial college)"
replace `v' = "thomas jefferson school of law" if old_`v' =="western state university college of law (now thomas jefferson school of law)"
replace `v' = "univ. of the district of columbia, clarke sch. of law" if old_`v' =="antioch sch. of law (now univ. of the district of columbia, clarke sch. of law)"
}	

foreach i of numlist 1/5 {
	gen fixschool`i' = 1 if strpos(school`i', "now ")
	gen clean_school`i' = school`i'
}

*Cleaning school names 
foreach v of varlist school* { 
	replace clean_`v' = usubinstr(clean_`v',"-"," , ",.)
	replace clean_`v' = usubinstr(clean_`v',",","",.)
	replace clean_`v' = usubinstr(clean_`v',"honors college","",.)
	replace clean_`v' = usubinstr(clean_`v',"`","",.)
	replace clean_`v' = usubinstr(clean_`v',"'","",.)
	replace clean_`v' = strtrim(clean_`v')
	replace clean_`v' = stritrim(clean_`v')
	}

foreach i of numlist 1/5 {
	gen lawschool`i' = ""
	replace lawschool`i' = clean_school`i' if strpos(clean_school`i',"law")
	replace lawschool`i' = clean_school`i' if strpos(degree`i', "jd")
	replace lawschool`i' = clean_school`i' if strpos(degree`i', "llm")
	replace lawschool`i' = clean_school`i' if strpos(degree`i', "llb")
	
	gen lawdegree`i' = . 
	replace lawdegree`i' = degreeyear`i' if lawschool`i'!=""
	
	gen lawschool`i'_rank = .
	gen tradt14_rank`i' = .
}


count if ///
	lawschool1=="university of california berkeley, school of law" ///
	| lawschool2=="university of california berkeley, school of law" ///
	| lawschool3=="university of california berkeley, school of law" ///
	| lawschool4=="university of california berkeley, school of law" ///
	| lawschool5=="university of california berkeley, school of law" 

foreach v of varlist lawschool1 lawschool2 lawschool3 lawschool4 lawschool5 { 
replace `v'_rank = 7 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1987
replace `v'_rank = 13 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1990
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1991
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1992
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1993
replace `v'_rank = 10 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1994
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1995
replace `v'_rank = 12.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1996
replace `v'_rank = 9 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1997
replace `v'_rank = 7 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1998
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==1999
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2000
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2001
replace `v'_rank = 9 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2002
replace `v'_rank = 7.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2003
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2004
replace `v'_rank = 13 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2005
replace `v'_rank = 11.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2006
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2007
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2008
replace `v'_rank = 6 if `v' == "university of california berkeley boalt hall school of jurisprudence" & lawdegreeyear==2009
replace `v'_rank = 7 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1987
replace `v'_rank = 13 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1990
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1991
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1992
replace `v'_rank = 12 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1993
replace `v'_rank = 10 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1994
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1995
replace `v'_rank = 12.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1996
replace `v'_rank = 9 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1997
replace `v'_rank = 7 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1998
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==1999
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2000
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2001
replace `v'_rank = 9 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2002
replace `v'_rank = 7.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2003
replace `v'_rank = 10.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2004
replace `v'_rank = 13 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2005
replace `v'_rank = 11.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2006
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2007
replace `v'_rank = 8.1 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2008
replace `v'_rank = 6 if `v' == "university of california berkeley boalt hall school of law" & lawdegreeyear==2009
replace `v'_rank = 20 if `v' == "boston college law school" & lawdegreeyear==1990
replace `v'_rank = 19 if `v' == "boston college law school" & lawdegreeyear==1993
replace `v'_rank = 20.1 if `v' == "boston university school of law" & lawdegreeyear==2006
replace `v'_rank = 20.1 if `v' == "boston university school of law" & lawdegreeyear==2008
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==1987
replace `v'_rank = 2 if `v' == "university of chicago law school" & lawdegreeyear==1990
replace `v'_rank = 3 if `v' == "university of chicago law school" & lawdegreeyear==1991
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1992
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1993
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1994
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1995
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1996
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1997
replace `v'_rank = 4 if `v' == "university of chicago law school" & lawdegreeyear==1998
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==1999
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2000
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2001
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2002
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2003
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2004
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2005
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2006
replace `v'_rank = 6 if `v' == "university of chicago law school" & lawdegreeyear==2007
replace `v'_rank = 6.1 if `v' == "university of chicago law school" & lawdegreeyear==2008
replace `v'_rank = 7.1 if `v' == "university of chicago law school" & lawdegreeyear==2009
replace `v'_rank = 4.1 if `v' == "columbia law school" & lawdegreeyear==1987
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==1990
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1991
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1992
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1993
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1994
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1995
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1996
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1997
replace `v'_rank = 3 if `v' == "columbia law school" & lawdegreeyear==1998
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==1999
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==2000
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==2001
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2002
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2003
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2004
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2005
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2006
replace `v'_rank = 4.1 if `v' == "columbia law school" & lawdegreeyear==2007
replace `v'_rank = 5 if `v' == "columbia law school" & lawdegreeyear==2008
replace `v'_rank = 4 if `v' == "columbia law school" & lawdegreeyear==2009
replace `v'_rank = 15 if `v' == "cornell law school" & lawdegreeyear==1987
replace `v'_rank = 14 if `v' == "cornell law school" & lawdegreeyear==1990
replace `v'_rank = 13 if `v' == "cornell law school" & lawdegreeyear==1991
replace `v'_rank = 14 if `v' == "cornell law school" & lawdegreeyear==1992
replace `v'_rank = 14 if `v' == "cornell law school" & lawdegreeyear==1993
replace `v'_rank = 11 if `v' == "cornell law school" & lawdegreeyear==1994
replace `v'_rank = 14 if `v' == "cornell law school" & lawdegreeyear==1995
replace `v'_rank = 11 if `v' == "cornell law school" & lawdegreeyear==1996
replace `v'_rank = 12 if `v' == "cornell law school" & lawdegreeyear==1997
replace `v'_rank = 12.1 if `v' == "cornell law school" & lawdegreeyear==1998
replace `v'_rank = 20.2 if `v' == "cornell law school" & lawdegreeyear==1999
replace `v'_rank = 10.2 if `v' == "cornell law school" & lawdegreeyear==2000
replace `v'_rank = 10.1 if `v' == "cornell law school" & lawdegreeyear==2001
replace `v'_rank = 12 if `v' == "cornell law school" & lawdegreeyear==2002
replace `v'_rank = 13 if `v' == "cornell law school" & lawdegreeyear==2003
replace `v'_rank = 10.2 if `v' == "cornell law school" & lawdegreeyear==2004
replace `v'_rank = 12 if `v' == "cornell law school" & lawdegreeyear==2005
replace `v'_rank = 11.2 if `v' == "cornell law school" & lawdegreeyear==2006
replace `v'_rank = 13 if `v' == "cornell law school" & lawdegreeyear==2007
replace `v'_rank = 13 if `v' == "cornell law school" & lawdegreeyear==2008
replace `v'_rank = 12.1 if `v' == "cornell law school" & lawdegreeyear==2009
replace `v'_rank = 12 if `v' == "duke university school of law" & lawdegreeyear==1987
replace `v'_rank = 8 if `v' == "duke university school of law" & lawdegreeyear==1990
replace `v'_rank = 9 if `v' == "duke university school of law" & lawdegreeyear==1991
replace `v'_rank = 9 if `v' == "duke university school of law" & lawdegreeyear==1992
replace `v'_rank = 9 if `v' == "duke university school of law" & lawdegreeyear==1993
replace `v'_rank = 7 if `v' == "duke university school of law" & lawdegreeyear==1994
replace `v'_rank = 8.2 if `v' == "duke university school of law" & lawdegreeyear==1995
replace `v'_rank = 10 if `v' == "duke university school of law" & lawdegreeyear==1996
replace `v'_rank = 10 if `v' == "duke university school of law" & lawdegreeyear==1997
replace `v'_rank = 8.1 if `v' == "duke university school of law" & lawdegreeyear==1998
replace `v'_rank = 8.1 if `v' == "duke university school of law" & lawdegreeyear==1999
replace `v'_rank = 8.1 if `v' == "duke university school of law" & lawdegreeyear==2000
replace `v'_rank = 10.2 if `v' == "duke university school of law" & lawdegreeyear==2001
replace `v'_rank = 10.1 if `v' == "duke university school of law" & lawdegreeyear==2002
replace `v'_rank = 12 if `v' == "duke university school of law" & lawdegreeyear==2003
replace `v'_rank = 12.1 if `v' == "duke university school of law" & lawdegreeyear==2004
replace `v'_rank = 10.1 if `v' == "duke university school of law" & lawdegreeyear==2005
replace `v'_rank = 11.3 if `v' == "duke university school of law" & lawdegreeyear==2006
replace `v'_rank = 11 if `v' == "duke university school of law" & lawdegreeyear==2007
replace `v'_rank = 10.1 if `v' == "duke university school of law" & lawdegreeyear==2008
replace `v'_rank = 12.2 if `v' == "duke university school of law" & lawdegreeyear==2009
replace `v'_rank = 20.1 if `v' == "george washington university law school" & lawdegreeyear==1998
replace `v'_rank = 20.1 if `v' == "george washington university law school" & lawdegreeyear==2005
replace `v'_rank = 20.2 if `v' == "george washington university law school" & lawdegreeyear==2006
replace `v'_rank = 19.1 if `v' == "george washington university law school" & lawdegreeyear==2007
replace `v'_rank = 20 if `v' == "george washington university law school" & lawdegreeyear==2009
replace `v'_rank = 13 if `v' == "georgetown university law center" & lawdegreeyear==1987
replace `v'_rank = 12 if `v' == "georgetown university law center" & lawdegreeyear==1990
replace `v'_rank = 11 if `v' == "georgetown university law center" & lawdegreeyear==1991
replace `v'_rank = 11 if `v' == "georgetown university law center" & lawdegreeyear==1992
replace `v'_rank = 10 if `v' == "georgetown university law center" & lawdegreeyear==1993
replace `v'_rank = 13 if `v' == "georgetown university law center" & lawdegreeyear==1994
replace `v'_rank = 13 if `v' == "georgetown university law center" & lawdegreeyear==1995
replace `v'_rank = 12.2 if `v' == "georgetown university law center" & lawdegreeyear==1996
replace `v'_rank = 13 if `v' == "georgetown university law center" & lawdegreeyear==1997
replace `v'_rank = 12.2 if `v' == "georgetown university law center" & lawdegreeyear==1998
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==1999
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2000
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2001
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2002
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2003
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2004
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2005
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2006
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2007
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2008
replace `v'_rank = 14 if `v' == "georgetown university law center" & lawdegreeyear==2009
replace `v'_rank = 1 if `v' == "harvard law school" & lawdegreeyear==1987
replace `v'_rank = 5 if `v' == "harvard law school" & lawdegreeyear==1990
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1991
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1992
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1993
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1994
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==1995
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1996
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==1997
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==1998
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==1999
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==2000
replace `v'_rank = 3 if `v' == "harvard law school" & lawdegreeyear==2001
replace `v'_rank = 3 if `v' == "harvard law school" & lawdegreeyear==2002
replace `v'_rank = 3 if `v' == "harvard law school" & lawdegreeyear==2003
replace `v'_rank = 3 if `v' == "harvard law school" & lawdegreeyear==2004
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==2005
replace `v'_rank = 2 if `v' == "harvard law school" & lawdegreeyear==2006
replace `v'_rank = 3 if `v' == "harvard law school" & lawdegreeyear==2007
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==2008
replace `v'_rank = 2.1 if `v' == "harvard law school" & lawdegreeyear==2009
replace `v'_rank = 17.1 if `v' == "university of illinois college of law" & lawdegreeyear==1987
replace `v'_rank = 20 if `v' == "university of illinois college of law" & lawdegreeyear==1995
replace `v'_rank = 19 if `v' == "university of illinois college of law" & lawdegreeyear==1996
replace `v'_rank = 19 if `v' == "university of illinois college of law" & lawdegreeyear==1997
replace `v'_rank = 20.2 if `v' == "university of illinois college of law" & lawdegreeyear==1998
replace `v'_rank = 19 if `v' == "university of iowa law school" & lawdegreeyear==1991
replace `v'_rank = 19 if `v' == "university of iowa law school" & lawdegreeyear==1994
replace `v'_rank = 19 if `v' == "university of iowa law school" & lawdegreeyear==1995
replace `v'_rank = 20.1 if `v' == "university of iowa law school" & lawdegreeyear==2002
replace `v'_rank = 18.1 if `v' == "university of iowa law school" & lawdegreeyear==2003
replace `v'_rank = 21 if `v' == "university of iowa law school" & lawdegreeyear==2004
replace `v'_rank = 3 if `v' == "university of michigan law school" & lawdegreeyear==1987
replace `v'_rank = 7 if `v' == "university of michigan law school" & lawdegreeyear==1990
replace `v'_rank = 6 if `v' == "university of michigan law school" & lawdegreeyear==1991
replace `v'_rank = 6 if `v' == "university of michigan law school" & lawdegreeyear==1992
replace `v'_rank = 7 if `v' == "university of michigan law school" & lawdegreeyear==1993
replace `v'_rank = 8 if `v' == "university of michigan law school" & lawdegreeyear==1994
replace `v'_rank = 8.3 if `v' == "university of michigan law school" & lawdegreeyear==1995
replace `v'_rank = 7 if `v' == "university of michigan law school" & lawdegreeyear==1996
replace `v'_rank = 7 if `v' == "university of michigan law school" & lawdegreeyear==1997
replace `v'_rank = 8.2 if `v' == "university of michigan law school" & lawdegreeyear==1998
replace `v'_rank = 8.2 if `v' == "university of michigan law school" & lawdegreeyear==1999
replace `v'_rank = 8.2 if `v' == "university of michigan law school" & lawdegreeyear==2000
replace `v'_rank = 7 if `v' == "university of michigan law school" & lawdegreeyear==2001
replace `v'_rank = 7.1 if `v' == "university of michigan law school" & lawdegreeyear==2002
replace `v'_rank = 7.2 if `v' == "university of michigan law school" & lawdegreeyear==2003
replace `v'_rank = 7.1 if `v' == "university of michigan law school" & lawdegreeyear==2004
replace `v'_rank = 7.1 if `v' == "university of michigan law school" & lawdegreeyear==2005
replace `v'_rank = 8.1 if `v' == "university of michigan law school" & lawdegreeyear==2006
replace `v'_rank = 8.2 if `v' == "university of michigan law school" & lawdegreeyear==2007
replace `v'_rank = 8.2 if `v' == "university of michigan law school" & lawdegreeyear==2008
replace `v'_rank = 9.1 if `v' == "university of michigan law school" & lawdegreeyear==2009
replace `v'_rank = 19 if `v' == "university of minnesota law school" & lawdegreeyear==1987
replace `v'_rank = 17 if `v' == "university of minnesota law school" & lawdegreeyear==1994
replace `v'_rank = 18 if `v' == "university of minnesota law school" & lawdegreeyear==1995
replace `v'_rank = 20 if `v' == "university of minnesota law school" & lawdegreeyear==1997
replace `v'_rank = 18 if `v' == "university of minnesota law school" & lawdegreeyear==1998
replace `v'_rank = 18.1 if `v' == "university of minnesota law school" & lawdegreeyear==1999
replace `v'_rank = 18.1 if `v' == "university of minnesota law school" & lawdegreeyear==2000
replace `v'_rank = 19 if `v' == "university of minnesota law school" & lawdegreeyear==2001
replace `v'_rank = 19 if `v' == "university of minnesota law school" & lawdegreeyear==2002
replace `v'_rank = 18.2 if `v' == "university of minnesota law school" & lawdegreeyear==2003
replace `v'_rank = 19.1 if `v' == "university of minnesota law school" & lawdegreeyear==2004
replace `v'_rank = 19 if `v' == "university of minnesota law school" & lawdegreeyear==2005
replace `v'_rank = 19 if `v' == "university of minnesota law school" & lawdegreeyear==2006
replace `v'_rank = 19.2 if `v' == "university of minnesota law school" & lawdegreeyear==2007
replace `v'_rank = 20.2 if `v' == "university of minnesota law school" & lawdegreeyear==2008
replace `v'_rank = 9 if `v' == "new york university school of law" & lawdegreeyear==1987
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1990
replace `v'_rank = 7 if `v' == "new york university school of law" & lawdegreeyear==1991
replace `v'_rank = 7 if `v' == "new york university school of law" & lawdegreeyear==1992
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1993
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1994
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1995
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1996
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1997
replace `v'_rank = 6 if `v' == "new york university school of law" & lawdegreeyear==1998
replace `v'_rank = 4 if `v' == "new york university school of law" & lawdegreeyear==1999
replace `v'_rank = 4 if `v' == "new york university school of law" & lawdegreeyear==2000
replace `v'_rank = 4 if `v' == "new york university school of law" & lawdegreeyear==2001
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2002
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2003
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2004
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2005
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2006
replace `v'_rank = 4.2 if `v' == "new york university school of law" & lawdegreeyear==2007
replace `v'_rank = 4 if `v' == "new york university school of law" & lawdegreeyear==2008
replace `v'_rank = 5 if `v' == "new york university school of law" & lawdegreeyear==2009
replace `v'_rank = 16 if `v' == "northwestern university school of law" & lawdegreeyear==1987
replace `v'_rank = 11 if `v' == "northwestern university school of law" & lawdegreeyear==1990
replace `v'_rank = 14 if `v' == "northwestern university school of law" & lawdegreeyear==1991
replace `v'_rank = 13 if `v' == "northwestern university school of law" & lawdegreeyear==1992
replace `v'_rank = 13 if `v' == "northwestern university school of law" & lawdegreeyear==1993
replace `v'_rank = 12 if `v' == "northwestern university school of law" & lawdegreeyear==1994
replace `v'_rank = 11.1 if `v' == "northwestern university school of law" & lawdegreeyear==1995
replace `v'_rank = 14 if `v' == "northwestern university school of law" & lawdegreeyear==1996
replace `v'_rank = 14 if `v' == "northwestern university school of law" & lawdegreeyear==1997
replace `v'_rank = 12.3 if `v' == "northwestern university school of law" & lawdegreeyear==1998
replace `v'_rank = 12.1 if `v' == "northwestern university school of law" & lawdegreeyear==1999
replace `v'_rank = 12.1 if `v' == "northwestern university school of law" & lawdegreeyear==2000
replace `v'_rank = 12 if `v' == "northwestern university school of law" & lawdegreeyear==2001
replace `v'_rank = 13 if `v' == "northwestern university school of law" & lawdegreeyear==2002
replace `v'_rank = 11 if `v' == "northwestern university school of law" & lawdegreeyear==2003
replace `v'_rank = 12.2 if `v' == "northwestern university school of law" & lawdegreeyear==2004
replace `v'_rank = 10.2 if `v' == "northwestern university school of law" & lawdegreeyear==2005
replace `v'_rank = 10 if `v' == "northwestern university school of law" & lawdegreeyear==2006
replace `v'_rank = 12 if `v' == "northwestern university school of law" & lawdegreeyear==2007
replace `v'_rank = 12 if `v' == "northwestern university school of law" & lawdegreeyear==2008
replace `v'_rank = 9.2 if `v' == "northwestern university school of law" & lawdegreeyear==2009
replace `v'_rank = 19 if `v' == "notre dame law school" & lawdegreeyear==1990
replace `v'_rank = 20 if `v' == "notre dame law school" & lawdegreeyear==1992
replace `v'_rank = 20 if `v' == "notre dame law school" & lawdegreeyear==1993
replace `v'_rank = 20.2 if `v' == "notre dame law school" & lawdegreeyear==2005
replace `v'_rank = 4.2 if `v' == "stanford law school" & lawdegreeyear==1987
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1990
replace `v'_rank = 4 if `v' == "stanford law school" & lawdegreeyear==1991
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1992
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1993
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1994
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==1995
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1996
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==1997
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==1998
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==1999
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==2000
replace `v'_rank = 2 if `v' == "stanford law school" & lawdegreeyear==2001
replace `v'_rank = 2 if `v' == "stanford law school" & lawdegreeyear==2002
replace `v'_rank = 2 if `v' == "stanford law school" & lawdegreeyear==2003
replace `v'_rank = 2 if `v' == "stanford law school" & lawdegreeyear==2004
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==2005
replace `v'_rank = 3 if `v' == "stanford law school" & lawdegreeyear==2006
replace `v'_rank = 2 if `v' == "stanford law school" & lawdegreeyear==2007
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==2008
replace `v'_rank = 2.2 if `v' == "stanford law school" & lawdegreeyear==2009
replace `v'_rank = 11 if `v' == "university of texas school of law" & lawdegreeyear==1987
replace `v'_rank = 16 if `v' == "university of texas school of law" & lawdegreeyear==1990
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==1991
replace `v'_rank = 17 if `v' == "university of texas school of law" & lawdegreeyear==1995
replace `v'_rank = 18 if `v' == "university of texas school of law" & lawdegreeyear==1996
replace `v'_rank = 18 if `v' == "university of texas school of law" & lawdegreeyear==1997
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==1999
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2000
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2001
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2002
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2003
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2004
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==2005
replace `v'_rank = 15.1 if `v' == "university of texas school of law" & lawdegreeyear==2006
replace `v'_rank = 16 if `v' == "university of texas school of law" & lawdegreeyear==2007
replace `v'_rank = 18 if `v' == "university of texas school of law" & lawdegreeyear==2008
replace `v'_rank = 16.1 if `v' == "university of texas school of law" & lawdegreeyear==2009
replace `v'_rank = 20 if `v' == "university of california hastings college of the law" & lawdegreeyear==1991
replace `v'_rank = 19 if `v' == "university of california hastings college of the law" & lawdegreeyear==1992
replace `v'_rank = 20 if `v' == "university of california hastings college of the law" & lawdegreeyear==1994
replace `v'_rank = 14 if `v' == "university of california los angeles school of law" & lawdegreeyear==1987
replace `v'_rank = 18 if `v' == "university of california los angeles school of law" & lawdegreeyear==1990
replace `v'_rank = 18 if `v' == "university of california los angeles school of law" & lawdegreeyear==1991
replace `v'_rank = 17 if `v' == "university of california los angeles school of law" & lawdegreeyear==1992
replace `v'_rank = 17 if `v' == "university of california los angeles school of law" & lawdegreeyear==1993
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==1994
replace `v'_rank = 17 if `v' == "university of california los angeles school of law" & lawdegreeyear==1996
replace `v'_rank = 17 if `v' == "university of california los angeles school of law" & lawdegreeyear==1997
replace `v'_rank = 17 if `v' == "university of california los angeles school of law" & lawdegreeyear==1998
replace `v'_rank = 16.1 if `v' == "university of california los angeles school of law" & lawdegreeyear==1999
replace `v'_rank = 16.1 if `v' == "university of california los angeles school of law" & lawdegreeyear==2000
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==2001
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==2002
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==2003
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==2004
replace `v'_rank = 16 if `v' == "university of california los angeles school of law" & lawdegreeyear==2005
replace `v'_rank = 15.2 if `v' == "university of california los angeles school of law" & lawdegreeyear==2006
replace `v'_rank = 15 if `v' == "university of california los angeles school of law" & lawdegreeyear==2007
replace `v'_rank = 15 if `v' == "university of california los angeles school of law" & lawdegreeyear==2008
replace `v'_rank = 16.2 if `v' == "university of california los angeles school of law" & lawdegreeyear==2009
replace `v'_rank = 17.2 if `v' == "university of southern california law school" & lawdegreeyear==1987
replace `v'_rank = 17 if `v' == "university of southern california law school" & lawdegreeyear==1990
replace `v'_rank = 16 if `v' == "university of southern california law school" & lawdegreeyear==1991
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==1992
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==1993
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==1994
replace `v'_rank = 15 if `v' == "university of southern california law school" & lawdegreeyear==1995
replace `v'_rank = 15 if `v' == "university of southern california law school" & lawdegreeyear==1996
replace `v'_rank = 15 if `v' == "university of southern california law school" & lawdegreeyear==1997
replace `v'_rank = 15 if `v' == "university of southern california law school" & lawdegreeyear==1998
replace `v'_rank = 18.2 if `v' == "university of southern california law school" & lawdegreeyear==1999
replace `v'_rank = 18.2 if `v' == "university of southern california law school" & lawdegreeyear==2000
replace `v'_rank = 17 if `v' == "university of southern california law school" & lawdegreeyear==2001
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==2002
replace `v'_rank = 18.3 if `v' == "university of southern california law school" & lawdegreeyear==2003
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==2004
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==2005
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==2006
replace `v'_rank = 17.1 if `v' == "university of southern california law school" & lawdegreeyear==2007
replace `v'_rank = 16.1 if `v' == "university of southern california law school" & lawdegreeyear==2008
replace `v'_rank = 18 if `v' == "university of southern california law school" & lawdegreeyear==2009
replace `v'_rank = 10 if `v' == "university of pennsylvania law school" & lawdegreeyear==1987
replace `v'_rank = 9 if `v' == "university of pennsylvania law school" & lawdegreeyear==1990
replace `v'_rank = 10 if `v' == "university of pennsylvania law school" & lawdegreeyear==1991
replace `v'_rank = 10 if `v' == "university of pennsylvania law school" & lawdegreeyear==1992
replace `v'_rank = 11 if `v' == "university of pennsylvania law school" & lawdegreeyear==1993
replace `v'_rank = 9 if `v' == "university of pennsylvania law school" & lawdegreeyear==1994
replace `v'_rank = 11.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==1995
replace `v'_rank = 8 if `v' == "university of pennsylvania law school" & lawdegreeyear==1996
replace `v'_rank = 11 if `v' == "university of pennsylvania law school" & lawdegreeyear==1997
replace `v'_rank = 8.3 if `v' == "university of pennsylvania law school" & lawdegreeyear==1998
replace `v'_rank = 12.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==1999
replace `v'_rank = 12.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2000
replace `v'_rank = 13 if `v' == "university of pennsylvania law school" & lawdegreeyear==2001
replace `v'_rank = 10.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2002
replace `v'_rank = 7.3 if `v' == "university of pennsylvania law school" & lawdegreeyear==2003
replace `v'_rank = 7.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2004
replace `v'_rank = 7.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2005
replace `v'_rank = 7 if `v' == "university of pennsylvania law school" & lawdegreeyear==2006
replace `v'_rank = 7 if `v' == "university of pennsylvania law school" & lawdegreeyear==2007
replace `v'_rank = 6.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2008
replace `v'_rank = 7.2 if `v' == "university of pennsylvania law school" & lawdegreeyear==2009
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==1992
replace `v'_rank = 15 if `v' == "university of texas school of law" & lawdegreeyear==1993
replace `v'_rank = 15 if `v' == "vanderbilt university law school" & lawdegreeyear==1990
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==1991
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1992
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1993
replace `v'_rank = 15 if `v' == "vanderbilt university law school" & lawdegreeyear==1994
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1995
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1996
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1997
replace `v'_rank = 16 if `v' == "vanderbilt university law school" & lawdegreeyear==1998
replace `v'_rank = 16.2 if `v' == "vanderbilt university law school" & lawdegreeyear==1999
replace `v'_rank = 16.2 if `v' == "vanderbilt university law school" & lawdegreeyear==2000
replace `v'_rank = 18 if `v' == "vanderbilt university law school" & lawdegreeyear==2001
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==2002
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==2003
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==2004
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==2005
replace `v'_rank = 17 if `v' == "vanderbilt university law school" & lawdegreeyear==2006
replace `v'_rank = 17.2 if `v' == "vanderbilt university law school" & lawdegreeyear==2007
replace `v'_rank = 16.2 if `v' == "vanderbilt university law school" & lawdegreeyear==2008
replace `v'_rank = 15 if `v' == "vanderbilt university law school" & lawdegreeyear==2009
replace `v'_rank = 8 if `v' == "university of virginia school of law" & lawdegreeyear==1987
replace `v'_rank = 10 if `v' == "university of virginia school of law" & lawdegreeyear==1990
replace `v'_rank = 8 if `v' == "university of virginia school of law" & lawdegreeyear==1991
replace `v'_rank = 8 if `v' == "university of virginia school of law" & lawdegreeyear==1992
replace `v'_rank = 8 if `v' == "university of virginia school of law" & lawdegreeyear==1993
replace `v'_rank = 14 if `v' == "university of virginia school of law" & lawdegreeyear==1994
replace `v'_rank = 7 if `v' == "university of virginia school of law" & lawdegreeyear==1995
replace `v'_rank = 9 if `v' == "university of virginia school of law" & lawdegreeyear==1996
replace `v'_rank = 8 if `v' == "university of virginia school of law" & lawdegreeyear==1997
replace `v'_rank = 8.4 if `v' == "university of virginia school of law" & lawdegreeyear==1998
replace `v'_rank = 7 if `v' == "university of virginia school of law" & lawdegreeyear==1999
replace `v'_rank = 7 if `v' == "university of virginia school of law" & lawdegreeyear==2000
replace `v'_rank = 8.2 if `v' == "university of virginia school of law" & lawdegreeyear==2001
replace `v'_rank = 7.2 if `v' == "university of virginia school of law" & lawdegreeyear==2002
replace `v'_rank = 7.4 if `v' == "university of virginia school of law" & lawdegreeyear==2003
replace `v'_rank = 9 if `v' == "university of virginia school of law" & lawdegreeyear==2004
replace `v'_rank = 9 if `v' == "university of virginia school of law" & lawdegreeyear==2005
replace `v'_rank = 8.2 if `v' == "university of virginia school of law" & lawdegreeyear==2006
replace `v'_rank = 8.3 if `v' == "university of virginia school of law" & lawdegreeyear==2007
replace `v'_rank = 10.2 if `v' == "university of virginia school of law" & lawdegreeyear==2008
replace `v'_rank = 9.3 if `v' == "university of virginia school of law" & lawdegreeyear==2009
replace `v'_rank = 20 if `v' == "washington and lee school of law" & lawdegreeyear==1996
replace `v'_rank = 19 if `v' == "washington and lee school of law" & lawdegreeyear==1998
replace `v'_rank = 20.1 if `v' == "washington and lee school of law" & lawdegreeyear==1999
replace `v'_rank = 20 if `v' == "washington and lee school of law" & lawdegreeyear==2000
replace `v'_rank = 20 if `v' == "washington and lee school of law" & lawdegreeyear==2001
replace `v'_rank = 20.2 if `v' == "washington and lee school of law" & lawdegreeyear==2002
replace `v'_rank = 18.4 if `v' == "washington and lee school of law" & lawdegreeyear==2003
replace `v'_rank = 19.2 if `v' == "washington and lee school of law" & lawdegreeyear==2004
replace `v'_rank = 20.3 if `v' == "st. louis university school of law" & lawdegreeyear==2005
replace `v'_rank = 19.3 if `v' == "st. louis university school of law" & lawdegreeyear==2007
replace `v'_rank = 19 if `v' == "st. louis university school of law" & lawdegreeyear==2008
replace `v'_rank = 19 if `v' == "st. louis university school of law" & lawdegreeyear==2009
replace `v'_rank = 20 if `v' == "university of wisconsin law school" & lawdegreeyear==1987
replace `v'_rank = 2 if `v' == "yale law school" & lawdegreeyear==1987
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1990
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1991
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1992
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1993
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1994
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1995
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1996
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1997
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1998
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==1999
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2000
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2001
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2002
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2003
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2004
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2005
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2006
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2007
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2008
replace `v'_rank = 1 if `v' == "yale law school" & lawdegreeyear==2009
}



foreach i of numlist 1/5 {


}
tab lawschool1_rank
tab lawschool2_rank
tab lawschool3_rank
