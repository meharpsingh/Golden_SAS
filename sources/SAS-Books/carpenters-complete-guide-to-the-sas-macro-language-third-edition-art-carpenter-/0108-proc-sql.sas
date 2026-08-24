proc sql noprint;
select height, weight
   into :ht, :wt
      from sashelp.class
         where name='Alfred';
   quit;
%put |&ht|;
%put |&wt|;
