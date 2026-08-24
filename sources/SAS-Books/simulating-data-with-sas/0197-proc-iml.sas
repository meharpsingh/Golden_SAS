proc iml;
/* simulate n points uniformly and independently on [0,a]x[0,b] */
start Uniform2d(n, a, b);
u = j(n, 2);
call randgen(u, "Uniform");
return( u # (a||b) );
/* scale to [0,a]x[0,b] */
finish;
