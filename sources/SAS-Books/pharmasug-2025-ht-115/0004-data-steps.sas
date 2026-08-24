DATA steps to perform data extraction.
code: I/O functions
1 /* look-up 24, OPEN + FETCH */
2 data WORK.RESULT24;
set WORK.BIG(obs=0) WORK.small;
did = OPEN("WORK.BIG(where=(id=" !! put(IDS,best32.) !! "))");
if did then do;
CALL SET(did);
do while (0=FETCH(did)); output; end;
end;
did = CLOSE(did);
10 run;
