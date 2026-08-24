/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__sasjs.io/docs/documentation.md (fence 2) */

/**
   @file mv_webout.sas
   @brief Send data to/from the SAS Viya Job Execution Service;
   @details This macro should be added to the start of each Job Execution;
   Service, **immediately** followed by a call to:;
 
         %mv_webout(FETCH);
 
     WORK library.  You can then insert your code, and send data back using the;
     following syntax:
 
         data some datasets; * make some data ;
         retain some columns;
         run;
 
         %mv_webout(OPEN);
         %mv_webout(ARR,some)  * Array format, fast, suitable for large tables ;
         %mv_webout(OBJ,datasets) * Object format, easier to work with ;
         %mv_webout(CLOSE);
 
 
   @param action Either OPEN, ARR, OBJ or CLOSE
   @param ds The dataset to send back to the frontend
   @param _webout= fileref for returning the json
   @param fref= temp fref
   @param dslabel= value to use instead of the real name for sending to JSON
   @param fmt= change to N to strip formats from output;
 
   <h4> Dependencies </h4>
   @li mp_jsonout.sas
   @li mf_getuser.sas
 
   @version Viya 3.3
   @author Allan Bowe
 
 **/
