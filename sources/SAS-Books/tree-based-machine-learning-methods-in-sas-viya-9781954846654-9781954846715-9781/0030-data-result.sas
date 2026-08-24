data result;
merge train noTransfer noAlien;
by trees;
run;
