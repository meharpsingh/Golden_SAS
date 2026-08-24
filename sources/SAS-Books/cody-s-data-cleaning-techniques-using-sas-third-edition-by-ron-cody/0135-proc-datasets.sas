proc datasets library=Work nolist;
   modify Survey;
   ic create ID_check = primary key(ID)
      message = "ID must be unique and non-missing"
      msgtype = user;
   ic create TimeTV_max = check(where=(TimeTV le 100))
      message = "TimeTV must not be over 100"
      msgtype = user;
   ic create TimeSleep_max = check(where=(TimeSleep le 100))
      message = "TimeSleep must not be over 100"
      msgtype = user;
   ic create TimeWork_max = check(where=(TimeWork le 100))
      message = "TimeWork must not be over 100"
      msgtype = user;
   ic create TimeOther_max = check(where=(TimeOther le 100))
      message = "TimeOther must not be over 100"
      msgtype = user;
