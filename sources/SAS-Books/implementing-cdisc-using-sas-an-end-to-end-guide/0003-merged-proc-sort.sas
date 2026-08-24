/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0003-macro-make_empty_dataset.sas --- */
%macro make_empty_dataset(metadatafile=,dataset=);
    proc import
        datafile="&metadatafile"
        out=_temp
        dbms=excelcs
        replace;
        sheet="VARIABLE_METADATA";
    run;

/* --- 0004-proc-sort.sas --- */
    proc sort
      data=_temp;
         where domain = "&dataset";
         by varnum;
    run;
    ** create keepstring macro variable and load metadata
    ** information into macro variables;
    %global &dataset.KEEPSTRING;
    data _null_;
      set _temp nobs=nobs end=eof;
        if _n_=1 then
          call symput("vars", compress(put(nobs,3.)));
        call symputx('var'    || compress(put(_n_, 3.)),variable);
        call symputx('label'  || compress(put(_n_, 3.)), label);
        call symputx('length' || compress(put(_n_, 3.)),
                                          put(length, 3.));
        ** valid ODM types include TEXT, INTEGER, FLOAT, DATETIME,
        ** DATE, TIME and map to SAS numeric or character;
        if upcase(type) in ("INTEGER", "FLOAT") then
          call symputx('type' || compress(put(_n_, 3.)), "");
        else if upcase(type) in ("TEXT", "DATE", "DATETIME",
                                 "DATE", "TIME") then
          call symputx('type' || compress(put(_n_, 3.)), "$");
        else
          put "ERR" "OR: not using a valid ODM type.  " type=;
        ** create **KEEPSTRING macro variable;
        length keepstring $ 32767;
        retain keepstring;
        keepstring = compress(keepstring) || "|" ||left(variable);
        if eof then
          call symputx(upcase(compress("&dataset"||'KEEPSTRING')),
                       left(trim(translate(keepstring," ","|"))));
    run;
    ** create a 0-observation template data set used for assigning
    ** variable attributes to the actual data sets;
    data EMPTY_&dataset;
        %do i=1 %to &vars;
           attrib &&var&i label="&&label&i"
                  length=&&type&i.&&length&i...
           ;
           %if &&type&i=$ %then
             retain &&var&i '';
