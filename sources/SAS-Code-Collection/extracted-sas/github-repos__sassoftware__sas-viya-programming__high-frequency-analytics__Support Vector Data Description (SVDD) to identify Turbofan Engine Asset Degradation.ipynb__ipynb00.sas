/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/high-frequency-analytics/Support Vector Data Description (SVDD) to identify Turbofan Engine Asset Degradation.ipynb (ipynb 0) */

df = pd.read_table('test.txt', delim_whitespace=True, names=['engine', 'cycle'] + x)

# create a scoring data set with 9 random engines from the test data set;
df['index'] = df.index
score = df[df['engine'].isin([1, 8, 22, 53, 63, 86, 102, 158, 170, 202])]
score.tail()
run;
