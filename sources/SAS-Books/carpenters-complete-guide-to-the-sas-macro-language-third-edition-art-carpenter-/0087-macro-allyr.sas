%macro allyr(start=10,stop=14);
   data allyear;
      set
      %* The %DO will generate the names;
      %* of the incoming data sets;
      %do year = &start %to &stop;
            yr&year(in=in&year)
      %end;;
