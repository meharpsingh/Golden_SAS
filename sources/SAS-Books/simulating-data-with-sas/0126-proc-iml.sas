proc iml;
C = {1.0 0.3 0.9,
0.3 1.0 0.9,
0.9 0.9 1.0};
eigval = eigval(C);
print eigval;
