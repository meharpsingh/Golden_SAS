data .....;
  set.....;
  if "%exist(sasuser.bigdat)"="YES" then do;
...more SAS statements...
If the data set SASUSER.BIGDAT exists the macro call in the IF statement is replaced with the word YES:
data .....;
  set.....;
  if "YES"="YES" then do;
