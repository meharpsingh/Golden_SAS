/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_ods_document_flat_label.md (fence 3) */

ODS DOCUMENT NAME = work.doc_empty (write);
ODS DOCUMENT CLOSE;
