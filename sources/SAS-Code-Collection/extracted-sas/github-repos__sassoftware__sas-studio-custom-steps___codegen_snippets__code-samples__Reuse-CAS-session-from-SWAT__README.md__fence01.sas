/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-studio-custom-steps/_codegen_snippets/code-samples/Reuse-CAS-session-from-SWAT/README.md (fence 1) */

/*-----------------------------------------------------------------------------------------*
   Macro to check whether CAS session exists, and if so retrieve CAS session UUID.;
*------------------------------------------------------------------------------------------*/
%global casSessionExists;
%global casSessionUUID;

%macro _casCheckSessionExists;
   %* Check whether CAS session exist, and if so retrieve CAS session UUID;
   %if %sysfunc(symexist(_SESSREF_)) %then %do;
      %let casSessionExists= %sysfunc(sessfound(&_SESSREF_));
      %if &casSessionExists=1 %then %do;
         proc cas;
            session.sessionId result = sessresults;
            call symputx("casSessionUUID", sessresults[1]);
            %put NOTE: CAS session with name &_SESSREF_ is currently active with UUID &casSessionUUID;
         quit;
      %end;
   %end;
%mend _casCheckSessionExists;
%_casCheckSessionExists;
