DATA air;
 SET sashelp.air;
 FORMAT air_grp $15.;
 IF      air =  .   THEN air_grp = '00: MISSING';
 ELSE IF air < 220  THEN air_grp = '01: < 220';
 ELSE IF air < 275  THEN air_grp = '02: 220 - 274';
 ELSE                    air_grp = '03: >= 275';
RUN;
