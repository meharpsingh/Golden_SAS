proc fcmp outlib=work.functions.Marketing;
  function AGE(BirthDate, ActualDate);
  return(intck('year', BirthDate, ActualDate)
       -(put(BirthDate, mmddyy4.) gt put(ActualDate, mmddyy4.))
       +(put(BirthDate, mmddyy4.)||put(ActualDate, mmddyy4.)||
       put(ActualDate + 1, mmddyy4.)='022902280301')
        );
  endsub;
run;
quit;
