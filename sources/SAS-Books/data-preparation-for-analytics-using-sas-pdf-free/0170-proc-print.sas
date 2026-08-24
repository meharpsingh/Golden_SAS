DATA &lib..compare_&stat;
 MERGE &lib..train_dist_&stat._tp &lib..score_dist_&stat._tp;
 BY variable;
 DIFF = (Score_&stat - Train_&stat);
 IF Train_&stat NOT IN (.,0) THEN
      DIFF_REL = (Score_&stat - Train_&stat)/Train_&stat;
 Alert = (ABS(DIFF_REL) > &alert);
RUN;
TITLE Alertlist for Distribution Change;
TITLE2 Data = &data -- Alertlimit >= &alert;
PROC PRINT DATA = &lib..compare_&stat;
RUN;
TITLE;TITLE2;
%MEND;
