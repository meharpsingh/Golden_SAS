data Edit_Dist;
   infile datalines dlm=',';
   input String1 : $char10. String2 : $char10. Operation $40.;
   GED = compged(string1, string2);
   LEV = complev(string1, string2);
   datalines;


balloon,balloon,match


ba lloon,balloon,blank


balloo,balloon,truncate


baalloon,balloon,double


ballon,balloon,single


balolon,balloon,swap


ball.oon,balloon,punctuation


balloons,balloon,append


balkloon,balloon,insert


blloon,balloon,delete


ba1loon,balloon,replace


blolon,balloon,swap+delete


balls,balloon,replace+truncate*2


balXtoon,balloon,replace+insert


blYloon,balloon,insert+delete


bkakloon,balloon,insert+replace


bllooX,balloon,delete+replace


kballoon,balloon,finsert


alloon,balloon,fdelete


kalloon,balloon,freplace


akloon,balloon,fdelete+replace


akloo,balloon,fdelete+replace+truncate


aklon,balloon,fdelete+replace+single


;
proc print data=Edit_Dist label;
   label GED='Generalized Edit Distance'
LEV='Levenshtein Edit Distance';
   var String1 String2 GED LEV Operation;
run;
