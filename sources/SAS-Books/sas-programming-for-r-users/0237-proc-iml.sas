proc iml;
n=23;
numberIterations=1000;
call randseed(802);
pair = j(numberIterations,1,.);
do iteration=1 to numberIterations;
run;
