data work.ToTwoSidedNeedlePlot;
length DataLabelLeft DataLabelRight $ 48;
set work.Sorted;
if mod(_N_,2) EQ 0
then DataLabelLeft  = DataLabel;
else DataLabelRight = DataLabel;
run;
