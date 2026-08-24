DATA air;
 SET sashelp.air;
 Air_grp1 = CEIL(air/10);
 Air_grp2 = CEIL(air/10)*10;
 Air_grp3 = CEIL(air/10)*10 - 5;
 Air_grp4 = CEIL(air/10)-10;
RUN;
