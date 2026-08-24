proc freq data=sp4r.ameshousing;
    tables central_air house_style / plots=freqplot;
run;
