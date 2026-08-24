PROC SUMMARY DATA=preteen NWAY;
CLASS sex;
VAR age height weight;
OUTPUT OUT=group_averages(DROP = _type_ _freq_)
 MIN (age   )=Youngest
 MAX (age   )=Oldest
 MEAN(height)=Avg_Height
 MEAN(weight)=Avg_Weight;
RUN;
