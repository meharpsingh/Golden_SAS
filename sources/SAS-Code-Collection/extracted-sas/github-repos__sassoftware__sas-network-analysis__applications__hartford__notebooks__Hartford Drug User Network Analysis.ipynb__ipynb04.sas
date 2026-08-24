/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/hartford/notebooks/Hartford Drug User Network Analysis.ipynb (ipynb 4) */

conn.datastep.runcode(code=f"""data nodeSubsetInB ;
                                set nodesMerged_score;
                                retain reach;
                                where _TR1_centr_degree_out_cdfmap >= 0.85;
                                reach = _N_;
                                keep node reach;
                                run;
                            """
