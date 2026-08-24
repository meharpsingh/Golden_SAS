proc glm data=ameshousing;
    ...
    means heating_qc / hovtest=bf;
run;quit;
