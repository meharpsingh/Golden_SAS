proc sim2d outsim=GRF plots=(sim);
grid x = 0 to 100 by 10
y = 0 to 100 by 10;
simulate scale=8 range=30 form=Gauss numreal=5000 seed=12345;
mean 40;
run;
