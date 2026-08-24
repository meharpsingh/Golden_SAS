%macro FldChk;
%local i jj dsncnt fldcnt;
%* Create list of data set names;
proc sql noprint; ➊
   select dsn,keyvar
      into :dsn1-,
           :keys1-
         from macro3.dbdir;
   %let dsncnt=&sqlobs;
   quit;
%* Step through the list of data sets;
%do jj = 1 %to &dsncnt; ➋
   %* Determine field checks for this data set;
   proc sql noprint;
      select dsn,var,chktype,chktext
         into :fdsn1-,
              :fvar1-,
              :ftyp1-,
              :ftxt1-
            from macro3.flddir
               where (upcase(dsn)=upcase("&&dsn&jj")); ➌
      %let fldcnt=&sqlobs;
      quit;
   %if &fldcnt > 0 %then %do; ➍
      * Perform field checks;
      data CheckError_&&dsn&jj(keep= &&keys&jj  _obs_ var ➎
                                     msg text value chkdate);
        set macro3.&&dsn&jj;
        * Date these field checks;
        retain chkdate %sysfunc(today());
        format chkdate date9.;
        * Specify lengths for the descriptor variables;
        length var $15 value $25 text msg $100;
        * Note the observation number;
        _obs_ = _n_;
        %* Build the Field error checks;
        %do i = 1 %to &fldcnt; ➏
           %if %upcase(&&ftyp&i) = LIST %then %do; ➐
              if &&fvar&i not in&&ftxt&i then do;  ➑
                 var = "&&fvar&i";  ➒
                 msg = 'Value is not on list';
                 text = "&&ftxt&i";
                 value = &&fvar&i;
                 output  CheckError_&&dsn&jj; ➓
              end;
           %end;
           %else %if %upcase(&&ftyp&i) = NOTMISS %then %do;
              if missing(&&fvar&i) then do;
                 var = "&&fvar&i";
                 msg = 'Value is missing';
                 text = "&&ftxt&i";
                 value = &&fvar&i;
                 output  CheckError_&&dsn&jj;
              end;
           %end;
