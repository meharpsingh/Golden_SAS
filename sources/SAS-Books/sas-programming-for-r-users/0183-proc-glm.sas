proc glm data=ameshousing;
    class heating_qc (ref='Fa'); n
model saleprice = heating_qc / solution; o
run;quit;
