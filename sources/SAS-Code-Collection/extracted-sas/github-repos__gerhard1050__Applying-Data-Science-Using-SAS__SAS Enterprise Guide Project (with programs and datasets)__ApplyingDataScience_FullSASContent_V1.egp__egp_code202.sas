/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 202) */

﻿
proc glmselect    data=fcq.fc_mart_red              ;
 class Product_Group LAUNCH_MONTH Model_Name Target_Month FC_Dif_Grp FC_DIF_IND  FC_DIF_GRP_XT / param=effect;
 *model ape_dif =  FC_Dif_Grp|FC_DIF_IND|FC_DIF|FC_DIF_ABS|FC_DIF_REL|FC_DIF_GRP_XT   @1 
                        /     details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
 * model ape_dif =  FC_DIF_ABS FC_DIF_IND FC_DIF_ABS*FC_DIF_IND    @1                        /     details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
 *model ape_dif =  FC_DIF    @1                        /     details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
 *model ape_dif =  FC_DIF_ABS|FC_DIF_IND @2 
                        /   noint   details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
                        /     details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
                        /     details=steps selection=stepwise (select=adjrsq) orderselect showpvalues;
ods output ParameterEstimates=GLM_ParameterEst;
            ClassLevelInfo = ClassLevels;

run;
