/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/r0f1__sashelp/README.md (fence 5) */

data testdata;
    y=1;
    do i=1 to 30;
        x=i+1;
        y=y+x;
        z=y+4;
        output;
    end;
run;
