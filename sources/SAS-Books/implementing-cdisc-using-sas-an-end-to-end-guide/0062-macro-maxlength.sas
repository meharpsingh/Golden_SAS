%macro maxlength(datalist, varlist, integrate=0, ids= );
  ** create global macro variables that will contain the
  **   maximum required length for each variable in &VARLIST;
  %let wrd = 1;
  %do %while(%scan(&varlist,&wrd)^= );
     %global %scan(&varlist,&wrd)max ;
     %let wrd = %eval(&wrd+1);
  %end;
  ** initialize each maximum length to 1;
  %do %while(%scan(&varlist,&wrd)^= );
    %let %scan(&varlist,&wrd)max=1;
    %let wrd = %eval(&wrd+1);
  %end;
  ** find the maximum required length across each data
  ** set in &DATALIST;
  %let d = 1;
  %do %while(%scan(&datalist,&d, )^= );
    %let data=%scan(&datalist,&d, );
    %put data=&data;
    %let wrd = 1;
    data _null_;
      set &data end=eof;
      %do %while(%scan(&varlist,&wrd)^= );
        %let thisvar = %scan(&varlist,&wrd) ;
        retain &thisvar.max &&&thisvar.max ;
        &thisvar.max = max(&thisvar.max,length(&thisvar));
        if eof then
          call symput("&thisvar.max", put(&thisvar.max,4.));
        %let wrd = %eval(&wrd+1);
      %end;
    run;
