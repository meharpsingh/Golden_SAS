proc power;
twosamplemeans
power = .
/* missing ==> "compute this" */
meandiff= 0 to 2 by 0.1
/* delta = 0, 0.1, ..., 2
*/
stddev=1
/* N(delta, 1)
*/
ntotal=20;
/* 20 obs in the two samples
*/
plot x=effect markers=none;
ods output Output=Power;
/* output results to data set */
run;
