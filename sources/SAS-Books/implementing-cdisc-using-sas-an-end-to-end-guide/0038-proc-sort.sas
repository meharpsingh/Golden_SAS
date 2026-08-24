      proc sort
        data = &sourcelib..&suppdata
        out = supp&domain;
          where rdomain=upcase("&domain");
          by usubjid idvar idvarval;
      run;
