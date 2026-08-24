proc sgscatter data=sasuser.EconomicData;
where YEAR(Date) EQ 1991;
plot (IP LHUR LUINC)*Month /
  columns=1
  join=(smoothconnect /* not jagged */
        lineattrs=(color=red thickness=2px))
  markerattrs=(symbol=CircleFilled color=blue size=9px)
  datalabel axisextent=data grid;
label Month='00'X; /* Using a blank instead yields the
VarName */
format IP 3.; /* keep IP data labels shorter, but
sufficient */
run;
