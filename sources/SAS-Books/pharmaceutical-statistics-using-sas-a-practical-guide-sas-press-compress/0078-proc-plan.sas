proc plan seed=56789;
factors block=30 ordered treatment=10;
output out=schedule treat nvals=(1 1 1 1 2 2 2 2 3 3);
