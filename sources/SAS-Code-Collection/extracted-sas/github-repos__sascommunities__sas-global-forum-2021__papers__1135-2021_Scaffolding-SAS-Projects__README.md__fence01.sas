/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2021/papers/1135-2021_Scaffolding-SAS-Projects/README.md (fence 1) */

/**
  @file
  @brief one line description of the job
  You can write markdown here and it will be properly

      data code must be;
        indented = 4 * spaces;
      run;

  <h4> SAS Macros </h4>
  @li example.sas

  <h4> SAS Includes </h4>
  @li someprogram.sas MYREF

  <h4> Data Inputs </h4>;
  @li somelib.ds1
  @li somelib.ds2

  <h4> Data Outputs </h4>;
  @li tgtlib.bigmuvvads

**/
