data class;
 set sashelp.class;
      if age <= 13 then age_class = 1;
 else if age <= 14 then age_class = 2;
 else                   age_class = 3;
 label age    = "Age (years)"
       height = "Height (inch)"
       weight = "Weight (pound)"
 ;
 rename sex    = gender
        name   = firstname
 ;
run;
