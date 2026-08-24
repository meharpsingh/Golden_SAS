data a;
input x $40.;
x1=translate(x,'a','&');
cards;
My&Name&IS&akansha
Hello&World
;
Run;
proc print data=a;
Run;
