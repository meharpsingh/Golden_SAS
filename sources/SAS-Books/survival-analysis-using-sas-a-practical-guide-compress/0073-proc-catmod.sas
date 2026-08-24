proc catmod data=jobyrs2;
direct ed prestige salary year;
model outcome=ed prestige salary year / noprofile noiter;
run;
