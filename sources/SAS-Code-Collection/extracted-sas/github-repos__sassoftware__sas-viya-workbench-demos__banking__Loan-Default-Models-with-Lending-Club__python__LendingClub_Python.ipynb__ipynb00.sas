/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-workbench-demos/banking/Loan-Default-Models-with-Lending-Club/python/LendingClub_Python.ipynb (ipynb 0) */

# Save the bank's data as a dataframe;
# Using the pandas package 

# Call csv file by name - In case you wish to use your own dataset based on Lending Club / others with modification;

lendingclub = pd.read_csv(os.path.join(os.getcwd(),"..","data","loan_data.csv"));

# Show how many rows and columns in our data;
print("Training data shape", lendingclub.shape);
run;
