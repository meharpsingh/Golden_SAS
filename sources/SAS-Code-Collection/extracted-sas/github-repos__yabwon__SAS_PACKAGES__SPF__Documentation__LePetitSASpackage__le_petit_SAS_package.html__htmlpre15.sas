/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/LePetitSASpackage/le_petit_SAS_package.html (htmlpre 15) */

/*** HELP START ***//*


---

### Arguments: ############################


### Dependencies: #########################

the `rose.` format to work.;

### Example: ##############################

Ask for a sheep:
~~~~~~~~~~sas
data _null_;
  s=prince();
  put s=;
run;
~~~~~~~~~~

---

*//*** HELP END ***/
