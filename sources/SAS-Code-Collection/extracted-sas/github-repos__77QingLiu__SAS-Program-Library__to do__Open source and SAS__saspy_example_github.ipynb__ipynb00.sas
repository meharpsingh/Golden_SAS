/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/77QingLiu__SAS-Program-Library/to do/Open source and SAS/saspy_example_github.ipynb (ipynb 0) */

c = sas.submit("""
proc sgpanel data=work._csv;
    PANELBY left;
    hbar sales / response=last_evaluation    stat=median;
    hbar sales / response=satisfaction_level stat=median;
run;
""")
