PROC PSMATCH DATA = _indata_ps REGION = ALLOBS;
       CLASS _cohort &classvars_bin_model;
       PSMODEL _cohort(Treated = "1") = &contvars &classvars_bin_model
                                        &always_int;
       OUTPUT OUT = ps PS = _ps_;
RUN;
PROC SUMMARY DATA = ps NWAY;
       CLASS _mergekey _cohort;
       VAR _ps_;
       OUTPUT OUT = ps MEAN =;
RUN;
%IF %SUBSTR(%UPCASE(&debug, 1, 1)) ^= Y %THEN
       OPTIONS NONOTES NOMPRINT NOMLOGIC;;
PROC PSMATCH DATA = ps REGION = ALLOBS;
       CLASS _cohort;
       PSDATA TREATVAR = _cohort(Treated = "1") PS = _ps_;
       STRATA NSTRATA = &nstrata KEY = TOTAL;
       OUTPUT OUT (OBS = REGION) = ps;
RUN;
DATA ps;
       MERGE _indata ps;
       BY _mergekey;
RUN;
%* Calculate standardized bias for step 0  - model without interactions;
%_ps_stddiff_apmb (indata = ps);
