proc sql;
    select sp_med into :sp_med from sp4r.stats;
quit;
