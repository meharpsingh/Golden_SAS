/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0270-data-bmi.sas --- */
ods html file="c:\temp\slider.gif"; s
data bmi(keep=subject ht wt gname bmi);
   set advrpt.demog(obs=8);
   length gname $4;
   bmi = wt / (ht*ht) * 703; t
   gname=cats('G',subject); u
   call execute('%slider('||gname||','||put(bmi,4.1)||')'); v
   run;

/* --- 0271-proc-report.sas --- */
ods pdf file="&path\results\E10_2_4.pdf" style=default;
title font=arial '10.2.4 Using GKPI';
proc report data=bmi nowd;
column subject gname ht wt bmi slider;
. . . . code not shown . . . .
define slider / computed ' ';
compute slider/char length=62;
slider=' ';
imgfile = "style={postimage='c:\temp\"||trim(left(gname))||".png'}";
call define ('slider','style',imgfile); w
endcomp;
run;
