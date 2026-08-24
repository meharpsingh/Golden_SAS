%macro myimport(firstyear,lastyear);
    %do i=&firstyear %to &lastyear;
        proc import datafile = "&path\amesbyyear.xlsx"
            out = sp4r.year&i
            dbms = xlsx REPLACE;
            getnames = yes;
            sheet = "&i";
            datarow = 2;
        run;
     %end;
%mend;
