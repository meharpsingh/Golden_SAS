%macro survival(anumb=, acode=, atype=, refpopcode=,
                activevar=, regimen=, eventcode=);
   %* Test parms transfer;
   %put *******&=anumb *****;
   %put _local_;
%mend survival;
filename xlscntrl "&path\data\control.csv"; ➊
filename inc11_6  "&path\chapter 11\sas programs\Survivalcalls11_6.sas";
data _null_;
   infile xlscntrl dlm=',' truncover firstobs=2;
   file inc11_6;
   length number code analysistype refpop
          censorrule eventcode arvregimen $8;
   input number $ code $ analysistype $ refpop $
         censorrule $ eventcode $ arvregimen $;
   if censorrule ne '-' then censor=censorrule;
   else censor=' ';
   textval=catt( ➋
         '%survival(anumb=',number,
                ',acode=',code,
                ',atype=',analysistype,
                ',refpopcode=',refpop,
                ',activevar=',censor,
                ',regimen=',arvregimen,
                ',eventcode=',eventcode,
                ')'
               );
   put textval; ➌
   run;
%include inc11_6; ➍
