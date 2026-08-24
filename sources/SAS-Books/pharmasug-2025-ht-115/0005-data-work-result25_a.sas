data WORK.RESULT25_A / overwrite=yes;
method run();
SET {select B.*
from WORK.BIG as B
join
WORK.small as s
on B.ID = s.IDS
};
output;
end;
enddata;
run;
data WORK.RESULT25_B / overwrite=yes;
method run();
MERGE
WORK.BIG(in=B)
WORK.small(in=S rename=(IDS=ID))
/ RETAIN; /* ! */
BY ID;
if (B and S ) then output;
end;
enddata;
run;
data WORK.RESULT25_C/ overwrite=yes;
declare double IDS rc;
declare package hash H(8,'WORK.small');
drop IDS rc;
method init();
rc = H.defineKey('IDS');
/*rc = H.defineData('IDS');*/
rc = H.defineDone();
end;
method run();
set WORK.BIG;
if (0 = H.check([ID])) then output;
end;
enddata;
run;
44 QUIT;
45 proc print data=WORK.RESULT25_A;
46 proc print data=WORK.RESULT25_B;
47 proc print data=WORK.RESULT25_C;
48 run;
