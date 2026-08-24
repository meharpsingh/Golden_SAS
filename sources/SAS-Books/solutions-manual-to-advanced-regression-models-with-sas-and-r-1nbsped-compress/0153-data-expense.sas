data expense;
input inbusiness$ 1-9 firsttime$ type$ 15-25 amount;
cards;
< 1 year  yes stationary  5690
1-5 years yes stationary  14454
5+ years  yes electronics 20489
5+ years  no  stationary  13115
< 1 year  no  electronics 44885
< 1 year  no  electronics 28182
< 1 year  no  furniture   40982
< 1 year  no  stationary  10160
1-5 years no  furniture   51363
5+ years  yes electronics 29448
5+ years  no  stationary  2093
< 1 year  no  furniture   127133
1-5 years yes furniture   21593
< 1 year  no  furniture   220909
1-5 years  no electronics 17000
1-5 years yes electronics 22812
1-5 years yes electronics 13090
1-5 years no  electronics 24336
5+ years  yes stationary  452
< 1 year  yes stationary  3600
5+ years  yes furniture   2450
< 1 year  no  electronics 12230
5+ years  yes stationary  2451
1-5 years no  stationary  1110
< 1 year  yes electronics 69280
< 1 year  yes furniture   119613
< 1 year  no  electronics 21770
< 1 year  yes electronics 64160
< 1 year  no  furniture   78900
< 1 year  no  electronics 75095
5+ years  no  furniture   7450
5+ years  no  furniture   5200



< 1 year  no  furniture   32099
5+ years  no  electronics 1997
;
/*categorizing spending amount*/
data expense;
set expense;
length amount_cat $13;
if amount <10000 then amount_cat="1. <$10K";
if amount ge 10000 and amount < 30000 then amount_cat="2. $10K-<$30K";
if amount ge 30000 then amount_cat="3. $30K+";
run;
proc genmod;
 class inbusiness(ref="< 1 year") firsttime(ref="no") type(ref="furniture");
  model amount_cat = inbusiness firsttime type / dist=multinomial link=cumcll;
run;
