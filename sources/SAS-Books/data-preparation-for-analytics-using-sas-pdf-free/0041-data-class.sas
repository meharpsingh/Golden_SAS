DATA class;
 FORMAT ID 8.;
 SET sashelp.class(KEEP = weight);
 ID = _N_;
 Weight_Shift = Weight-100.03;
 Weight_Ratio = Weight/100.03;
 Weight_CentRatio = (Weight-100.03)/100.03;
RUN;
