/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/hartford/notebooks/Hartford Drug User Network Analysis.ipynb (ipynb 1) */

# Set up the data for our next step;

conn.datastep.runcode(
   code="""data nodesMerged (rename=(community_3=community));
           set nodescentr;
           retain centr_degree 0 ColName "centr_degree_out";
           format ColName $CHAR15.;
           keep node centr_degree_out community_3 ColName;
           run;""");
