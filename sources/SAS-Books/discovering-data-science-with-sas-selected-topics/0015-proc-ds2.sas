proc ds2;
   data;
      method run();
         declare double Total Count;
         set crs.one_day (keep=(Payee Amount));
         Total+Amount;
         Count+1;
      end;
