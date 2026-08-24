%let metadatafile=&path/data/adam-metadata/adam_metadata.xlsx
%make_empty_dataset(metadatafile=&metadatafile,dataset=ADEF)
** derive AVAL, BASE, CHG, and PCHG;
%cfb(indata=sdtm.xp, outdata=adef, dayvar=xpdy, avalvar= xpstresn);
proc sort
  data = adam.adsl
  (keep = usubjid siteid country age agegr1 agegr1n sex race randdt trt01p
trt01pn ittfl)
  out = adsl;
    by usubjid;
data adef;
  merge adef (in = inadef) adsl (in = inadsl);
    by usubjid ;
        if not(inadsl and inadef) then
          put 'PROB' 'LEM: Missing subject?-- ' usubjid= inadef= inadsl= ;
        rename trt01p    = trtp
               trt01pn   = trtpn
               xptest    = param
               xptestcd  = paramcd
               visit     = avisit
               visitnum  = avisitn
               xporres   = avalc
        ;
        if inadsl and inadef;
        %dtc2dt(xpdtc, refdt=randdt);
        retain crit1 "Pain improvement from baseline of at least 2
points";
        crit1fl = put((.z <= chg <= -2), _0n1y.);
run;
