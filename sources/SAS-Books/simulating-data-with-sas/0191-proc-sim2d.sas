proc sim2d outsim=GRF narrow;
grid x = 0 to 100 by 10
y = 0 to 100 by 10;
simulate form=Gauss scale=8 range=30 numreal=4 seed=12345;
mean 40;
run;
