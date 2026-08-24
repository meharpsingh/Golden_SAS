/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-education/sas1/05_Addressing_the_Use_Case_with_the_R_Language/03_Machine_Learning/01_Exploring_Data.ipynb (ipynb 0) */

#Prints out categorical data into a table;
summary_table <- sapply(churn_df[sapply(churn_df, is.character)], function(x) {
  tbl <- table(x)
  data.frame(;
    count = sum(!is.na(x)),
    unique = length(unique(x)),
    top = substr(names(which.max(tbl)),1,40),
    freq = max(tbl),
    stringsAsFactors = FALSE
  )
}, simplify = FALSE)

# Combine into one data frame;
summary_df <- bind_rows(summary_table, .id = "column")
summary_df
run;
