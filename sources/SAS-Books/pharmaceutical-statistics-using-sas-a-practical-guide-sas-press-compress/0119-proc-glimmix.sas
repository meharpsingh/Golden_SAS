proc glimmix data=depression method=rspl;
class patient visit trt;
model ybin (event='1')=visit trt*visit basval basval*visit/dist=binary solution;
random intercept/subject=patient;
run;
