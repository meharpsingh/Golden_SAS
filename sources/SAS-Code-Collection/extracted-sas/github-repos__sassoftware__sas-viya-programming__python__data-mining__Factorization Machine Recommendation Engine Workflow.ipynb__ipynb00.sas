/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/data-mining/Factorization Machine Recommendation Engine Workflow.ipynb (ipynb 0) */

# Connect to the session
s = CAS(cashost, casport)

# Define directory and data file name;
indata_dir="/viyafiles/ankram/Data";
indata='movie_reviews'
movie_info= 'Movies_10k_desc_final'

# Create a CAS library called DMLib pointing to the defined directory
## Note, need to specify the srctype is path, otherwise it defaults to HDFS
s.table.addCaslib(datasource={'srctype':'path'}, name='DMlib', path=indata_dir);

# Push the relevant table In-Memory if it does not already exist;
## Note, this is a server side data load, not being loaded from the client;
a = s.loadTable(caslib='DMlib', path=indata+'.sas7bdat', casout={'name':indata});
b = s.loadTable(caslib='DMlib', path=movie_info+'.sas7bdat', casout={'name':movie_info});

# Load necessary actionsets
actions = ['fedSQL', 'transpose','sampling','factmac','astore', 'recommend']
[s.loadactionset(i) for i in actions]

# Set variables for later use by models;
target          = 'rating'
class_inputs    = ['usr_id', 'movie']
all_inputs      = [target] + class_inputs

#Pointer Shortcut
indata_p = a.casTable
movie_info_p = b.casTable
run;
