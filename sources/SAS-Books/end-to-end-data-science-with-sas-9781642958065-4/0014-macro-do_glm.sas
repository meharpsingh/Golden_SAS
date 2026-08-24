%macro do_glm;
       %do k=1 %to 42;
PROC GLMSELECT DATA=WORK.TRAIN_FINAL
OUTDESIGN(ADDINPUTVARS)=Work.reg_design
                     PLOTS(stepaxis=normb)=all;
                     MODEL Price_Log=&lasso_var. /
                     selection=lasso(stop=&k choose=SBC);
                     OUTPUT OUT = train_score;
                     SCORE DATA=TEST_FINAL PREDICTED RESIDUAL
                     OUT=test_score;
              run;
       %end;
%mend;
