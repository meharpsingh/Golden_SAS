%macro pprintit(txt=);
   title1 "&txt";
   title2 &txt;
   proc print data=sashelp.class;
   run;
%mend pprintit;
