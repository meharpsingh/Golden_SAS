ods graphics on;
proc hpforest data=emsas.spxrawp
       maxtrees=100 vars_to_try=10 seed=12345 inbagfractio
       maxdepth=10 leafsize=1 alpha=0.05 scoreprole=oob;
       id dates partition;
       target target/level=binary;
       input &var_list. /level=interval; /* Macrovariable
       partition rolevar=partition(train='1' validate='2')
       save file ="%sysfunc(pathname(work))/forestscore.sa
       score out=pforestout;
       ods output fitstatistics=pforeststats modelinfo=for
run;
/*SAS Code to the obtain the fit statistics for the select
data _null;
       set forestinfo(where=(parameter='Actual Trees'));
       call symput("treenum",setting);
run;
data foreststats;
       set pforeststats(where=(Ntrees=&treenum));
run;
/*Comparing Prediction to Actual Outcomes*/
proc sort data=pforestout;        by dates;run;
proc sort data=emsas.spxrawp; by dates;run;
data forestout;
       merge pforestout emsas.spxrawp;
       by dates;
