/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-studio-custom-steps/Detect Data Drift/README.md (fence 1) */

* Sample data creation;
data work.hmeq_data_drift;
    length customerID captureDate 8.;
    format captureDate date9.;

    set sampsio.hmeq;

    customerID = _n_;

    * This only adds a new date value each 10 rows;
    captureDate = today() - ceil(_n_ / 10);
run;
