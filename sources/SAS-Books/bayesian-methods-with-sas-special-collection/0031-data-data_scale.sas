data data_scale;
 set model_scale;
 Lambda_11=exp(LSM_11);
 Lambda_12=exp(LSM_12);
 Lambda_21=exp(LSM_21);
 Lambda_22=exp(LSM_22);
 Method_Diff_Ratio=exp(Method_Main_Effect);
 Mix_Diff_Ratio=exp(Mix_Main_Effect);
