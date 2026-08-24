/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__sasjs.io/docs/buildviya.md (fence 2) */

filename ft15f001 temp;
  parmcards4;
    * do some sas. All inputs are ALREADY tables in WORK;
    data example1 example2;
      set sashelp.class;
    run;
    * send data back;
    %webout(OPEN);
    %webout(ARR,example1) * Array format, fast, good for large tables;
    %webout(OBJ,example2) * Object format, easier to work with in JS;
    %webout(CLOSE);
  ;;;;
  %mv_createwebservice(path=/Public/myapp/common/appInit,name=testJob,code=ft15f001);
