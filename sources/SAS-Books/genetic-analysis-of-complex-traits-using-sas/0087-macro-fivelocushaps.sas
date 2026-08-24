%macro fivelocushaps;
  %do first=1 %to 51 %by 10;
   %let last=%eval(&first+9);
   %let firstm=%eval((&first+1)/2);
   proc haplotype data=founders ndata=map(firstobs=&firstm) ld;
     var a&first-a&last;
   run;
  %end;
%mend;
