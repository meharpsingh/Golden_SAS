%macro dumpit (cntout);
 %* create a local counter;
 %local cwj;
 %do cwj=1 %to &numobs;
  %* fileref to identify the file to list;
  filename dump&cwj "&&invar&cwj" ➎ disp=shr; ➍
  * read and write the first &cntout records;
  data _null_; ➏
    infile dump&cwj end=done; ➐
    * read the next record;
    input;
    incnt+1;
    if incnt le &cntout then list; ➑
    if done then do;
       file print; ➒
       put //@10 "total records for &&invar&cwj is "
             +2 incnt comma9. ;
    end;
  run;
  filename dump&cwj clear;
 %end;
%mend dumpit; * the macro definition ends;
* read the control file and establish macro variables;
data dumpit; ➊
 infile cards;
 input filenam $25.;
 cnt+1;
 newname=trim(filenam);
 * the macro variable INVARi contains the ith file name;
 call symput ('invar'!!trim(left(put(cnt,3.))),newname); ➌
 * store the number of files to read;
cards; ➋
PNB7.QSAM.BANK.RECON
PNB7.QSAM.CHECKS
PNB7.QSAM.CHKNMBR
PNB7.QSAM.CKTOHIST
PNB7.QSAM.DRAIN
PNB7.QSAM.RECON
PNB7.BDAM.BDAMCKNO
PNB7.BDAM.VCHRCKNO
PNB7.QSAM.CS2V3120.CARDIN
PNB7.QSAM.CASVCHCK
PNB7.QSAM.CASVOUCH
PNB7.QSAM.VCHR3120.CARDIN
PNB7.QSAM.VOUCHERS
TAX7.JACKSON
;;;
title "City of Dallas - ECI (FINSYS), jobname is &sysjobid";
title2 "List of files to dump";
