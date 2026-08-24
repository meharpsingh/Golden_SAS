/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let intable=sashelp.class;
%let outtable=sashelp.class;

/* Extracted from github-repos/sassoftware__sas-studio-custom-steps/LLM - Custom Step Generator with Azure OpenAI/extras/cs2_system_message_new.md (fence 1) */

proc rank data=&inTable out=&outTable;
   var &rankBy_1_name;
   %if %createNewVariables = 1 %then do;
