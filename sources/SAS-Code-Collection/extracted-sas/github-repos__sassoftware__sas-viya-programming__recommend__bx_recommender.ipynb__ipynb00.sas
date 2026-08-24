/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/recommend/bx_recommender.ipynb (ipynb 0) */

original_row_count = len(ratings)

s.dataStep.runCode(code='''
  data ratings;
    merge ratings(in=ratings) books(in=books keep=isbn);
    by isbn;
    if books and ratings then output;
  run;
''')

final_row_count = len(ratings)

df = pd.DataFrame([[original_row_count], [final_row_count]], 
                  columns=['Ratings Count'],
                  index=['Original', 'Final'])
df
