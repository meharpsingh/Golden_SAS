/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let root=sashelp.class;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_replace_in_text_files.md (fence 3) */

%MACRO print_text_file();
	DATA _NULL_;
		INFILE "&root/results/temp/example.sas";
		INPUT;
		PUT _INFILE_;
	RUN;
%MEND;
