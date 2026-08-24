proc ds2;
   data;
      declare varchar(100) WholeName;
      method fullname(varchar(50) first, varchar(50) last)
                     returns varchar(100);
         dcl varchar(100) FinalText;
         FinalText=catx(', ',last,first);
         Return FinalText;
      end;
      method run();
         set crs.customer_sample (keep=(GivenName Surname));
         WholeName=fullname(GivenName, Surname);
      end;
   enddata;
   run;
quit;
