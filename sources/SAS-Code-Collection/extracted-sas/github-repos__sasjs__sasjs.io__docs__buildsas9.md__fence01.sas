/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__sasjs.io/docs/buildsas9.md (fence 1) */

* compile macros ;
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc;
* if the above fails, download and compile manually;

* parmcards lets us write to a text file from open code ;
filename ft15f001 temp;
parmcards4;
    * do some sas, any inputs are now already WORK tables;
    data example1 example2;
      set sashelp.class;
    run;
    * send data back;
    %webout(OPEN);
    %webout(ARR,example1) * Array format, fast, suitable for large tables ;
    %webout(OBJ,example2) * Object format, easier to work with ;
    %webout(CLOSE);
;;;;
%mm_createwebservice(path=/User Folders/&sysuserid/My Folder;
  , name=testJob
  , code=ft15f001
  , replace=yes)
