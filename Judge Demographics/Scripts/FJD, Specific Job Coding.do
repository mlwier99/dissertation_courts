capture cd "/home/michelle/Dropbox/Dissertation/Data/Judge Demographics/Judicial Directory"
/*Director of...
gen career_directorof = "" 
replace career_directorof = `v' if strpos(`v', "director")
replace `v' = "" if strpos(`v', "director") & career_director==1 & career_directorof!=""
*/ 
use "Datasets/Working_Federal Judicial Directory.dta", clear

*Career paths 

split professionalcareer, p(";") gen(careerpath)
tostring careerpath*, replace


tab year

*Big Ones 
capture gen mcareer_judge = 0 
capture gen mcareer_military = 0 
capture gen mcareer_lawclerk = 0 
capture gen mcareer_fedexec = 0 
capture gen mcareer_fedlegislative = 0
capture gen mcareer_fedjudicial = 0 
capture gen mcareer_fedagency = 0 
capture gen mcareer_fedgov = 0 
capture gen mcareer_stategov = 0 
capture gen mcareer_stateexec = 0 
capture gen mcareer_statelegislative = 0
capture gen mcareer_statejudicial = 0 

*Narrower fields 
capture gen career_fedappeals = 0 
gen career_directorof = "" 
capture gen career_assistposecutor = 0 
capture gen career_statetrialcourt = 0
capture gen career_cityjudge = 0
capture gen career_countyjudge = 0
capture gen career_districtjudge = 0
capture gen career_appealsjudge = 0
capture gen career_appealsjudge = 0
capture gen career_appealsjudge = 0
capture gen career_commonpleas = 0
capture gen career_municipaljudge = 0
capture gen career_statehighcourt = 0
capture gen career_clerk_statehighcourt = 0
capture gen career_lawclerk_feddist = 0
capture gen career_lawclerk_fedappeals = 0
capture gen career_lawclerk_lowstatecourt = 0
capture gen career_lawclerk_scotus = 0
capture gen career_lawclerk_fedappeals = 0
capture gen career_statehouse = 0
capture gen career_statehouse = 0
capture gen career_statesenate = 0
capture gen career_bankrupcyjudge = 0
capture gen career_probatejudge = 0
capture gen career_familycourt = 0
capture gen career_juviecourt = 0
capture gen career_stateappealsjudge = 0
capture gen career_universityadmin = 0
capture gen career_juviecourt = 0
capture gen career_familycourt = 0
capture gen career_appealsjudge = 0
capture gen career_privatepractice = 0
capture gen career_army = 0
capture gen career_teacher = 0
capture gen career_legalaid = 0
capture gen career_assistusattorney = 0
capture gen career_usattorney = 0
capture gen career_researcher = 0
capture gen career_marines = 0
capture gen career_publicdefender = 0
capture gen career_staffattorney = 0
capture gen career_adminassistant = 0
capture gen career_legattorney = 0
capture gen career_airforce = 0
capture gen career_legalservices = 0
capture gen career_police = 0
capture gen career_circuitattorneyassistant = 0
capture gen career_criminallaw = 0
capture gen career_trialattorney = 0
capture gen career_schoolprincipal = 0
capture gen career_adminassistant = 0
capture gen career_marines = 0
capture gen career_navy = 0
capture gen career_natguard = 0
capture gen career_assistdistrictattorney = 0
capture gen career_adminassistant = 0
capture gen career_entertainment = 0
capture gen career_assistdistrictattorney = 0
capture gen career_professor = 0
capture gen career_teacher = 0
capture gen career_merchant = 0
capture gen career_jag = 0
capture gen career_assiststateattorney = 0
capture gen career_assistprosecutor = 0
capture gen career_assistattorneygeneral = 0
capture gen career_stateattorney = 0
capture gen career_prosecutor = 0
capture gen career_attorneygeneral = 0
capture gen career_stateattorney = 0
capture gen career_assiststateattorney = 0
capture gen career_districtattorney = 0
capture gen career_assistcorpcounsel = 0
capture gen career_assistcountyattorney = 0
capture gen career_assistcountyattorney = 0
capture gen career_countyattorney = 0
capture gen career_countyattorney = 0
capture gen career_corpcounsel = 0
capture gen career_adminhearingofficer = 0
capture gen career_stateattorney = 0
capture gen career_architect = 0
capture gen career_deputylegcounsel = 0
capture gen career_legislativecounsel = 0
capture gen career_statehouse = 0
capture gen career_statesenate = 0
capture gen career_fbi_agent = 0
capture gen career_magristrate = 0
capture gen career_customsagent = 0
capture gen career_cityattorney = 0
capture gen career_teacher = 0
capture gen career_statehouse = 0
capture gen career_citypolitics = 0
capture gen career_deputysolicitor = 0
capture gen career_assistspecialattorney = 0
capture gen career_adminassistant = 0
capture gen career_politics = 0
capture gen career_statehouse = 0
capture gen career_assistcommonwealthattn = 0
capture gen career_commonwealthattorney = 0
capture gen career_trialjudge = 0
capture gen career_citypolitics = 0
capture gen career_ussenator = 0
capture gen career_ushouse = 0
capture gen career_deputyusmarshall = 0
capture gen career_usmarshall = 0
capture gen career_newspapereditor = 0
capture gen career_deputysolicitor = 0
capture gen career_assistspecialattorney = 0
capture gen career_solicitor = 0
capture gen career_religion = 0
capture gen career_politics = 0
capture gen career_probationofficer = 0
capture gen career_secretaryofstate = 0
capture gen career_warden = 0
capture gen career_regionalattorney = 0
capture gen career_teacher = 0
capture gen career_assistcommonwealthattn = 0
capture gen career_deputycommissoner = 0
capture gen career_deputycommissoner = 0
capture gen career_commissoner = 0
capture gen career_adminassistant = 0
capture gen career_youthwork = 0
capture gen career_statehouse = 0
capture gen career_navalreserve = 0
capture gen career_insurance = 0
capture gen career_citypolitics = 0
capture gen career_peacejustice = 0
capture gen career_probatejudge = 0
capture gen career_childadvocat = 0
capture gen career_mayor = 0
capture gen career_editor = 0
capture gen career_citypolitics = 0
capture gen career_coastguard = 0
capture gen career_naacp = 0
capture gen career_naacp = 0
capture gen career_inspectorgeneral = 0
capture gen career_citypolitics = 0
capture gen career_librarian = 0
capture gen career_adminassistant = 0
capture gen career_postmaster = 0
capture gen career_engineer = 0
capture gen career_researcher = 0
capture gen career_speechwriter = 0
capture gen career_citypolitics = 0
capture gen career_teacher = 0
capture gen career_universityadmin = 0
capture gen career_financeanalyst = 0
capture gen career_attorneadvisor = 0
capture gen career_staffattorney = 0
capture gen career_bailiff = 0
capture gen career_researcher = 0
capture gen career_adminassistant = 0
capture gen career_chemist = 0
capture gen career_regionalattorney = 0
capture gen career_patentexaminer = 0
capture gen career_assistcommonwealthattn = 0
capture gen career_titleexaminer = 0
capture gen career_state = 0
capture gen career_universityadmin = 0
capture gen career_teacher = 0
capture gen career_statehighcourt = 0
capture gen career_prosecutor = 0
capture gen career_judicialconference = 0
capture gen career_director = 0
capture gen career_arbitrator = 0
capture gen career_litigator = 0
capture gen career_chiefjustice = 0
capture gen career_gencounsel = 0
capture gen career_professor = 0
capture gen career_boardmember = 0
capture gen career_arbitrator = 0
capture gen career_seniorattorney = 0
capture gen career_chieflegalcounsel = 0
capture gen career_consultant = 0
capture gen career_vicechair = 0
capture gen career_chairman = 0
capture gen career_specialcounsel = 0
capture gen career_chairman = 0
capture gen career_commissoner = 0
capture gen career_assistcommissoner = 0
capture gen career_fedagency = 0
capture gen career_fedexec = 0
capture gen career_stem = 0
capture gen career_fedjudicialcenter = 0
capture gen career_stateexec = 0
capture gen career_setencecommiss = 0 
capture gen career_fedlegislative = 0 
capture gen career_fedjudicial = 0
capture gen career_litigation = 0
capture gen career_specialcounsel = 0
capture gen career_specialcounsel = 0
capture gen career_adminjudge = 0
capture gen career_chiefcounsel = 0
capture gen career_chiefjudge = 0
capture gen career_seniorjudge = 0
capture gen career_cia = 0
capture gen career_securityintell = 0
capture gen career_judge = 0 

gen careerloc_state = ""
foreach v of varlist careerpath*{
replace careerloc_state  = "alabama" if strpos(`v',"alabama")
replace careerloc_state  = "alaska" if strpos(`v',"alaska")
replace careerloc_state  = "arizona" if strpos(`v',"arizona")
replace careerloc_state  = "arkansas" if strpos(`v',"arkansas")
replace careerloc_state  = "california" if strpos(`v',"california")
replace careerloc_state  = "colorado" if strpos(`v',"colorado")
replace careerloc_state  = "connecticut" if strpos(`v',"connecticut")
replace careerloc_state  = "delaware" if strpos(`v',"delaware")
replace careerloc_state  = "florida" if strpos(`v',"florida")
replace careerloc_state  = "georgia" if strpos(`v',"georgia")
replace careerloc_state  = "hawaii" if strpos(`v',"hawaii")
replace careerloc_state  = "idaho" if strpos(`v',"idaho")
replace careerloc_state  = "illinois" if strpos(`v',"illinois")
replace careerloc_state  = "iowa" if strpos(`v',"iowa")
replace careerloc_state  = "kansas" if strpos(`v',"kansas")
replace careerloc_state  = "kentucky" if strpos(`v',"kentucky")
replace careerloc_state  = "louisiana" if strpos(`v',"louisiana")
replace careerloc_state  = "maine" if strpos(`v',"maine")
replace careerloc_state  = "maryland" if strpos(`v',"maryland")
replace careerloc_state  = "massachusetts" if strpos(`v',"massachusetts")
replace careerloc_state  = "michigan" if strpos(`v',"michigan")
replace careerloc_state  = "minnesota" if strpos(`v',"minnesota")
replace careerloc_state  = "mississippi" if strpos(`v',"mississippi")
replace careerloc_state  = "missouri" if strpos(`v',"missouri")
replace careerloc_state  = "montana" if strpos(`v',"montana")
replace careerloc_state  = "nevada" if strpos(`v',"nevada")
replace careerloc_state  = "new hampshire" if strpos(`v',"new hampshire")
replace careerloc_state  = "new jersey" if strpos(`v',"new jersey")
replace careerloc_state  = "new mexico" if strpos(`v',"new mexico")
replace careerloc_state  = "new york" if strpos(`v',"new york")
replace careerloc_state  = "north carolina" if strpos(`v',"north carolina")
replace careerloc_state  = "north dakota" if strpos(`v',"north dakota")
replace careerloc_state  = "ohio" if strpos(`v',"ohio")
replace careerloc_state  = "oklahoma" if strpos(`v',"oklahoma")
replace careerloc_state  = "oregon" if strpos(`v',"oregon")
replace careerloc_state  = "pennsylvania" if strpos(`v',"pennsylvania")
replace careerloc_state  = "south carolina" if strpos(`v',"south carolina")
replace careerloc_state  = "south dakota" if strpos(`v',"south dakota")
replace careerloc_state  = "tennessee" if strpos(`v',"tennessee")
replace careerloc_state  = "texas" if strpos(`v',"texas")
replace careerloc_state  = "utah" if strpos(`v',"utah")
replace careerloc_state  = "vermont" if strpos(`v',"vermont")
replace careerloc_state  = "virginia" if strpos(`v',"virginia")
replace careerloc_state  = "washington" if strpos(`v',"washington")
replace careerloc_state  = "west virginia" if strpos(`v',"west virginia")
replace careerloc_state  = "wisconsin" if strpos(`v',"wisconsin")
replace careerloc_state  = "wyoming" if strpos(`v',"wyoming")
replace careerloc_state  = "nebraska" if strpos(`v',"nebraska")
replace careerloc_state  = "rhode island" if strpos(`v',"rhode island")
replace careerloc_state  = "indiana" if strpos(`v',"indiana")
}

foreach v of varlist careerpath* { 
*replace 
replace career_statetrialcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "new york")
replace career_cityjudge = 1 if strpos(`v', "judge") & strpos(`v', "city") & strpos(`v', "court")
replace career_countyjudge = 1 if strpos(`v', "judge") & strpos(`v', "county") & strpos(`v', "court")
replace career_districtjudge = 1 if strpos(`v', "judge") & strpos(`v', "district") & strpos(`v', "court")
replace career_appealsjudge = 1 if strpos(`v', "judge") & strpos(`v', "circuit") & strpos(`v', "court")
replace career_appealsjudge = 1 if strpos(`v', "judge") & strpos(`v', "appellate") & strpos(`v', "court")
replace career_appealsjudge = 1 if strpos(`v', "judge") & strpos(`v', "appeals ") & strpos(`v', "court")
replace career_commonpleas = 1 if strpos(`v', "judge") & strpos(`v', "common pleas") & strpos(`v', "court")
replace career_municipaljudge = 1 if strpos(`v', "judge") & strpos(`v', "municipal") & strpos(`v', "court")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "alabama")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "alaska")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "arizona")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "arkansas")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "california")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "colorado")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "connecticut")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "delaware")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "florida")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "georgia")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "hawaii")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "idaho")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "illinois")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "iowa")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "kansas")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "kentucky")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "louisiana")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "maine")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "court of appeals") & strpos(`v', "maryland")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "massachusetts")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "michigan")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "minnesota")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "mississippi")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "missouri")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "montana")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "nevada")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "new hampshire")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "new jersey")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "new mexico")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "court of appeals") & strpos(`v', "new york")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "north carolina")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "north dakota")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "ohio")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "court of criminal appeals") & strpos(`v', "oklahoma")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "oklahoma")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "oregon")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "pennsylvania")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "south carolina")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "south dakota")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "tennessee")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "court of criminal appeals") & strpos(`v', "texas")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "texas")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "utah")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "vermont")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "virginia")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "washington")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "west virginia")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "wisconsin")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "wyoming")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "nebraska")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "rhode island")
replace career_statehighcourt = 1 if strpos(`v', "justice") & strpos(`v', "supreme court") & strpos(`v', "indiana")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "alabama")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "alaska")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "arizona")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "arkansas")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "california")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "colorado")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "connecticut")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "delaware")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "florida")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "georgia")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "hawaii")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "idaho")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "illinois")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "iowa")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "kansas")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "kentucky")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "louisiana")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "maine")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "court of appeals") & strpos(`v', "maryland")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "massachusetts")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "michigan")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "minnesota")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "mississippi")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "missouri")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "montana")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "nevada")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "new hampshire")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "new jersey")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "new mexico")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "court of appeals") & strpos(`v', "new york")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "north carolina")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "north dakota")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "ohio")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "court of criminal appeals") & strpos(`v', "oklahoma")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "oklahoma")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "oregon")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "pennsylvania")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "south carolina")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "south dakota")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "tennessee")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "court of criminal appeals") & strpos(`v', "texas")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "texas")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "utah")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "vermont")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "virginia")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "washington")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "west virginia")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "wisconsin")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "wyoming")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "nebraska")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "rhode island")
replace career_clerk_statehighcourt = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court") & strpos(`v', "indiana")
replace career_lawclerk_feddist = 1 if strpos(`v', "clerk") & strpos(`v', "u.s. district court")
replace career_lawclerk_fedappeals = 1 if strpos(`v', "clerk") & strpos(`v', "u.s. court of appeals")
replace career_lawclerk_lowstatecourt = 1 if strpos(`v', "clerk") & strpos(`v', "court of common pleas")
replace career_lawclerk_scotus = 1 if strpos(`v', "clerk") & strpos(`v', "supreme court of the united states")
replace career_lawclerk_fedappeals = 1 if strpos(`v', "clerk") & strpos(`v', "u.s. circuit")
replace career_statehouse = 1 if strpos(`v', "member") & strpos(`v', "general assembly")
replace career_statehouse = 1 if strpos(`v', "member") & strpos(`v', "state house")
replace career_statesenate = 1 if strpos(`v', "member") & strpos(`v', "state senate")
replace career_bankrupcyjudge = 1 if strpos(`v', "judge") & strpos(`v', "bankrupcy")
replace career_probatejudge = 1 if strpos(`v', "probate") & strpos(`v', "judge")
replace career_familycourt = 1 if strpos(`v', "domestic relations") & strpos(`v', "judge")
replace career_juviecourt = 1 if strpos(`v', "juvenile") & strpos(`v', "judge")
replace career_juviecourt = 1 if strpos(`v', "children") & strpos(`v', "judge")
replace career_familycourt = 1 if strpos(`v', "divorce") & strpos(`v', "judge")
replace career_juviecourt = 1 if strpos(`v', "youth") & strpos(`v', "judge")
replace career_familycourt = 1 if strpos(`v', "family") & strpos(`v', "judge")
replace career_stateappealsjudge = 1 if strpos(`v', "district court of appeal") & strpos(`v', "justice")
replace career_universityadmin = 1 if strpos(`v', "president") & strpos(`v', "university")
replace career_juviecourt = 1 if strpos(`v', "juvenile and domestic relations") & strpos(`v', "court")
replace career_familycourt = 1 if strpos(`v', "juvenile and domestic relations") & strpos(`v', "court")
replace career_appealsjudge = 1 if strpos(`v', "court of appeals") & career_fedappeals==0
replace career_privatepractice = 1 if strpos(`v', "private practice")
replace career_army = 1 if strpos(`v', "army")
replace career_teacher = 1 if strpos(`v', "teacher")
replace career_legalaid = 1 if strpos(`v', "legal aid")
replace career_assistusattorney = 1 if strpos(`v', "assistant u.s. attorney")
replace career_usattorney = 1 if strpos(`v', "u.s. attorney")
replace career_researcher = 1 if strpos(`v', "legal researcher")
replace career_researcher = 1 if strpos(`v', "research assistant")
replace career_marines = 1 if strpos(`v', "marines")
replace career_publicdefender = 1 if strpos(`v', "public defender")
replace career_staffattorney = 1 if strpos(`v', "staff attorney")
replace career_adminassistant = 1 if strpos(`v', "administrative assistant")
replace career_legattorney = 1 if strpos(`v', "legislative assistant")
replace career_airforce = 1 if strpos(`v', "air force")
replace career_legalservices = 1 if strpos(`v', "legal services")
replace career_police = 1 if strpos(`v', "police officer")
replace career_circuitattorneyassistant = 1 if strpos(`v', "assistant circuit attorney")
replace career_criminallaw = 1 if strpos(`v', "criminal")
replace career_trialattorney = 1 if strpos(`v', "trial attorney")
replace career_schoolprincipal = 1 if strpos(`v', "principal")
replace career_adminassistant = 1 if strpos(`v', "personal secretary")
replace career_marines = 1 if strpos(`v', "marine")
replace career_navy = 1 if strpos(`v', "navy")
replace career_natguard = 1 if strpos(`v', "national guard")
replace career_assistdistrictattorney = 1 if strpos(`v', "assistant distrct's attorney")
replace career_adminassistant = 1 if strpos(`v', "private secretary")
replace career_entertainment = 1 if strpos(`v', "television news producer")
replace career_assistdistrictattorney = 1 if strpos(`v', "assistant distrct attorney")
replace career_professor = 1 if strpos(`v', "professor")
replace career_professor = 1 if strpos(`v', "faculty")
replace career_teacher = 1 if strpos(`v', "instructor")
replace career_merchant = 1 if strpos(`v', "merchant")
replace career_jag = 1 if strpos(`v', "jag")
replace career_assiststateattorney = 1 if strpos(`v', "assistant state attorney")
replace career_assistposecutor = 1 if strpos(`v', "assistant prosecutor")
replace career_assistattorneygeneral = 1 if strpos(`v', "assistant attorney general")
replace career_stateattorney = 1 if strpos(`v', "state attorney")
replace career_prosecutor = 1 if strpos(`v', "prosecutor")
replace career_attorneygeneral = 1 if strpos(`v', "attorney general")
replace career_stateattorney = 1 if strpos(`v', "state's attorney")
replace career_assiststateattorney = 1 if strpos(`v', "assistant state's attorney")
replace career_districtattorney = 1 if strpos(`v', "district attorney")
replace career_districtattorney = 1 if strpos(`v', "district's attorney")
replace career_assistcorpcounsel = 1 if strpos(`v', "assistant corporation counsel")
replace career_assistcountyattorney = 1 if strpos(`v', "assistant county's attorney")
replace career_assistcountyattorney = 1 if strpos(`v', "assistant county attorney")
replace career_countyattorney = 1 if strpos(`v', "county's attorney")
replace career_countyattorney = 1 if strpos(`v', "county attorney")
replace career_corpcounsel = 1 if strpos(`v', "corporation counsel")
replace career_adminhearingofficer = 1 if strpos(`v', "administrative hearing officer")
replace career_stateattorney = 1 if strpos(`v', "state's attorney's")
replace career_architect = 1 if strpos(`v', "architect")
replace career_deputylegcounsel = 1 if strpos(`v', "deputy legislative counsel")
replace career_legislativecounsel = 1 if strpos(`v', "legislative counsel")
replace career_statehouse = 1 if strpos(`v', "state representative")
replace career_statesenate = 1 if strpos(`v', "state senator")
replace career_fbi_agent = 1 if strpos(`v', "special agent, federal bureau of investigation")
replace career_magristrate = 1 if strpos(`v', "magistrate")
replace career_customsagent = 1 if strpos(`v', "u.s. customs services")
replace career_cityattorney = 1 if strpos(`v', "city attorney")
replace career_cityattorney = 1 if strpos(`v', "city's attorney")
replace career_politics = 1 if strpos(`v', "democratic floor leader")
replace career_teacher = 1 if strpos(`v', "lecturer")
replace career_teacher = 1 if strpos(`v', "teaching fellow")
replace career_statehouse = 1 if strpos(`v', "house of commons")
replace career_citypolitics = 1 if strpos(`v', "common council")
replace career_deputysolicitor = 1 if strpos(`v', "assistant solicitor")
replace career_assistspecialattorney = 1 if strpos(`v', "assistant special attorney")
replace career_adminassistant = 1 if strpos(`v', "secretary")
replace career_politics = 1 if strpos(`v', "deputy campaign manager")
replace career_politics = 1 if strpos(`v', "assistant campaign manager")
replace career_politics = 1 if strpos(`v', "campaign field coordinator")
replace career_statehouse = 1 if strpos(`v', "state assemblyman")
replace career_assistcommonwealthattn = 1 if strpos(`v', "assistant commonwealth attorney")
replace career_commonwealthattorney = 1 if strpos(`v', "commonwealth attorney")
replace career_trialjudge = 1 if strpos(`v', "superior court of california")
replace career_citypolitics = 1 if strpos(`v', "city council")
replace career_ussenator = 1 if strpos(`v', "u.s. senator")
replace career_ushouse = 1 if strpos(`v', "u.s. representative")
replace career_deputyusmarshall = 1 if strpos(`v', "deputy u.s. marshall")
replace career_usmarshall = 1 if strpos(`v', "u.s. marshall")
replace career_newspapereditor = 1 if strpos(`v', "newspaper editor")
replace career_deputysolicitor = 1 if strpos(`v', "deputy solicitor")
replace career_assistspecialattorney = 1 if strpos(`v', "deputy special attorney")
replace career_solicitor = 1 if strpos(`v', "solicitor")
replace career_religion = 1 if strpos(`v', "pastor")
replace career_politics = 1 if strpos(`v', "campaign manager")
replace career_probationofficer = 1 if strpos(`v', "probation officer")
replace career_secretaryofstate = 1 if strpos(`v', "secretary of state")
replace career_warden = 1 if strpos(`v', "warden")
replace career_regionalattorney = 1 if strpos(`v', "regional attorney")
replace career_teacher = 1 if strpos(`v', "teaching fellow")
replace career_teacher = 1 if strpos(`v', "lecturer")
replace career_assistcommonwealthattn = 1 if strpos(`v', "assistant commonwealth attorney")
replace career_deputycommissoner = 1 if strpos(`v', "assistant commissoner")
replace career_deputycommissoner = 1 if strpos(`v', "deputy commissoner")
replace career_commissoner = 1 if strpos(`v', "commissoner")
replace career_adminassistant = 1 if strpos(`v', "executive assistant")
replace career_youthwork = 1 if strpos(`v', "youth counselor")
replace career_youthwork = 1 if strpos(`v', "youth director")
replace career_statehouse = 1 if strpos(`v', "commons house of assembly")
replace career_statehouse = 1 if strpos(`v', "representative")
replace career_navalreserve = 1 if strpos(`v', "naval reserve")
replace career_navalreserve = 1 if strpos(`v', "navalreserve")
replace career_insurance = 1 if strpos(`v', "underwrighter")
replace career_citypolitics = 1 if strpos(`v', "city treasuer")
replace career_peacejustice = 1 if strpos(`v', "justiceofthepeace")
replace career_probatejudge = 1 if strpos(`v', "probate court")
replace career_childadvocat = 1 if strpos(`v', "childadvocate")
replace career_mayor = 1 if strpos(`v', "mayor")
replace career_editor = 1 if strpos(`v', "editor")
replace career_citypolitics = 1 if strpos(`v', "alderman")
replace career_coastguard = 1 if strpos(`v', "coast guard")
replace career_naacp = 1 if strpos(`v', "national american association of colored people")
replace career_naacp = 1 if strpos(`v', "naacp")
replace career_inspectorgeneral = 1 if strpos(`v', "inspectorgeneral")
replace career_citypolitics = 1 if strpos(`v', "citypolitics")
replace career_librarian = 1 if strpos(`v', "librarian")
replace career_adminassistant = 1 if strpos(`v', "legal assistant")
replace career_postmaster = 1 if strpos(`v', "postmaster")
replace career_engineer = 1 if strpos(`v', "engineer")
replace career_researcher = 1 if strpos(`v', "research associate")
replace career_speechwriter = 1 if strpos(`v', "speech writer")
replace career_citypolitics = 1 if strpos(`v', "town councilman")
replace career_teacher = 1 if strpos(`v', "fellow in residence")
replace career_universityadmin = 1 if strpos(`v', "dean")
replace career_financeanalyst = 1 if strpos(`v', "financial analyst")
replace career_attorneadvisor = 1 if strpos(`v', "attorney advisor")
replace career_staffattorney = 1 if strpos(`v', "staff counsel")
replace career_bailiff = 1 if strpos(`v', "bailiff")
replace career_researcher = 1 if strpos(`v', "research/administrative aide")
replace career_adminassistant = 1 if strpos(`v', "research/administrative aide")
replace career_chemist = 1 if strpos(`v', "chemist")
replace career_regionalattorney = 1 if strpos(`v', "regional counsel")
replace career_patentexaminer = 1 if strpos(`v', "patent examiner")
replace career_assistcommonwealthattn = 1 if strpos(`v', "assistant commonweath attorney")
replace career_titleexaminer = 1 if strpos(`v', "title examiner")
replace career_professor = 1 if strpos(`v', "professor")
replace career_professor = 1 if strpos(`v', "dean/professor")
replace career_universityadmin = 1 if strpos(`v', "dean/professor")
replace career_universityadmin = 1 if strpos(`v', "dean")
replace career_teacher = 1 if strpos(`v', "instructor")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "alabama ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "alaska ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "arizona ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "arkansas ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "california ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "colorado ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "connecticut ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "delaware ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "florida ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "georgia ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "hawaii ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "idaho ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "illinois ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "iowa ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "kansas ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "kentucky ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "louisiana ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "maine ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "court of appeals") & strpos(`v', "maryland ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "massachusetts ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "michigan ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "minnesota ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "mississippi ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "missouri ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "montana  ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "nevada ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "new hampshire ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "new jersey ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "new mexico ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "court of appeals") & strpos(`v', "new york ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "north carolina ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "north dakota ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "ohio ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "court of criminal appeals") & strpos(`v', "oklahoma ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "oklahoma ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "oregon ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "pennsylvania ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "south carolina ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "south dakota ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "tennessee ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "court of criminal appeals") & strpos(`v', "texas ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "texas ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "utah ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "vermont ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "virginia ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "washington ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "west virginia ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "wisconsin ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "wyoming")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "nebraska")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "rhode island ")
replace career_statehighcourt = 1 if strpos(`v', "judge") & strpos(`v', "supreme court") & strpos(`v', "indiana")
replace career_prosecutor = 1 if strpos(`v', "prosecution")
replace career_judicialconference = 1 if strpos(`v', "member, judicial conference of the united states, ")
replace career_director = 1 if strpos(`v', "director")
replace career_directorof = `v' if strpos(`v', "director")
replace career_stem = 1 if strpos(`v', "aeronautics")
replace career_stem = 1 if strpos(`v', "intellectual property")
replace career_patent = 1 if strpos(`v', "intellectual property")
replace career_fedagency = 1 if strpos(`v', "u.s. customs services")
replace career_fedagency = 1 if strpos(`v', "department of justice")
replace career_fedagency = 1 if strpos(`v', "treasury department")
replace career_fedexec = 1 if strpos(`v', "president william j. clinton")
replace career_fedexec = 1 if strpos(`v', "president george w. bush")
replace career_fedexec = 1 if strpos(`v', "president barak obama")
replace career_fedexec = 1 if strpos(`v', "white house counsel")
replace career_fedexec = 1 if strpos(`v', "white house")
replace career_fedjudicialcenter = 1 if strpos(`v', "federal judicial center")
replace career_setencecommiss = 1 if strpos(`v', "u.s. sentencing commission,")
replace career_stateexec = 1 if strpos(`v', "gov.") & careerloc_state!=""
replace career_fedlegislative = 1 if strpos(`v', "u.s. senate committee")
replace career_fedlegislative = 1 if strpos(`v', "u.s. house committee")
replace career_fedexec = 1 if strpos(`v', "president-elect ronald reagan")
replace career_fedexec = 1 if strpos(`v', "president ronald reagan")
replace career_fedexec = 1 if strpos(`v', "president-elect george w. bush")
replace career_fedexec = 1 if strpos(`v', "president-elect barak obama")
replace career_fedexec = 1 if strpos(`v', "president-elect william j. clinton")
replace career_fedjudicial = 1 if strpos(`v', "u.s. judicial panel on multidistrict litigation,")
replace career_fedjudicial = 1 if strpos(`v', "federal judicial center")
replace career_fedjudicial = 1 if strpos(`v', "u.s. sentencing commission,")
replace career_litigation = 1 if strpos(`v', "litigation")
replace career_specialcounsel = 1 if strpos(`v', "special litigation counsel")
replace career_specialcounsel = 1 if strpos(`v', "special counsel")
replace career_adminjudge = 1 if strpos(`v', "administrative judge")
replace career_adminjudge = 1 if strpos(`v', "administrative law judge")
replace career_chiefjudge = 1 if strpos(`v', "chief judge")
replace career_seniorjudge = 1 if strpos(`v', "senior judge")
replace career_litigation = 1 if strpos(`v', "senior trial counsel")
replace career_seniorattorney = 1 if strpos(`v', "senior trial counsel")
replace career_criminal = 1 if strpos(`v', "major crimes")
replace career_fedagency = 1 if strpos(`v', "central intelligence agency")
replace career_cia = 1 if strpos(`v', "central intelligence agency")
replace career_securityintell = 1 if strpos(`v', "central intelligence agency")
replace career_fedagency = 1 if strpos(`v', "federal bureau of investigation")
replace career_fedagency = 1 if strpos(`v', "federal communications commission")
replace career_criminal = 1 if strpos(`v', "crime")
replace career_chiefcounsel = 1 if strpos(`v', "chief counsel")
replace career_fedjudicial = 1 if strpos(`v', "judicial conference of the united states")
replace career_fedagency = 1 if strpos(`v', "consumer product safety commission")

}

*Big ones 
foreach v of varlist careerpath* { 
replace mcareer_judge = 1 if strpos(`v', "judge") | strpos(`v', "justice") ///
	| strpos(`v', "magistrate") | strpos(`v',"chancellor") 

replace mcareer_military = 1 if career_natguard==1 | career_jag==1 ///
	| career_navy==1 | career_army==1 | career_airforce==1 ///
	| career_marines==1
	
replace mcareer_lawclerk = 1 if strpos(`v',"law clerk") ///
	| strpos(`v',"court clerk") | strpos(`v',"legal clerk")
	
*replace mcareer_fedexec = 0 
*replace mcareer_fedlegislative = 0
*replace mcareer_fedjudicial = 0 
*replace mcareer_fedagency = 0 
*replace mcareer_fedgov = 0 
*replace mcareer_stategov = 0 
*replace mcareer_stateexec = 0 
*replace mcareer_statelegislative = 0
*replace mcareer_statejudicial = 0 
} 

*Removal
foreach v of varlist careerpath* { 
replace `v' = "" if strpos(`v', "director") & career_director==1 & career_directorof!=""
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "new york") & career_statetrialcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_cityjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_countyjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_districtjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_appealsjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_appealsjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_appealsjudge == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_commonpleas == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court") & career_municipaljudge == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "alabama") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "alaska") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "arizona") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "arkansas") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "california") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "colorado") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "connecticut") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "delaware") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "florida") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "georgia") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "hawaii") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "idaho") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "illinois") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "iowa") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "kansas") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "kentucky") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "louisiana") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "maine") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "maryland") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "massachusetts") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "michigan") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "minnesota") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "mississippi") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "missouri") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "montana") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "nevada") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "new hampshire") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "new jersey") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "new mexico") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "new york") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "north carolina") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "north dakota") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "ohio") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "oklahoma") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "oklahoma") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "oregon") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "pennsylvania") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "south carolina") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "south dakota") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "tennessee") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "texas") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "texas") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "utah") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "vermont") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "virginia") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "washington") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "west virginia") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "wisconsin") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "wyoming") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "nebraska") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "rhode island") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "justice") &  strpos(`v', "indiana") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "alabama") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "alaska") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "arizona") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "arkansas") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "california") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "colorado") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "connecticut") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "delaware") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "florida") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "georgia") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "hawaii") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "idaho") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "illinois") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "iowa") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "kansas") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "kentucky") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "louisiana") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "maine") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "maryland") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "massachusetts") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "michigan") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "minnesota") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "mississippi") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "missouri") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "montana") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "nevada") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "new hampshire") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "new jersey") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "new mexico") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "new york") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "north carolina") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "north dakota") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "ohio") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "oklahoma") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "oklahoma") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "oregon") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "pennsylvania") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "south carolina") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "south dakota") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "tennessee") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "texas") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "texas") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "utah") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "vermont") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "virginia") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "washington") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "west virginia") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "wisconsin") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "wyoming") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "nebraska") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "rhode island") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") &  strpos(`v', "indiana") & career_clerk_statehighcourt == 1 
replace `v' = "" if strpos(`v', "clerk") & career_lawclerk_feddist == 1  & career_lawclerk_feddist == 1 
replace `v' = "" if strpos(`v', "clerk") & career_lawclerk_fedappeals == 1  & career_lawclerk_fedappeals == 1 
replace `v' = "" if strpos(`v', "clerk") & career_lawclerk_lowstatecourt == 1  & career_lawclerk_lowstatecourt == 1 
replace `v' = "" if strpos(`v', "clerk") & career_lawclerk_scotus == 1  & career_lawclerk_scotus == 1 
replace `v' = "" if strpos(`v', "clerk") & career_lawclerk_fedappeals == 1  & career_lawclerk_fedappeals == 1 
replace `v' = "" if strpos(`v', "member") & career_statehouse == 1  & career_statehouse == 1 
replace `v' = "" if strpos(`v', "member") & career_statehouse == 1  & career_statehouse == 1 
replace `v' = "" if strpos(`v', "member") & career_statesenate == 1  & career_statesenate == 1 
replace `v' = "" if strpos(`v', "judge") & career_bankrupcyjudge == 1  & career_bankrupcyjudge == 1 
replace `v' = "" if strpos(`v', "probate") & career_probatejudge == 1  & career_probatejudge == 1 
replace `v' = "" if strpos(`v', "domestic relations") & career_familycourt == 1  & career_familycourt == 1 
replace `v' = "" if strpos(`v', "juvenile") & career_juviecourt == 1  & career_juviecourt == 1 
replace `v' = "" if strpos(`v', "children") & career_juviecourt == 1  & career_juviecourt == 1 
replace `v' = "" if strpos(`v', "divorce") & career_familycourt == 1  & career_familycourt == 1 
replace `v' = "" if strpos(`v', "youth") & career_juviecourt == 1  & career_juviecourt == 1 
replace `v' = "" if strpos(`v', "family") & career_familycourt == 1  & career_familycourt == 1 
replace `v' = "" if strpos(`v', "district court of appeal") & career_stateappealsjudge == 1  & career_stateappealsjudge == 1 
replace `v' = "" if strpos(`v', "president") & career_universityadmin == 1  & career_universityadmin == 1 
replace `v' = "" if strpos(`v', "juvenile and domestic relations") & career_juviecourt == 1  & career_juviecourt == 1 
replace `v' = "" if strpos(`v', "juvenile and domestic relations") & career_familycourt == 1  & career_familycourt == 1 
replace `v' = "" if strpos(`v', "court of appeals") & career_appealsjudge == 1  & career_appealsjudge == 1 
replace `v' = "" if strpos(`v', "private practice") & career_privatepractice == 1
replace `v' = "" if strpos(`v', "army") & career_army == 1
replace `v' = "" if strpos(`v', "teacher") & career_teacher == 1
replace `v' = "" if strpos(`v', "legal aid") & career_legalaid == 1
replace `v' = "" if strpos(`v', "assistant u.s. attorney") & career_assistusattorney == 1
replace `v' = "" if strpos(`v', "u.s. attorney") & career_usattorney == 1
replace `v' = "" if strpos(`v', "legal researcher") & career_researcher == 1
replace `v' = "" if strpos(`v', "research assistant") & career_researcher == 1
replace `v' = "" if strpos(`v', "marines") & career_marines == 1
replace `v' = "" if strpos(`v', "public defender") & career_publicdefender == 1
replace `v' = "" if strpos(`v', "staff attorney") & career_staffattorney == 1
replace `v' = "" if strpos(`v', "administrative assistant") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "legislative assistant") & career_legattorney == 1
replace `v' = "" if strpos(`v', "air force") & career_airforce == 1
replace `v' = "" if strpos(`v', "legal services") & career_legalservices == 1
replace `v' = "" if strpos(`v', "police officer") & career_police == 1
replace `v' = "" if strpos(`v', "assistant circuit attorney") & career_circuitattorneyassistant == 1
replace `v' = "" if strpos(`v', "criminal") & career_criminallaw == 1
replace `v' = "" if strpos(`v', "trial attorney") & career_trialattorney == 1
replace `v' = "" if strpos(`v', "principal") & career_schoolprincipal == 1
replace `v' = "" if strpos(`v', "personal secretary") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "marine") & career_marines == 1
replace `v' = "" if strpos(`v', "navy") & career_navy == 1
replace `v' = "" if strpos(`v', "national guard") & career_natguard == 1
replace `v' = "" if strpos(`v', "assistant distrct's attorney") & career_assistdistrictattorney == 1
replace `v' = "" if strpos(`v', "private secretary") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "television news producer") & career_entertainment == 1
replace `v' = "" if strpos(`v', "assistant distrct attorney") & career_assistdistrictattorney == 1
replace `v' = "" if strpos(`v', "professor") & career_professor == 1
replace `v' = "" if strpos(`v', "faculty") & career_professor == 1
replace `v' = "" if strpos(`v', "instructor") & career_teacher == 1
replace `v' = "" if strpos(`v', "merchant") & career_merchant == 1
replace `v' = "" if strpos(`v', "jag") & career_jag == 1
replace `v' = "" if strpos(`v', "assistant state attorney") & career_assiststateattorney == 1
replace `v' = "" if strpos(`v', "assistant prosecutor") & career_assistprosecutor == 1
replace `v' = "" if strpos(`v', "assistant attorney general") & career_assistattorneygeneral == 1
replace `v' = "" if strpos(`v', "state attorney") & career_stateattorney == 1
replace `v' = "" if strpos(`v', "prosecutor") & career_prosecutor == 1
replace `v' = "" if strpos(`v', "attorney general") & career_attorneygeneral == 1
replace `v' = "" if strpos(`v', "state's attorney") & career_stateattorney == 1
replace `v' = "" if strpos(`v', "assistant state's attorney") & career_assiststateattorney == 1
replace `v' = "" if strpos(`v', "district attorney") & career_districtattorney == 1
replace `v' = "" if strpos(`v', "district's attorney") & career_districtattorney == 1
replace `v' = "" if strpos(`v', "assistant corporation counsel") & career_assistcorpcounsel == 1
replace `v' = "" if strpos(`v', "assistant county's attorney") & career_assistcountyattorney == 1
replace `v' = "" if strpos(`v', "assistant county attorney") & career_assistcountyattorney == 1
replace `v' = "" if strpos(`v', "county's attorney") & career_countyattorney == 1
replace `v' = "" if strpos(`v', "county attorney") & career_countyattorney == 1
replace `v' = "" if strpos(`v', "corporation counsel") & career_corpcounsel == 1
replace `v' = "" if strpos(`v', "administrative hearing officer") & career_adminhearingofficer == 1
replace `v' = "" if strpos(`v', "state's attorney's") & career_stateattorney == 1
replace `v' = "" if strpos(`v', "architect") & career_architect == 1
replace `v' = "" if strpos(`v', "deputy legislative counsel") & career_deputylegcounsel == 1
replace `v' = "" if strpos(`v', "legislative counsel") & career_legislativecounsel == 1
replace `v' = "" if strpos(`v', "state representative") & career_statehouse == 1
replace `v' = "" if strpos(`v', "state senator") & career_statesenate == 1
replace `v' = "" if strpos(`v', "special agent, federal bureau of investigation") & career_fbi_agent == 1
replace `v' = "" if strpos(`v', "magistrate") & career_magristrate == 1
replace `v' = "" if strpos(`v', "u.s. customs services") & career_customsagent == 1
replace `v' = "" if strpos(`v', "city attorney") & career_cityattorney == 1
replace `v' = "" if strpos(`v', "city's attorney") & career_cityattorney == 1
replace `v' = "" if strpos(`v', "democratic floor leader") & career_politics == 1
replace `v' = "" if strpos(`v', "lecturer") & career_teacher == 1
replace `v' = "" if strpos(`v', "teaching fellow") & career_teacher == 1
replace `v' = "" if strpos(`v', "house of commons") & career_statehouse == 1
replace `v' = "" if strpos(`v', "common council") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "assistant solicitor") & career_deputysolicitor == 1
replace `v' = "" if strpos(`v', "assistant special attorney") & career_assistspecialattorney == 1
replace `v' = "" if strpos(`v', "secretary") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "deputy campaign manager") & career_politics == 1
replace `v' = "" if strpos(`v', "assistant campaign manager") & career_politics == 1
replace `v' = "" if strpos(`v', "campaign field coordinator") & career_politics == 1
replace `v' = "" if strpos(`v', "state assemblyman") & career_statehouse == 1
replace `v' = "" if strpos(`v', "assistant commonwealth attorney") & career_assistcommonwealthattn == 1
replace `v' = "" if strpos(`v', "commonwealth attorney") & career_commonwealthattorney == 1
replace `v' = "" if strpos(`v', "superior court of california") & career_trialjudge == 1
replace `v' = "" if strpos(`v', "city council") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "u.s. senator") & career_ussenator == 1
replace `v' = "" if strpos(`v', "u.s. representative") & career_ushouse == 1
replace `v' = "" if strpos(`v', "deputy u.s. marshall") & career_deputyusmarshall == 1
replace `v' = "" if strpos(`v', "u.s. marshall") & career_usmarshall == 1
replace `v' = "" if strpos(`v', "newspaper editor") & career_newspapereditor == 1
replace `v' = "" if strpos(`v', "deputy solicitor") & career_deputysolicitor == 1
replace `v' = "" if strpos(`v', "deputy special attorney") & career_assistspecialattorney == 1
replace `v' = "" if strpos(`v', "solicitor") & career_solicitor == 1
replace `v' = "" if strpos(`v', "pastor") & career_religion == 1
replace `v' = "" if strpos(`v', "campaign manager") & career_politics == 1
replace `v' = "" if strpos(`v', "probation officer") & career_probationofficer == 1
replace `v' = "" if strpos(`v', "secretary of state") & career_secretaryofstate == 1
replace `v' = "" if strpos(`v', "warden") & career_warden == 1
replace `v' = "" if strpos(`v', "regional attorney") & career_regionalattorney == 1
replace `v' = "" if strpos(`v', "teaching fellow") & career_teacher == 1
replace `v' = "" if strpos(`v', "lecturer") & career_teacher == 1
replace `v' = "" if strpos(`v', "assistant commonwealth attorney") & career_assistcommonwealthattn == 1
replace `v' = "" if strpos(`v', "assistant commissoner") & career_deputycommissoner == 1
replace `v' = "" if strpos(`v', "deputy commissoner") & career_deputycommissoner == 1
replace `v' = "" if strpos(`v', "commissoner") & career_commissoner == 1
replace `v' = "" if strpos(`v', "executive assistant") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "youth counselor") & career_youthwork == 1
replace `v' = "" if strpos(`v', "youth director") & career_youthwork == 1
replace `v' = "" if strpos(`v', "commons house of assembly") & career_statehouse == 1
replace `v' = "" if strpos(`v', "representative") & career_statehouse == 1
replace `v' = "" if strpos(`v', "naval reserve") & career_navalreserve == 1
replace `v' = "" if strpos(`v', "navalreserve") & career_navalreserve == 1
replace `v' = "" if strpos(`v', "underwrighter") & career_insurance == 1
replace `v' = "" if strpos(`v', "city treasuer") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "justiceofthepeace") & career_peacejustice == 1
replace `v' = "" if strpos(`v', "probate court") & career_probatejudge == 1
replace `v' = "" if strpos(`v', "childadvocate") & career_childadvocat == 1
replace `v' = "" if strpos(`v', "mayor") & career_mayor == 1
replace `v' = "" if strpos(`v', "editor") & career_editor == 1
replace `v' = "" if strpos(`v', "alderman") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "coast guard") & career_coastguard == 1
replace `v' = "" if strpos(`v', "national american association of colored people") & career_naacp == 1
replace `v' = "" if strpos(`v', "naacp") & career_naacp == 1
replace `v' = "" if strpos(`v', "inspectorgeneral") & career_inspectorgeneral == 1
replace `v' = "" if strpos(`v', "citypolitics") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "librarian") & career_librarian == 1
replace `v' = "" if strpos(`v', "legal assistant") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "postmaster") & career_postmaster == 1
replace `v' = "" if strpos(`v', "engineer") & career_engineer == 1
replace `v' = "" if strpos(`v', "research associate") & career_researcher == 1
replace `v' = "" if strpos(`v', "speech writer") & career_speechwriter == 1
replace `v' = "" if strpos(`v', "town councilman") & career_citypolitics == 1
replace `v' = "" if strpos(`v', "fellow in residence") & career_teacher == 1
replace `v' = "" if strpos(`v', "dean") & career_universityadmin == 1
replace `v' = "" if strpos(`v', "financial analyst") & career_financeanalyst == 1
replace `v' = "" if strpos(`v', "attorney advisor") & career_attorneadvisor == 1
replace `v' = "" if strpos(`v', "staff counsel") & career_staffattorney == 1
replace `v' = "" if strpos(`v', "bailiff") & career_bailiff == 1
replace `v' = "" if strpos(`v', "research/administrative aide") & career_researcher == 1
replace `v' = "" if strpos(`v', "research/administrative aide") & career_adminassistant == 1
replace `v' = "" if strpos(`v', "chemist") & career_chemist == 1
replace `v' = "" if strpos(`v', "regional counsel") & career_regionalattorney == 1
replace `v' = "" if strpos(`v', "patent examiner") & career_patentexaminer == 1
replace `v' = "" if strpos(`v', "assistant commonweath attorney") & career_assistcommonwealthattn == 1
replace `v' = "" if strpos(`v', "title examiner") & career_titleexaminer == 1
replace `v' = "" if strpos(`v', "alaska") & career_state == 1
replace `v' = "" if strpos(`v', "arizona") & career_state == 1
replace `v' = "" if strpos(`v', "arkansas") & career_state == 1
replace `v' = "" if strpos(`v', "california") & career_state == 1
replace `v' = "" if strpos(`v', "colorado") & career_state == 1
replace `v' = "" if strpos(`v', "connecticut") & career_state == 1
replace `v' = "" if strpos(`v', "delaware") & career_state == 1
replace `v' = "" if strpos(`v', "florida") & career_state == 1
replace `v' = "" if strpos(`v', "georgia") & career_state == 1
replace `v' = "" if strpos(`v', "hawaii") & career_state == 1
replace `v' = "" if strpos(`v', "idaho") & career_state == 1
replace `v' = "" if strpos(`v', "illinois") & career_state == 1
replace `v' = "" if strpos(`v', "iowa") & career_state == 1
replace `v' = "" if strpos(`v', "kansas") & career_state == 1
replace `v' = "" if strpos(`v', "kentucky") & career_state == 1
replace `v' = "" if strpos(`v', "louisiana") & career_state == 1
replace `v' = "" if strpos(`v', "maine") & career_state == 1
replace `v' = "" if strpos(`v', "maryland") & career_state == 1
replace `v' = "" if strpos(`v', "massachusetts") & career_state == 1
replace `v' = "" if strpos(`v', "michigan") & career_state == 1
replace `v' = "" if strpos(`v', "minnesota") & career_state == 1
replace `v' = "" if strpos(`v', "mississippi") & career_state == 1
replace `v' = "" if strpos(`v', "missouri") & career_state == 1
replace `v' = "" if strpos(`v', "montana") & career_state == 1
replace `v' = "" if strpos(`v', "nevada") & career_state == 1
replace `v' = "" if strpos(`v', "new hampshire") & career_state == 1
replace `v' = "" if strpos(`v', "new jersey") & career_state == 1
replace `v' = "" if strpos(`v', "new mexico") & career_state == 1
replace `v' = "" if strpos(`v', "new york") & career_state == 1
replace `v' = "" if strpos(`v', "north carolina") & career_state == 1
replace `v' = "" if strpos(`v', "north dakota") & career_state == 1
replace `v' = "" if strpos(`v', "ohio") & career_state == 1
replace `v' = "" if strpos(`v', "oklahoma") & career_state == 1
replace `v' = "" if strpos(`v', "oklahoma") & career_state == 1
replace `v' = "" if strpos(`v', "oregon") & career_state == 1
replace `v' = "" if strpos(`v', "pennsylvania") & career_state == 1
replace `v' = "" if strpos(`v', "south carolina") & career_state == 1
replace `v' = "" if strpos(`v', "south dakota") & career_state == 1
replace `v' = "" if strpos(`v', "tennessee") & career_state == 1
replace `v' = "" if strpos(`v', "texas") & career_state == 1
replace `v' = "" if strpos(`v', "texas") & career_state == 1
replace `v' = "" if strpos(`v', "utah") & career_state == 1
replace `v' = "" if strpos(`v', "vermont") & career_state == 1
replace `v' = "" if strpos(`v', "virginia") & career_state == 1
replace `v' = "" if strpos(`v', "washington") & career_state == 1
replace `v' = "" if strpos(`v', "west virginia") & career_state == 1
replace `v' = "" if strpos(`v', "wisconsin") & career_state == 1
replace `v' = "" if strpos(`v', "wyoming") & career_state == 1
replace `v' = "" if strpos(`v', "nebraska") & career_state == 1
replace `v' = "" if strpos(`v', "rhode island") & career_state == 1
replace `v' = "" if strpos(`v', "indiana") & career_state == 1
replace `v' = "" if strpos(`v', "professor") & career_professor == 1
replace `v' = "" if strpos(`v', "dean/professor") & career_professor == 1
replace `v' = "" if strpos(`v', "dean/professor") & career_universityadmin == 1
replace `v' = "" if strpos(`v', "dean") & career_universityadmin == 1
replace `v' = "" if strpos(`v', "instructor") & career_teacher == 1
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court of appeals") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court of appeals") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court of criminal appeals") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "court of criminal appeals") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "judge") &  strpos(`v', "supreme court") & career_statehighcourt == 1 
replace `v' = "" if strpos(`v', "prosecution") & career_prosecutor == 1
replace `v' = "" if strpos(`v', "member, judicial conference of the united states") & career_judicialconference == 1
replace `v' = "" if strpos(`v', "director") & career_director == 1
replace `v' = "" if strpos(`v', "arbitrator/mediator") & career_arbitrator == 1
replace `v' = "" if strpos(`v', "litigator") & career_litigator == 1
replace `v' = "" if strpos(`v', "chief justice") & career_chiefjustice == 1
replace `v' = "" if strpos(`v', "general counsel") & career_gencounsel == 1
replace `v' = "" if strpos(`v', "scholar") & career_professor == 1
replace `v' = "" if strpos(`v', "board member") & career_boardmember == 1
replace `v' = "" if strpos(`v', "arbitrator") & career_arbitrator == 1
replace `v' = "" if strpos(`v', "mediator") & career_arbitrator == 1
replace `v' = "" if strpos(`v', "arbitrator") & career_arbitrator == 1
replace `v' = "" if strpos(`v', "mediator") & career_arbitrator == 1
replace `v' = "" if strpos(`v', "senior counsel") & career_seniorattorney == 1
replace `v' = "" if strpos(`v', "senior attorney") & career_seniorattorney == 1
replace `v' = "" if strpos(`v', "chief legal counsel") & career_chieflegalcounsel == 1
replace `v' = "" if strpos(`v', "chief counsel") & career_chieflegalcounsel == 1
replace `v' = "" if strpos(`v', "attorney-in-charge") & career_chieflegalcounsel == 1
replace `v' = "" if strpos(`v', "consultant") & career_consultant == 1
replace `v' = "" if strpos(`v', "vice chair") & career_vicechair == 1
replace `v' = "" if strpos(`v', "chair") & career_chairman == 1
replace `v' = "" if strpos(`v', "special counsel") & career_specialcounsel == 1
replace `v' = "" if strpos(`v', "chair") & career_chairman == 1
replace `v' = "" if strpos(`v', "commissioner") & career_commissoner == 1
replace `v' = "" if strpos(`v', "assistant commissioner") & career_assistcommissoner == 1
replace `v' = "" if strpos(`v', "aeronautics") & career_stem == 1
replace `v' = "" if strpos(`v', "attorney") & career_attorney == 1
replace `v' = "" if strpos(`v', "aeronautics") & career_stem == 1
replace `v' = "" if strpos(`v', "intellectual property") & career_stem == 1
replace `v' = "" if strpos(`v', "intellectual property") & career_patent == 1
replace `v' = "" if strpos(`v', "u.s. customs service") & career_fedagency == 1
replace `v' = "" if strpos(`v', "department of justice") & career_fedagency == 1
replace `v' = "" if strpos(`v', "treasury department") & career_fedagency == 1
replace `v' = "" if strpos(`v', "president william j. clinton") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president george w. bush") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president barak obama") & career_fedexec == 1
replace `v' = "" if strpos(`v', "white house") & career_fedexec == 1
replace `v' = "" if strpos(`v', "white house") & career_fedexec == 1
replace `v' = "" if strpos(`v', "federal judicial center") & career_fedjudicialcenter == 1
replace `v' = "" if strpos(`v', "u.s. sentencing commission,") & career_setencecommiss == 1
replace `v' = "" if strpos(`v', "gov.") & career_stateexec == 1
replace `v' = "" if strpos(`v', "u.s. senate committee") & career_fedlegislative == 1
replace `v' = "" if strpos(`v', "u.s. house committee") & career_fedlegislative == 1
replace `v' = "" if strpos(`v', "president-elect ronald reagan") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president ronald reagan") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president-elect george w. bush") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president-elect barak obama") & career_fedexec == 1
replace `v' = "" if strpos(`v', "president-elect william j. clinton") & career_fedexec == 1
replace `v' = "" if strpos(`v', "u.s. judicial panel on multidistrict litigation,") & career_fedjudicial == 1
replace `v' = "" if strpos(`v', "federal judicial center") & career_fedjudicial == 1
replace `v' = "" if strpos(`v', "u.s. sentencing commission,") & career_fedjudicial == 1
replace `v' = "" if strpos(`v', "litigation") & career_litigation == 1
replace `v' = "" if strpos(`v', "special litigation counsel") & career_specialcounsel == 1
replace `v' = "" if strpos(`v', "special counsel") & career_specialcounsel == 1
replace `v' = "" if strpos(`v', "administrative judge") & career_adminjudge == 1
replace `v' = "" if strpos(`v', "administrative law judge") & career_adminjudge == 1
replace `v' = "" if strpos(`v', "chief judge") & career_chiefjudge == 1
replace `v' = "" if strpos(`v', "senior judge") & career_seniorjudge == 1
replace `v' = "" if strpos(`v', "senior trial counsel") & career_litigation == 1
replace `v' = "" if strpos(`v', "senior trial counsel") & career_seniorattorney == 1
replace `v' = "" if strpos(`v', "major crimes") & career_criminal == 1
replace `v' = "" if strpos(`v', "central intelligence agency") & career_fedagency == 1
replace `v' = "" if strpos(`v', "central intelligence agency") & career_cia == 1
replace `v' = "" if strpos(`v', "central intelligence agency") & career_securityintell == 1
replace `v' = "" if strpos(`v', "federal bureau of investigation") & career_fedagency == 1
replace `v' = "" if strpos(`v', "federal communications commission") & career_fedagency == 1
replace `v' = "" if strpos(`v', "crime") & career_criminal == 1
replace `v' = "" if strpos(`v', "chief counsel") & career_chiefcounsel == 1
replace `v' = "" if strpos(`v', "judicial conference of the united states") & career_fedjudicial == 1
replace `v' = "" if strpos(`v', "circuit judge") & career_judge == 1
replace `v' = "" if strpos(`v', "consumer product safety commission") & career_fedagency == 1

}

*Those I still have to code 
count if careerpath1 !="" //190 --> 2,071 --> 57 --> 55 --> 43 --> 42 
count if careerpath2 !="" //229 --> 1,992 --> 96 --> 89 --> 81 --> 69 --> 69
count if careerpath3 !="" //326 --> 1,726 --> 156 --> 111 --> 96 --> 93 --> 93
count if careerpath4 !="" //372 --> 1,407 --> 225 --> 187 --> 153 --> 154 --> 153
count if careerpath5 !="" //365 --> 1,072 --> 224 --> 167 --> 149 --> 147 --> 146
count if careerpath6 !="" //270 --> 779 --> 157 --> 113 --> 95 --> 92 --> 92
count if careerpath7 !="" //214 --> 521 --> 131 --> 89 --> 72 --> 67 --> 67
count if careerpath8 !="" //140 --> 330 --> 91 --> 73 --> 57 --> 51 --> 51
count if careerpath9 !="" //106 --> 215 --> 75 --> 52 --> 38 --> 43 --> 43
count if careerpath10 !="" //69 --> 119 --> 49 --> 38 --> 31  --> 29 --> 29
count if careerpath11 !="" //28 --> 67 --> 20 --> 14 --> 12 --> 9 --> 9
count if careerpath12 !="" //18 --> 36 --> 11 --> 5 --> 5 --> 5 --> 5 
count if careerpath13 !="" //13 --> 26 --> 8 --> 7 --> 6 --> 7 --> 7
count if careerpath14 !="" //10 --> 14 --> 6 --> 4 --> 3 --> 3 --> 3
count if careerpath15 !="" //3 --> 9 --> 2 --> 2 --> 2 --> 2 --> 2
count if careerpath16 !="" //2 --> 6 --> 1 --> 0 --> 0 
count if careerpath17 !="" //3 --> 4 --> 3 --> 2 --> 2 --> 2  --> 2
count if careerpath18 !="" //2 --> 3 --> 1 --> 1 --> 1 --> 1  --> 1

edit careerpath6 if careerpath6!=""
