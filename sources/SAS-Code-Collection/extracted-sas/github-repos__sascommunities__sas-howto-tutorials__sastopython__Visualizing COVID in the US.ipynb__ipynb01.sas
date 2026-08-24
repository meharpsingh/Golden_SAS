/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-howto-tutorials/sastopython/Visualizing COVID in the US.ipynb (ipynb 1) */

results_dict = sas_session.submit(
             """
            proc sql noprint;
             create table NYT_joined as;
                select nyt.Date, nyt.County, nyt.statename as State, usd.Statecode as StateCode, nyt.Cases, nyt.Deaths;
                from work.US_COUNTIES_NYT as nyt inner join sashelp.us_data as usd;
                on nyt.statename=usd.statename;
            quit;
             """,
             )
