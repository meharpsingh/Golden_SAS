proc summary data=orion.shoe_vendors nway;
var Mfg_Suggested_Retail_Price;
class Line_Name;
output out=summary(keep=Line_Name Avg_MSP)
mean=Avg_MSP;
run;
