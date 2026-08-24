/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_ods_document_flat_label.md (fence 22) */

ODS PDF ANCHOR = 'table1_x1';
PROC DOCUMENT name=doc_res1; replay; QUIT;
ODS PDF ANCHOR = 'table2_x1';
PROC DOCUMENT name=doc_res2; replay; QUIT;
ODS PDF ANCHOR = 'table3_x1';
PROC DOCUMENT name=doc_res3; replay; QUIT;
ODS PDF ANCHOR = 'table4_x1';
PROC DOCUMENT name=doc_res4; replay; QUIT;
ODS PDF CLOSE;
