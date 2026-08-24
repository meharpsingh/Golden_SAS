/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2021/papers/1151-2021-Amrhein/Introduction to Causal Analyses Using SAS.ipynb (ipynb 2) */

title "Adjustment sets for HEART data";
proc causalgraph;
   model "Cholesterol->CHD"
      height ==> weight mrw,
      weight ==> mrw,
      smoking ==> weight diastolic systolic chd,
      age ==> smoking diastolic systolic,
      mrw sex ==> diastolic systolic,
      diastolic systolic ==> bp_status,
      nutrition activity ==> cholesterol weight,
      cholesterol ==> bp_status chd,
      bp_status genetics ==> chd;
   unmeasured nutrition activity genetics;
   identify cholesterol ==> chd;
run;
