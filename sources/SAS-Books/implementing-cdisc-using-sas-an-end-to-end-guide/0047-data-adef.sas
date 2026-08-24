data adef;
  retain &ADEFKEEPSTRING;
  set EMPTY_ADEF adef;
run;
**** SORT ADEF ACCORDING TO METADATA AND SAVE PERMANENT DATASET;
%make_sort_order(metadatafile=&metadatafile, dataset=ADEF)
proc sort
  data=adef(keep = &ADEFKEEPSTRING)
  out=adam.adef;
    by &ADEFSORTSTRING;
run;
