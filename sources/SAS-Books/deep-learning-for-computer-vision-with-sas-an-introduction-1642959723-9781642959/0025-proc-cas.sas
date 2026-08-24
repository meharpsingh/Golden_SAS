proc cas;
   image.augmentImages  /
     cropList= {{mutations=
{pyramidDown=TRUE}
x=60
y=20
width=416
height=416
outputWidth=208
outputHeight=208
useWholeImage=false
        }}
     table={name='inputTable'}
     casout={name='outputTable'};
run;
