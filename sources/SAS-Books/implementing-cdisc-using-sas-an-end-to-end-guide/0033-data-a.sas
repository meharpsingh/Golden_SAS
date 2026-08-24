data a;
    adtc = '2008-09-15';
    adt  = input(adtc, e8601da10.);
    bdtc = adtc || "T15:53:00";
    bdtm = input(bdtc, e8601dt19.);
    put adt=date9. bdtm=datetime16.;
run;
