/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/communities/Running  Data Step from Python.ipynb (ipynb 0) */

out = conn.datastep.runcode('''
   data bmi(caslib='casuser');
      set class(caslib='casuser');
      BMI = weight / (height**2) * 703;
   run;
''')
out
