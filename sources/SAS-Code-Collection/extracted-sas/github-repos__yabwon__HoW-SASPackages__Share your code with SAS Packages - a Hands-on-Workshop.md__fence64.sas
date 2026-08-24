/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__HoW-SASPackages/Share your code with SAS Packages - a Hands-on-Workshop.md (fence 64) */

Proc FCMP outlib=work.myLocalFile.p;

/*##$##-code-block-start-##$## 02_functions(f) */
 function f(question $);
   return(42);
 endfunc;
/*##$##-code-block-end-##$## 02_functions(f) */

quit;
