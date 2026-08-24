%macro allyr(start=10,stop=14);
   data allyear;
      * Include the data from the years of interest;
      * Use years from &start to &stop;
      set
      %do year = &start %to &stop;
            yr&year(in=in&year)
      %end;;
