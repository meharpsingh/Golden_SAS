%macro makerunbat(saspgmloc=c:\temp,batchloc=c:\);
   filename c1sas pipe "dir ""&saspgmloc\*.sas"" /o:n /b"; ➊
   data _null_;
      length saspgm $40  excmd $350;
      * read the names of the SAS programs;
      infile c1sas truncover;
      input saspgm $40.; ➋
      * Write out the batchfile into &batchloc;
      file "&batchloc\Program13.1.3a_runbat.bat"; ➌
      * Build the executable command;
      excmd = catt('"',"%sysget(sasroot)\sas.exe", ➍
                   '" -sysin "', "&saspgmloc", ➎
                   '\',saspgm,'"'); ➏
      put excmd; ➐
   run;
%mend makerunbat;
