/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-education/docs/sas1/03_Addressing_the_Use_Case_with_the_SAS_Language/02_Data_Engineering/02_Transforming_and_Enriching_Data.html (htmlpre 1) */

proc format ;
   value $ demHomeOwner "U"="Unknown"
                        "H"="HomeOwner" ;
run ;
