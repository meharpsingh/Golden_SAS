/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__optimization-examples/python/location/location_optmodel_viya.ipynb (ipynb 1) */

# Using groupby we can solve each state individually. Note that we have to use the name of the variable in the data table.;
_ = sas.runOptmodel(optmodel_code, groupby="state")

# Create output data frames to plot the solution;
assignments = sas.CASTable("assignments")
sites = sas.CASTable("sites")
run;
