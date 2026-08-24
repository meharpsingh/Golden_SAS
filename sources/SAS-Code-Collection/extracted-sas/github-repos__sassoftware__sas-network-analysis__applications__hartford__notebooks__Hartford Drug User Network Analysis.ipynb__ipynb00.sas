/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/hartford/notebooks/Hartford Drug User Network Analysis.ipynb (ipynb 0) */

conn.datastep.runcode(code=f"""data nodeSubsetInA ;
                                set nodesCentrA;
                                where centr_degree >= 5.0;
                                keep node centr_degree_out;
                                run;
                            """
                      )

conn.datastep.runcode(code=f"""data nodeSubsetInA (replace=yes);
                                set nodeSubsetInA;
                                retain reach;
                                where centr_degree_out >= 4.0;
                                reach = _N_;
                                keep node reach;
                                run;
                            """
                      )
