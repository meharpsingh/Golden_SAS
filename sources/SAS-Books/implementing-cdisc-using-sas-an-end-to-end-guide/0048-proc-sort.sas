%let metadatafile=&path/data/adam-metadata/adam_metadata.xlsx
%make_empty_dataset(metadatafile=&metadatafile,dataset=ADAE)
proc sort
  data = adam.adsl
  (keep = usubjid siteid country age agegr1 agegr1n sex race trtsdt trt01a
trt01an saffl)
  out = adsl;
    by usubjid;
data adae;
  merge sdtm.ae (in = inae) adsl (in = inadsl);
    by usubjid ;
        if inae and not inadsl then
          put 'PROB' 'LEM: Subject missing from ADSL?-- ' usubjid= inae=
               inadsl= ;
        length CQ01NAM $40.;
        rename trt01a  = trta
               trt01an = trtan
        ;
        if inadsl and inae;
        %dtc2dt(aestdtc, prefix=ast, refdt=trtsdt);
        %dtc2dt(aeendtc, prefix=aen, refdt=trtsdt);
