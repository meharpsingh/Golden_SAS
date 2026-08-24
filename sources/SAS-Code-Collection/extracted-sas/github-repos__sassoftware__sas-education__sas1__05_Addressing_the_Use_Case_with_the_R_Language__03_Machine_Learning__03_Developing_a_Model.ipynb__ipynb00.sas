/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-education/sas1/05_Addressing_the_Use_Case_with_the_R_Language/03_Machine_Learning/03_Developing_a_Model.ipynb (ipynb 0) */

# creating predictions data frame to bind with data;
rownames(pred_gb) <- NULL
gb_pred_df <- as.data.frame(pred_gb);
names(gb_pred_df)[1] <- "P_LostCustomer"
run;
