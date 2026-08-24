   data &models;
      set &models;
      i=_n_;
   run;
   data _null_;
      set &models;
      do j=1 to &n_mod_;
         if j=i then
            do;
               call execute ("
   data optcontrasts; set optcontrasts;
   attrib col"!!compress(j)!!" label='"!!compress(modnam)!!"';
       run;");
            end;
      end;
   data optcontrasts;
      merge &doses(keep=dose) optcontrasts;
   run;
