DATA chk;
       pos_1 = FIND ("Data Science","nce");
       pos_2 = FIND ("Data Science","sci");
       pos_3 = FIND ("Data Science","sci","i");
       pos_4 = FIND ("Data Science","ata",42);
RUN;
PROC PRINT DATA = chk;
RUN;
