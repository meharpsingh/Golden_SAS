/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let root=sashelp.class;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_replace_in_text_files.md (fence 2) */

%MACRO create_text_file();
	DATA _NULL_;
		FILE "&root/results/temp/example.sas";
		PUT "* This is a file created by a program to demonstrate text replacements";
		PUT "* Created: {todayDate}";
		PUT '%LET path = <path>;';
	RUN;
%MEND;
