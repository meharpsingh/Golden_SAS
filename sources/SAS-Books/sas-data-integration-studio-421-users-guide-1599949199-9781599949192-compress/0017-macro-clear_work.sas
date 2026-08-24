%macro clear_work;
    %local work_members;
    proc sql noprint;
    select memname
    into :work_members separated by ","
    from dictionary.tables
    where
        libname = "WORK" and
        memtype = "DATA";
    quit;
    data _null_;
        work_members = symget("work_members");
        num_members = input(symget("sqlobs"), best.);
        do n = 1 to num_members;
            this_member = scan(work_members, n, ",");
            call symput("member"||trim(left(put(n,best.))),trim(this_member));
        end;
        call symput("num_members", trim(left(put(num_members,best.))));
    run;
    %if #_members gt 0 %then %do;
        proc datasets library = work nolist;
            %do n=1 %to #_members;
                delete &&member&n
            %end;
        quit;
    %end;
%mend clear_work;
