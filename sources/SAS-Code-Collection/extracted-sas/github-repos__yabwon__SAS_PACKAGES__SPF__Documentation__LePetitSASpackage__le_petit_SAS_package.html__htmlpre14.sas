/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/LePetitSASpackage/le_petit_SAS_package.html (htmlpre 14) */

/*** HELP START ***//*


---

### Example: ##############################

Print quote number 2:
~~~~~~~~~~sas
data _null_;
  r=2;
  put r rose.;
run;
~~~~~~~~~~

---

*//*** HELP END ***/
