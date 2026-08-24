filename xlscntrl "&path\data\control.csv";  ➊
data _null_;
   infile xlscntrl dlm=',' truncover firstobs=2; ➋
   length number code analysistype refpop
          censorrule eventcode arvregimen $8;
   input number $ code $ analysistype $ refpop $ ➌
         censorrule $ eventcode $ arvregimen $;
   i+1; ➍
   ii=left(put(i,4.)); ➎
   call symputx('anumb'||ii,trim(number),'l'); ➏
   call symputx('acode'||ii,trim(code),'l');
   call symputx('atype'||ii,trim(analysistype),'l');
   call symputx('refpop'||ii,trim(refpop),'l');
   if censorrule ne '-' then ➐
     call symputx('censor'||ii,trim(censorrule),'l');
   else call symputx('censor'||ii,' ','l');
   call symputx('eventcode'||ii,trim(eventcode),'l');
   call symputx('arvreg'||ii,trim(arvregimen),'l');
   call symputx('count',ii,'l'); ➑
   run;
