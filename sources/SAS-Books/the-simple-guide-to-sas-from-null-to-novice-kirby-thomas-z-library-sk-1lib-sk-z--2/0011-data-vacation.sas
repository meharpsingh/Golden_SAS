      data Vacation;
           Vacation_Fund=0;
           do Deposit=1 to 12;
                 Vacation_Fund=Vacation_Fund+175;
           end;
           format Vacation_Fund dollar10.;
      run;
