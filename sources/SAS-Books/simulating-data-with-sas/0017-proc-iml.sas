proc iml;
call randseed(4321);
socks = {"Black" "Black" "Black" "Black" "Black"
"Brown" "Brown" "White" "White" "White"};
params = { 5,
/* sample size
*/
3 };
/* number of samples
*/
s = sample(socks, params, "WOR");
/* sample without replacement */
print s;
