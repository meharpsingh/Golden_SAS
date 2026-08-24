proc astore;
score data= public.score_insurance
out=casuser.ins_scored rstore=casuser.GBDefault;
run;
