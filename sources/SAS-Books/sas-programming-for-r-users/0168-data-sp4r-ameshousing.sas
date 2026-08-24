data sp4r.ameshousing;
    set sp4r.ameshousing;
    if saleprice > &sp_med then sp_bin = 1;
    else sp_bin = 0;
run;
proc freq data=sp4r.ameshousing;
    tables sp_bin;
run;
