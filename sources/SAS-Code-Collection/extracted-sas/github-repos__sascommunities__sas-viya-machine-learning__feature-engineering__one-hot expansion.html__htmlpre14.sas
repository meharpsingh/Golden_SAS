/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-viya-machine-learning/feature-engineering/one-hot expansion.html (htmlpre 14) */

# setup the data step code.;

expanded_table = 'hmeq_expanded'

code_str = "data " + expanded_table + ";";
code_str += "set " + sparse_table + ";";
for nominal in nominal_inputs:
    n_levels = n_levels_dict[nominal]
    for i in range(n_levels):
        index = i + 1
run;
