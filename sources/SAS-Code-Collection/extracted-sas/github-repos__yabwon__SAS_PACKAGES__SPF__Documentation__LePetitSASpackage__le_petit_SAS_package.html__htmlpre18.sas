/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/LePetitSASpackage/le_petit_SAS_package.html (htmlpre 18) */

/* 03_functions -> prince.sas */
filename f "&dir.\03_functions\prince.sas";
data _null_;
  file f;
  infile CARDS4;
  input;
  put _infile_;
CARDS4;
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

function prince() $ 42;
  file log;

  length i $ 256;
  r=rand('integer',1,4);
  i = put(r, rose.);
  put @1 "RANDOM NOTE:" i /;

  return("If you please--draw me a sheep!");
endfunc;
;;;;
run;
