proc sql;
  select objname, objtype, objdesc, created
    from sashelp.vcatalg
    where libname="SASHELP"
         and memname="ANALYST"
 order by objtype;
quit;
