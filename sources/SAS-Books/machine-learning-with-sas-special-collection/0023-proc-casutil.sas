   proc casutil;
      load file="~/data/u.data"    /*or other user-defined location*/
      casout="movlens"
      importoptions=(filetype="CSV" delimiter="TAB" getnames="FALSE"
                   vars=("userid" "itemid" "rating" "timestamp"));
   run;
