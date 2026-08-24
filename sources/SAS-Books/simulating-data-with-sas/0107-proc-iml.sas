proc iml;
Sigma = {9 1,
1 1};
U = root(Sigma);
print U[format=BEST5.];
