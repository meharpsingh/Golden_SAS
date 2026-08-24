proc sim2d data=Sashelp.Thick outsim=GRF plots=(sim);
coordinates xc=East yc=North;
grid x = 0 to 100 by 10
y = 0 to 100 by 10;
simulate var=Thick
scale=8 range=30 form=Gauss numreal=5000 seed=12345;
mean 40;
run;
