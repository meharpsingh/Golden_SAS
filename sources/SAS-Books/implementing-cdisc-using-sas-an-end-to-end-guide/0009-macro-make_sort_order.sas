%macro make_sort_order(metadatafile=,dataset=);
    proc import
        datafile="&metadatafile"
        out=_temp
        dbms=excelcs
        replace;
        sheet="TOC_METADATA";
    run;
    ** create **SORTSTRING macro variable;
    %global &dataset.SORTSTRING;
    data _null_;
      set _temp;
        where name = "&dataset";
        call symputx(compress("&dataset" || "SORTSTRING"),
                     translate(domainkeys," ",","));
    run;
%mend make_sort_order;
