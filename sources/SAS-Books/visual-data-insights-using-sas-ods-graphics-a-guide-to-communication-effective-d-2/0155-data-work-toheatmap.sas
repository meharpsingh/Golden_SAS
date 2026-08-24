data work.ToHeatMap;
length CountAndAvgBPstatus $ 12;
set work.Summary;
CountAndAvgBPstatus =
/* to be the TEXT (annotation) variable */
  trim(left(_freq_)) || ' at ' || put(avg_bp_measure,4.2);
run;
