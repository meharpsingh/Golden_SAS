       proc sort
        data = &sourcelib..&suppdata
        out = nvars
        nodupkey;
          where rdomain=upcase("&domain");
          by qnam idvar;
      run;
      data _null_;
        set nvars end=eof;
          by qnam idvar;
             length varlist $200;
             retain varlist;
             if not first.qnam then
                put 'PROB' 'LEM: More than one IDVAR for the domain-- '
                     rdomain= qnam=idvar= ;
             else
                do;
                   nvars + 1;
                   varlist = trim(varlist) || " " || trim(qnam);
                end;
