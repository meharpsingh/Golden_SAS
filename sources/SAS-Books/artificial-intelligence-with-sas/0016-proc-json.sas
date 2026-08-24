proc json out=_webout;
export mycas.book_recs(keep=title);
run;
/* code to use for HTML results or debug */
/*
proc print data=mycas.ranked_books(obs=5);
run;
proc print data=mycas.book_recs;
run;
