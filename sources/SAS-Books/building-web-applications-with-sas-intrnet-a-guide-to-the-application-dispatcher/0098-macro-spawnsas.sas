%macro spawnSAS
    (program=,
     log=,
     MPConnect=
    );
 %local sasexe;
 %let sasexe = %sysget(sasroot)\sas.exe; n
 options noxwait noxsync;
 %if %length(&MPConnect) = 0 %then Y
 %do;  /* use systask to start a new SAS session */
    %if %length(&log) = 0 %then %let log = -nolog;
    %else %let log =  -altlog ""&log"";
    systask command """&sasexe"" ""&program"" -rsasuser -noterminal
&log";
 %end; /* use systask to start a new SAS session */
 %else                                  Z
 %do;  /* use MP Connect to start a new SAS session */
    options autosignon = yes;
    filename rsubcode catalog "&_tmpcat..mpconnect.source"; q
    filename code2Run "&program";
    data _null_;
     infile code2Run
            truncover end=lr;
     file rsubcode;
     if _n_ = 1 then
        put 'rsubmit '\
            "%scan(%sysfunc(pathname(save)),-1,/\)"
            ' sascmd = "'
            %if %substr(&sysver,1,1) = 8 %then '""';
            "&sasexe"
            %if %substr(&sysver,1,1) = 8 %then '""';
            '" log = purge output = purge wait = no;';
     input;
     put _infile_; s
     if lr then put 'endrsubmit;'; t
    run;
    %include rsubcode; u
 %end; /* use MP Connect to start a new SAS session */
%mend spawnSAS;
