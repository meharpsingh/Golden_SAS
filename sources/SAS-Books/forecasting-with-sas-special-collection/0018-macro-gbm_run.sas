%macro gbm_run;
    /*Protection against problematic _seasonDummy value*/
    %if (not %symexist(_seasonDummy)) %then
        %let _seasonDummy=&vf_timeIDInterval;
    %if "&_seasonDummy" eq "" %then
        %let _seasonDummy = &vf_timeIDInterval;
    %if %sysfunc(INTTEST( &_seasonDummy )) eq 0 %then %do;
        %put Invalid seasonal dummy interval.
             Use &vf_timeIDInterval instead.;
        %let _seasonDummy = &vf_timeIDInterval;
    %end;
    /*Parepare input data with extracted feature used for modeling*/
    %fx_prepare_input(outTblName=fxInData, byVars=&vf_byVars,
                      trendVariable = &_trend,
                      seasonalDummy = &_seasonDummy,
                      seasonalDummyInterval = &_seasonDummyInterval,
                      esmY =FALSE, lagXNumber=&_lagXNumber,
                      lagYNumber=&_lagYNumber,
                      holdoutSampleSize=&_holdoutSampleSize,
                      holdoutSamplePercent=&_holdoutSamplePercent,
                      criteria=RMSE, back=0);
    /*Dependent variable transformation if needed*/
    %let targetVar=gbmTargetVar;
    %let predictVar=P_&targetVar;
    data &vf_libOut.."&vf_tableOutPrefix..fxInData"n /
        SESSREF=&vf_session;
        set &vf_libOut.."&vf_tableOutPrefix..fxInData"n;
        &targetVar = &vf_depVar;
        %if %upcase(&_depTransform) eq LOG %then %do;
          if not missing(&vf_depVar) and &vf_depVar > 0 then
             &targetVar = log(&vf_depVar);
          else call missing(&targetVar);
        %end;
    run;
    /*Train the gradient boosting model*/
    proc gradboost data=&vf_libOut.."&vf_tableOutPrefix..fxInData"n
                   seed=12345;
        id &vf_byVars &vf_timeID;
        partition rolevar=_roleVar(TRAIN="1" VALIDATE="2" TEST="3");
        input &vf_byVars  /level=NOMINAL;
        %if "&vf_indepVars" ne "" %then %do;
          input &vf_indepVars  /level=INTERVAL;
        %end;
        %if %intervalFeatureVarList ne  %then %do;
          input %intervalFeatureVarList /level=INTERVAL;
        %end;
        %if %nominalFeatureVarList ne  %then %do;
          input %nominalFeatureVarList /level=NOMINAL;
        %end;
        target &targetVar / level=interval;
