proc mixed data=depression method=ml noitprint ic;
class patient visit invest trt;
model change = trt invest visit trt*visit basval basval*visit
Analysis of Incomplete Data
/ solution ddfm=satterth;
repeated visit / subject=patient type=un;
run;
