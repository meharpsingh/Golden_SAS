/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0293-data-demog.sas --- */
filename e1143 "&path\results\e11_4_3.png"; n
* Initialize graphics options;
goptions reset=all border
         ftext=swiss
         htext=1;
goptions device=png
         gsfname=E1143; n
data demog;
   set advrpt.demog(keep=edu wt);
   drilledu = catt('href=E11_4_3.pdf#_',
                   left(put(edu,2.))); o
   run;

/* --- 0305-proc-format.sas --- */
proc format;
   value $regx
      '1'=' 1'
      '2'=' 2'
      'X'=' X' ; n
   value $genderu
      'M'='Male'
      'F'='Female'
      'U'='Unknown'; n
   value $symp
      '00'= 'Unspecified' n
      '01'= 'Sleepiness'
      '02'= 'Coughing'
      '03'= 'Limping';
   run;
title2 'Using PRELOADFMT with EXCLUSIVE';
proc report data=demog nowd;
   column region sex,(wt=n wt);
   define region / group
                   format=$regx6.
                   preloadfmt exclusive;
   define sex    / across        format=$Genderu. 'Gender';
   define n      / analysis n    format=2.0 'N';
   define wt     / analysis mean format=6.2 'Weight';
   run;

/* --- 0306-proc-report.sas --- */
proc report data=demog nowd completerows;
   column region sex,(wt=n wt);
   define region / group format=$regx6.
                   preloadfmt
                   order=data;
   define sex    / across        format=$Genderu. 'Gender';
   define n      / analysis n    format=2.0 'N';
   define wt     / analysis mean format=6.2 'Weight';
   run;

/* --- 0307-proc-tabulate.sas --- */
proc tabulate data=advrpt.demog;
   class symp /preloadfmt exclusive; n
   var ht wt;
   table symp,
         (ht wt)*(n*f=2. min*f=4.
                  median*f=7.1 max*f=4.)
         / printmiss; p
   format symp $symp.; o
   run;
title2 'Using COMPLETEROWS with PRELOADFMT and EXCLUSIVE';
proc report data=demog nowd completerows;
   column region sex,(wt=n wt);
   define region / group format=$regx6.
                   preloadfmt exclusive;
   define sex    / across        format=$Genderu. 'Gender';
   define n      / analysis n    format=2.0 'N';
   define wt     / analysis mean format=6.2 'Weight';
   run;

/* --- 0393-proc-freq.sas --- */
options nobyline; n
title2 'Summary for #byvar1 #byval1'; o
proc freq data=demog;
   by race;
   table sex;
   run;
title2 'Summary for #byvar(race) #byval(race)';

/* --- 0394-proc-print.sas --- */
proc print data=demog;
   by race sex;
   var lname fname dob;
   run;
