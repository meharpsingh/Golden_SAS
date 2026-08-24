data adae;
  retain &adaeKEEPSTRING;
  set EMPTY_adae adae;
run;
**** SORT adae ACCORDING TO METADATA AND SAVE PERMANENT DATASET;
%make_sort_order(metadatafile=&metadatafile, dataset=ADAE)
proc sort
  data=adae(keep = &adaeKEEPSTRING)
  out=adam.adae;
    by &adaeSORTSTRING;
run;
