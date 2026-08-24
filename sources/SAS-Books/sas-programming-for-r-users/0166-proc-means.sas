proc means data=sp4r.ameshousing;
    var saleprice;
    output out=sp4r.stats median=sp_med;
run;
