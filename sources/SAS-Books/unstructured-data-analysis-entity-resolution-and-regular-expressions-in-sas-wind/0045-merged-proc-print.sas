/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0045-data-charstd_example.sas --- */
data charSTD_example;
input answer $;
select(answer);
   when('yes','y','1') STDans='Y';
   when('no','No','n','0') STDans='N';
   otherwise;
   end;
datalines;


yes


y


1


no


n


No


;
run;

/* --- 0046-proc-print.sas --- */
proc print data=work.charSTD_example;
run;
