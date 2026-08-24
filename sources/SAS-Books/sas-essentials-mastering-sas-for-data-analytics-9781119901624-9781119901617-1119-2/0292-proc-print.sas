 PROC PRINT LABEL DATA=MYSASLIB.TRAUMA (FIRSTOBS=1 OBS=20);
 ID INC_KEY;
 VAR AGE GENDER INJTYPE DISSTATUS;
 VAR ISS/STYLE={FOREGROUND=FMTSEVERE.};
 LABEL   INC_KEY='Subject ID '
             AGE='Age in 2014 '
             GENDER='Gender '
         ISS='Injury Severity Score
         'INJTYPE='Injury Type '
         DISSTATUS='Discharge Status';
 RUN;
