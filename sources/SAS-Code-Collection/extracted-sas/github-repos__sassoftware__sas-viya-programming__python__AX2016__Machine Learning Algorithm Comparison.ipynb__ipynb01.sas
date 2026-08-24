/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/AX2016/Machine Learning Algorithm Comparison.ipynb (ipynb 1) */

sess.dataStep.runcode(code = """
                 data hmeq_prepped;
                     set hmeq_prepped_pr;
                     if missing(DEBTINC) then DEBTINC_IND = 1;
                     else DEBTINC_IND = 0;
                run;    
                 """)
