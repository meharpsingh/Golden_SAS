proc casutil;
load file="&datalocation/Tiny-Yolov2.sashdat"
casout="Tiny-Yolov2"
importoptions=(filetype="hdat")
replace;
quit;
