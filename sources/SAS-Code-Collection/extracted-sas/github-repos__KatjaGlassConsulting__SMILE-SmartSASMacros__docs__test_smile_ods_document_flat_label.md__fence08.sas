/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let root=sashelp.class;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_ods_document_flat_label.md (fence 8) */

ODS PDF FILE= "&root/results/ods_document_flat1.pdf" nocontents;
PROC DOCUMENT name=doc_results; replay; QUIT;
ODS PDF CLOSE;
