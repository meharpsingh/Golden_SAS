data one;
do i=1 to 10;
x=5+rangam(1,0.5); group="A"; output;
x=7+rangam(1,0.5); group="B"; output;
x=7.2+rangam(1,0.5); group="C"; output;
x=7.4+rangam(1,0.5); group="D"; output;
drop i;
end;
run;
