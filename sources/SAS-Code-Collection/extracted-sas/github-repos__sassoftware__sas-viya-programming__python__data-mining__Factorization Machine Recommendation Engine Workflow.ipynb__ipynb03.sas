/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/data-mining/Factorization Machine Recommendation Engine Workflow.ipynb (ipynb 3) */

#Join the Data together;
s.fedSQL.execDirect('''
    CREATE TABLE '''+ indata +'''_model {options replace=True} AS;
        SELECT;
            t1.*,
            t2.year,
            t2.parental_rating
        FROM;
            ''' + indata + '''_prt t1
        LEFT JOIN ''' + movie_info +''' t2;
        ON t1.movie = t2.movieId
''')

s.dataStep.runCode('''
    data '''+ indata +'''_model2 (replace=YES);
    set '''+ indata +'''_model;
    if parental_rating = "";
        then parental_rating="None";
    if year ne .;
    run;
    
    ''')

s.CASTable('movie_reviews_model2').head()
