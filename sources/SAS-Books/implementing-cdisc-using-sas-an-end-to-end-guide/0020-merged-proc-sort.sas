/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0020-proc-sort.sas --- */
proc sort
  data=ae;
    by usubjid;
run;
**** CREATE SDTM STUDYDAY VARIABLES;
data ae;
  merge ae(in=inae) target.dm(keep=usubjid rfstdtc);
    by usubjid;
    if inae;
    %make_sdtm_dy(date=aestdtc);
    %make_sdtm_dy(date=aeendtc);
run;
**** CREATE SEQ VARIABLE;
proc sort
  data=ae;
    by studyid usubjid aedecod aestdtc aeendtc;
run;
data ae;
  retain &AEKEEPSTRING;
  set ae(drop=aeseq);
    by studyid usubjid aedecod aestdtc aeendtc;
    if not (first.aeendtc and last.aeendtc) then
      put "WARN" "ING: key variables do not define an unique"
          " record. " usubjid=;
    retain aeseq;
    if first.usubjid then
      aeseq = 1;
    else
      aeseq = aeseq + 1;
    label aeseq = "Sequence Number";
run;

/* --- 0021-proc-sort.sas --- */
proc sort
  data=ae(keep = &AEKEEPSTRING)
  out=target.ae;
    by &AESORTSTRING;
run;
