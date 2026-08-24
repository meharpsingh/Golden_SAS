/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0029-proc-sort.sas --- */
proc sort
  data=source.dosing(keep=subject startdt enddt)
  out=dosing;
    by subject startdt;
run;
**** FIRSTDOSE=FIRST DOSING AND LASTDOSE=LAST DOSING;
data dosing;
  set dosing;
    by subject;
    retain firstdose lastdose;
    if first.subject then
      do;
        firstdose = .;
        lastdose = .;
      end;
    firstdose = min(firstdose,startdt,enddt);
    lastdose = max(lastdose,startdt,enddt);
    if last.subject;
run;

/* --- 0030-proc-sort.sas --- */
proc sort
  data=source.demographic
  out=demographic;
    by subject;
run;
**** MERGE DEMOGRAPHICS AND FIRST DOSE DATE;
data demog_dose;
  merge demographic
        dosing;
    by subject;
run;
**** DERIVE THE MAJORITY OF SDTM DM VARIABLES;
options missing = ' ';
data dm;
  set DM
      demog_dose(rename=(race=_race));
    studyid = 'XYZ123';
    domain = 'DM';
    usubjid = left(uniqueid);
    subjid = put(subject,3.);
    rfstdtc = put(firstdose,yymmdd10.);
    rfendtc = put(lastdose,yymmdd10.);
    siteid = substr(subjid,1,1) || "00";
    brthdtc = put(dob,yymmdd10.);
    age = floor ((intck('month',dob,firstdose) -
          (day(firstdose) < day(dob))) / 12);
    ageu = 'YEARS';
    sex = put(gender,sex_demographic_gender.);
    race = put(_race,race_demographic_race.);
    armcd = put(trt,armcd_demographic_trt.);
    arm = put(trt,arm_demographic_trt.);
    country = "USA";
run;
**** DEFINE SUPPDM FOR OTHER RACE page 59 IG;
data suppdm;
  set SUPPDM
      dm;
    keep studyid rdomain usubjid idvar idvarval qnam qlabel qval
         qorig qeval;
    **** OUTPUT OTHER RACE AS A SUPPDM VALUE;
    if orace ne '' then
      do;
        rdomain = 'DM';
        qnam = 'RACEOTH';
