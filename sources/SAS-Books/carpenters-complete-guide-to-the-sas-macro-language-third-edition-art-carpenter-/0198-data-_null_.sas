data _null_;
   name='Joe      ';
   call symput('name',name);
   run;
%let qname = %bquote(Sam        );
%put |&name|;
%put |&qname|;
%put |%trim(&name)|;
