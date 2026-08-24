/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/phuse-org__adrgOS/dev/pilot3/adrg.html (htmlpre 16) */

# Modify path to the sdtm, adam and output location
# Output saved in current folder

path <- list(
  sdtm = "Enter full file path to the sdtm data here",
  adam = "Enter full file path to where adam data will be written and;
  sourced here",
  output = "Enter full file path to where outputs should be saved here";
  )
  
# For example

path <- list(
  sdtm = "~/pilot3-files/m5/datasets/rconsortiumpilot3/tabulations/sdtm",
  adam = "~/pilot3-files/m5/datasets/rconsortiumpilot3/analysis/
          adam-reviewer/datasets",
  output = "~/pilot3-files/m5/datasets/rconsortiumpilot3/analysis/output"
  )
run;
