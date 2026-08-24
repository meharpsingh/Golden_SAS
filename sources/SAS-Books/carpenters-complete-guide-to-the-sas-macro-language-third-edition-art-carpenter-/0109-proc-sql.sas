proc sql noprint;
select height, weight
   into :ht separated by ' ',
        :wt separated by ' '
      from sashelp.class
         where name='Alfred';
   quit;
%put |&ht|;
%put |&wt|;
