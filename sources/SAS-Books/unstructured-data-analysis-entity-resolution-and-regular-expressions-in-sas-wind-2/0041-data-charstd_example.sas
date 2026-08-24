data charSTD_example;
input answer $;
select(answer);
   when('yes','y','1') STDans='Y';
   when('no','No','n','0') STDans='N';
   otherwise;
   end;
datalines;
yes
y
no
n
No
;
run;
proc print data=work.charSTD_example;
run;
