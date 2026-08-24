proc format;
   value dategrp
                      .='None'
       low-'31dec2006'd=[year4.]
      '01jan2007'd-high=[monyy7.]
   ;
run;
