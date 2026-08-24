proc reg data=ameshousing;
    model saleprice = gr_liv_area;
run;quit;
