**********************
* OVERVIEW
*   This script generates tables and figures for the paper:
*       "Being on the Frontline? Immigrant Workers in Europe and the COVID-19 Pandemic" (by Francesco Fasani and Jacopo Mazza)
*   All tables are outputted to /out/tab
*   All figures are outputted to /out/graph
*
* SOFTWARE REQUIREMENTS
*   Analyses run on Windows using Stata version 16.1
*
* TO PERFORM A CLEAN RUN, DELETE THE FOLLOWING TWO FOLDERS:
*   /processed
*   /results
**********************

* User must uncomment the following line ("global ...") and set the filepath equal to the folder containing this run.do file 
* global MyProject "C:/Users/jdoe/MyProject"
local ProjectDir "$MyProject"


* Confirm that the globals for the project root directory have been defined
cap assert !mi("`ProjectDir'")
if _rc {
	noi di as error "Error: need to define the global in run.do"
	error 9
}

* Initialize log
clear
set more off
cap mkdir "`ProjectDir'/scripts/logs"
cap log close
local datetime : di %tcCCYY.NN.DD!-HH.MM.SS `=clock("$S_DATE $S_TIME", "DMYhms")'
local logfile "`ProjectDir'/scripts/logs/`datetime'.log.txt"
log using "`logfile'", text

* Configure Stata's library environment and record system parameters
run "`ProjectDir'/scripts/programs/_config.do"

* Stata and R version control
version 16.1

* Create directories for output files
cap mkdir "`ProjectDir'/out"
cap mkdir "`ProjectDir'/out/tab"
cap mkdir "`ProjectDir'/out/graph"
cap mkdir "`ProjectDir'/log"
cap mkdir "`ProjectDir'/do"

* Set project wide globals
global out		"`ProjectDir'/out"
global tab		"`ProjectDir'/out/tab"
global graph	"`ProjectDir'/out/graph"
global log		"`ProjectDir'/log"
global do 		"`ProjectDir'/do"

* Run project analysis
do "$do/build/1-data_creation.do"
do "$do/build/2-dataset-for-analysis.do"
do "$do/share/1-eurostat_data_import.do"
do "$do/share/2a-descr_2020.do"
do "$do/share/2-descr_2019.do"
do "$do/share/3-risk_measures.do"
do "$do/share/4-multi_years_2018-2020.do"
do "$do/share/5-disempl_by_year.do"
do "$do/share/6-alt_outcomes.do"
do "$do/share/7-geo_subgroups.do"
do "$do/share/8-alt_outcomes_fig.do"
do "$do/share/9-robustness.do"
do "$do/share/10-region.do"
do "$do/share/11-table_descriptives.do"
do "$do/share/12-gelbach.do"
do "$do/share/13-balance_test.do"
do "$do/share/14-net_migr_rates.do"
do "$do/share/15-unemp_rates.do"
do "$do/share/16-stock_migrants.do"
do "$do/share/17-google_trends.do"

* End log
di "End date and time: $S_DATE $S_TIME"
log close

** EOF