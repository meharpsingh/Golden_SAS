%macro survival(anumb=, acode=, atype=, refpopcode=, ➊
                activevar=, regimen=, eventcode=);
   %* Test parms transfer;
   %put *******&=anumb *****;
   %put _local_;
%mend survival;
filename xlscntrl "&path\data\control.csv";   ➋
data _null_;
   infile xlscntrl dlm=',' truncover firstobs=2;
   length number code analysistype refpop ➌
          censorrule eventcode arvregimen $8;
   input number $ code $ analysistype $ refpop $
         censorrule $ eventcode $ arvregimen $;
   if censorrule ne '-' then censor=censorrule; ➍
   else censor=' ';
   call execute(catt( ➎
         '%survival(anumb=',number, ➏
                ',acode=',code, ➐
                ',atype=',analysistype,
                ',refpopcode=',refpop,
                ',activevar=',censor,
                ',regimen=',arvregimen,
                ',eventcode=',eventcode,
                ')' ➑
             )); ➒
   run;
