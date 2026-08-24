data adtte;
  retain &adtteKEEPSTRING;
  set EMPTY_adtte adtte;
run;
**** SORT adtte ACCORDING TO METADATA AND SAVE PERMANENT DATASET;
%make_sort_order(metadatafile=&metadatafile, dataset=ADTTE)
proc sort
  data=adtte(keep = &adtteKEEPSTRING)
  out=adam.adtte;
    by &adtteSORTSTRING;
run;
