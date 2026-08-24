data result;
merge train noTransfer noAlien;
by trees;
run;
proc template;
define statgraph transferLearning;
begingraph;
layout overlay;
scatterplot y=train_ase
x=trees / markerattrs=(color=blue)
name='with'
legendlabel="With Transfer Learning";
scatterplot y=noTransfer_ase
x=trees / markerattrs=(color=red)
name='without'
legendlabel="Without Transfer Learning";
scatterplot y=noAlien_ase
x=trees / markerattrs=(color=brown)
name='noAliens'
legendlabel="Without Aliens";
discretelegend 'without' 'with' 'noAliens';
endlayout;
endgraph;
end;
run;
proc sgrender data=result template=transferLearning;
run;
