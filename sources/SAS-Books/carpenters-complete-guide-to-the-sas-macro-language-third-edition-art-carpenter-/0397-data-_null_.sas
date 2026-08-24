data _null_;
   set trnsdata;
   array allc {*}_character_;  ➊
   array alln {*}_numeric_; ➊
   length __name $32 __str $500;
   if dim(allc) then do __i=1 to dim(allc); ➋
      call vname(allc{__i},__name);  ➌
      * Exclude vars we know we do not want;
      if __name not in('_NAME_' '_LABEL_') then
           __str = catx(' ',__str,__name); ➍
   end;
   if dim(alln) then do __i=1 to dim(alln); ➋
      call vname(alln{__i},__name); ➌
      __str = catx(' ',__str,__name); ➍
   end;
   call symputx('varlist',__str,'g'); ➎
   stop; ➏
   run;
%put &=varlist;
%mend VList;
