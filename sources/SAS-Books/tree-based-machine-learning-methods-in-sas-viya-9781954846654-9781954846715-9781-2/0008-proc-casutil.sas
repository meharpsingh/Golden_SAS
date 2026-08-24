proc casutil;
load file="/home/student/casuser/VBBF/PaySimData.csv"
importoptions=(filetype="csv")
outcaslib= "public" casout="PaySimData"; *promote;
run;
proc freq data=public.PaySimData;
tables isFraud isFraud*type;
run;
