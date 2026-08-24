DATA oversample1;
 SET sampsio.hmeq;
 IF bad = 1 or
    bad = 0 and RANUNI(44) <= 0.5 THEN OUTPUT;
RUN;
