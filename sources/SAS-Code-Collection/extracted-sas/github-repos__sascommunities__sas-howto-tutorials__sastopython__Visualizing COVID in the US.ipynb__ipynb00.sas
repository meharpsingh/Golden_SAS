/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-howto-tutorials/sastopython/Visualizing COVID in the US.ipynb (ipynb 0) */

results_dict = sas_session.submitLST(
             """
                filename nyt_url url 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv';
                data us_counties_nyt;
                    length Date 8 County $ 30 statename $ 30 FIPS $ 6 Cases 8 Deaths 8 WeekOf 8;
                    format Date date9. WeekOf date9.;
                    infile nyt_url dlm=',' missover dsd firstobs=2;
                    input date : yymmdd10.;
                        county
                        statename
                        FIPS
                        cases
                        deaths;
                    /* Adding Week ending value for easier summary later */
                    WeekOf = intnx('week',date,0,'E');
                run;
             """,
