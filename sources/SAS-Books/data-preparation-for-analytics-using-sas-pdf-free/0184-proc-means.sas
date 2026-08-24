PROC MEANS DATA = leasing NWAY NOPRINT;
 CLASS CustID;
 VAR Value AnnualRate;
 OUTPUT OUT = LeasingSum(DROP = _TYPE_
                         RENAME = (_FREQ_ = NrLeasing))
                        SUM(Value) = LeasingValue
                        SUM(AnnualRate) = LeasingAnnualRate;
RUN;
