/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2020/papers/4157-2020-Toporowski/Python and the SAS QKB for Better Data Quality.ipynb (ipynb 3) */

# run dataStep code to combine City, Province, PostCode fields for problem rows and parse out correct info;
viya.dataStep.runCode( 
    code=''' data public.testexcel_dq_2(drop=City_Ident Prov_Ident Post_Ident Phone_Ident parsedCPP);  
             set public.testexcel_dq_from_Python;
             if City_Ident ^= 'CITY' and (Prov_Ident='EMPTY' or Post_Ident='EMPTY') then do;
                 parsedCPP = dqParse(CATX(' ',City,Prov,PostCode), 'City - State/Province - Postal Code', 'ENCAN');
                 City     = dqParseTokenGet(parsedCPP, 'City', 'City - State/Province - Postal Code', 'ENCAN');
                 Prov     = dqParseTokenGet(parsedCPP, 'State/Province', 'City - State/Province - Postal Code', 'ENCAN');
                 PostCode = dqParseTokenGet(parsedCPP, 'Postal Code', 'City - State/Province - Postal Code', 'ENCAN');
                end;
             run;''');
dq2 = viya.CASTable('testexcel_dq_2')
dq2.to_frame()
