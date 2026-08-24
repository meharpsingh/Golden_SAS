%macro makerunbat2(saspgmloc=c:\temp,batchloc=c:\);
   filename c1sas pipe "dir ""&saspgmloc\*.sas"" /o:n /b";
   data _null_;
      length saspgm $40  excmd $350;
      * Build the master batch pgm;
      if _n_=1 then do; ➊
         * Write out the batchfile into &batchloc;
         file "&batchloc\Program13.1.3b_runbat.bat"; ➋
         * Build the executable command;
         excmd = catt('"',"%sysget(sasroot)\sas.exe",
                      '" -sysin "', "&batchloc",
                      '\Program13.1.3b_Masterpgm.sas"'); ➌
         put excmd;
      end;
      * read the names of the SAS programs;
      infile c1sas truncover;
      input saspgm $40.; ➍
         * Write the INCLUDE statements into the master program;
         file "&batchloc\Program13.1.3b_Masterpgm.sas"; ➎
         * Build the INCLUDE statement to be written to the master;
         excmd = cat('%include ',
                      quote(catt("&saspgmloc",
                                  '\',
                                 saspgm))); ➏
         put excmd;
   run;
%mend makerunbat2;
