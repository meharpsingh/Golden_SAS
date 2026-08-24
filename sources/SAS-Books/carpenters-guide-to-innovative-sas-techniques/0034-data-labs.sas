data labs(keep=subject visit labdt); p
   set advrpt.lab_chemistry(keep=subject visit labdt sodium q
                            where=(sodium>'142')); r
   run;
data labs;
   set advrpt.lab_chemistry;
   keep subject visit labdt; n
   if sodium>'142'; o
   run;
