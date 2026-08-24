%macro readnew(dsin=,dsout=);
data &dsout;
   set &dsin;
...Code not shown...
%mend readnew;
***********************************************************;
%macro doit;
* use selected surveys*;
%readnew(dsout=new1,dsin=%do i=16 %to 18; dbbio.sur&i %end;)
%readnew(dsout=new2,dsin=%do i=42 %to 54; dbbio.sur&i %end;)
