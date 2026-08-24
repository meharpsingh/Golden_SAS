data WORK.RESULT17;
set WORK.BIG;
WHERE id in (
");
do until(EOF);
set WORK.small end=EOF;
call execute(IDS);
end;
call execute("); run;");
15 stop;
16 run;
