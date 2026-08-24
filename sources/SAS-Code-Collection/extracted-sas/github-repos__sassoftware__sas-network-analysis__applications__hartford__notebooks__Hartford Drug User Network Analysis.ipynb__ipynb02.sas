/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/hartford/notebooks/Hartford Drug User Network Analysis.ipynb (ipynb 2) */

conn.datastep.runcode(code=f"""data nodesMerged_stripped (keep=community ColName cmpMin cmpMax cmpCount cmpMean cmpSum);
                                set nodesMerged_summary;
                                format _Column_ $CHAR15.;
                                rename _Column_=ColName _Min_=cmpMin _Max_=cmpMax _NObs_=cmpCount _Mean_=cmpMean _Sum_=cmpSum;
                                run;
                            """
