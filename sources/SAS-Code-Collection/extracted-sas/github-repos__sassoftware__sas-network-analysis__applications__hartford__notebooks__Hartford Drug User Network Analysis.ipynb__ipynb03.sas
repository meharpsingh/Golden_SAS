/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/hartford/notebooks/Hartford Drug User Network Analysis.ipynb (ipynb 3) */

conn.datastep.runcode(code=f"""data nodesMerged_int;
                                merge nodesMerged nodesMerged_stripped;
                                by community;
                                keep node centr_degree_out community cmpMin cmpMax cmpCount cmpMean cmpSum;
                                run;
                            """
