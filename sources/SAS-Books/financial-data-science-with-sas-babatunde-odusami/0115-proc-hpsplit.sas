ods graphics on;
proc hpsplit data=emsas.spxrawp  maxbranch=2 splitonce
       intervalbins=100 maxdepth=10 mincatsize=1 mindist=0
       assignmissing=popular;
       id dates partition;
       class target;
       model target = &var_list.;
       grow entropy;
/*Prune based on misclassification and select subtree with
       prune  misc / min;
