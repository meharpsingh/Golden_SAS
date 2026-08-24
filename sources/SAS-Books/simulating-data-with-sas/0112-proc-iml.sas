proc iml;
call randseed(12345);
Sigma = {1.0
0.6,
0.6
1.0};
Z = RandNormal(1e4, {0,0}, Sigma);
