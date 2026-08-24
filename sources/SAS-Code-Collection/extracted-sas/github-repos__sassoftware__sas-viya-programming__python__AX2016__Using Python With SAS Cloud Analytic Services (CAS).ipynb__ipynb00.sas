/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/AX2016/Using Python With SAS Cloud Analytic Services (CAS).ipynb (ipynb 0) */

conn.runcode(code='''
    data cars_temp;
        set cars;
        sqrt_MSRP = sqrt(MSRP);
        MPG_avg = (MPG_city + MPG_highway) / 2;
    run;
