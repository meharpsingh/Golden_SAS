/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let root=sashelp.class;

/* Extracted from github-repos/sassoftware__sas-studio-custom-steps/EAC - Query SAS Viya REST API/EAC - Query SAS Viya REST API.step (step 1) */

/*----------------------------------------------------------------------------------------*
	   - root : root items returned by the request;
	   - links : root links returned by the request;
	   - items : collection items returned by the request + items self HREF and TYPE;
	   - items_links : collection items links returned by the request;
		
*------------------------------------------------------------------------------------------*/

%macro _get_viya_items ; 

   %if %sysfunc(libref(resp)) = 0 %then %do;
      libname resp clear ; 
   %end ; 
   data &root.; run;
   data &links.; run;
   data &items.; run;
   data &items_links.; run;

/*----------------------------------------------------------------------------------------*
   Send GET request to local VIYA API 
*----------------------------------------------------------------------------------------*/

   filename resp temp;

   %put NOTE: REQUEST = "%sysfunc(getoption(SERVICESBASEURL))&href.?limit=&_limit." ;
   %put NOTE: Accepted Content-Type = "&type" ;

   proc http;
      url = "%sysfunc(getoption(SERVICESBASEURL))&href.?limit=&_limit.";
      out=resp
      oauth_bearer = sas_services ;
      headers
	        'Accept'= "&type";
	  debug level=1 ; 
   run;

   %if &SYS_PROCHTTP_STATUS_CODE. ne 200 %then %do;
     %put ERROR: HTTP &SYS_PROCHTTP_STATUS_CODE. : &SYS_PROCHTTP_STATUS_PHRASE. ; 
   %end ;
   %else %do ; 

/*----------------------------------------------------------------------------------------*
   Extract data from response;
*----------------------------------------------------------------------------------------*/

      libname resp JSON ; 

     %if %sysfunc(exist(resp.root)) %then %do ;
        data &root ; set resp.root ; run ; 
     %end ; 

     %if %sysfunc(exist(resp.links)) %then %do ;
        data &links ; set resp.links ; run ;
     %end ; 

      %if %sysfunc(exist(resp.items)) %then %do ;
         proc sql noprint ; 
          create table &items as
            select
               i.*, l.href as GET_SELF_HREF, 
               l.type as GET_SELF_TYPE 
            from resp.items i inner join resp.items_links l;
	      on i.ordinal_items = l.ordinal_items
	      where l.method = 'GET' and l.rel = 'self' ; 
         run ; 
         quit ; 
     %end ; 

     %if %sysfunc(exist(resp.items_links)) %then %do ;
        data &items_links ; set resp.items_links ; run ; 
     %end ; 

     libname resp clear ; 

   %end ; 

   filename resp clear ; 

%mend _get_viya_items ;
