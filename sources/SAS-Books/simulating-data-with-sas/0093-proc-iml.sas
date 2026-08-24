proc iml;
call randseed(12345);
multiple = 2.5;
/* choose value > 2
*/
y = j(multiple * &N, 1);
/* allocate more than you need
*/
call randgen(y, "Normal");
/* y ~ N(0,1)
*/
idx = loc(y > 0);
/* acceptance step
*/
x = y[idx];
x = x[1:&N];
