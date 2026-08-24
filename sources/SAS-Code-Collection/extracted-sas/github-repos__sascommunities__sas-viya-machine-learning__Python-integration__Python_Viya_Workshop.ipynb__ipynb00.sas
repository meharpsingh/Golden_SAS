/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-viya-machine-learning/Python-integration/Python_Viya_Workshop.ipynb (ipynb 0) */

out= conn.datastep.runcode(code='''
        data cars_temp(caslib='casuser');
          set cars_cas(caslib='casuser');
          if MSRP > 80000 then Category='Very Expensive'; 
          else Category='Less Expensive';
          keep Model MSRP Category EngineSize;
        run;
   ''')

out
