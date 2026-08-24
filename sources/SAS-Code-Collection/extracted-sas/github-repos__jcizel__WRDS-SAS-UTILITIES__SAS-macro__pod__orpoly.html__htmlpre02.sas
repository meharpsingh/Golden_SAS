/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/jcizel__WRDS-SAS-UTILITIES/SAS-macro/pod/orpoly.html (htmlpre 2) */

data testit;
     do a=1 to 5;
        do b=1, 5, 9, 13;
           do obs=1 to 2;
              y = a + a*a + b + 5*normal(124241);
              output;
              end;
           end;
        end;
  run;
