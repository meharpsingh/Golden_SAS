    %let _wrd=1;
    %if &DOMAINS^= %then
      %do %while(%scan(&domains,&_wrd)^= );
          %let domain=%scan(&domains,&_wrd);
          %domainx(domain=&domain,suppqual=0);
          %let _wrd=%eval(&_wrd+1);
      %end;
    %else
      %do;
          %** find all of the SUPPxx datasets and loop through each one;
          ods output members=members;
          proc contents
            data = &sourcelib.._all_ memtype=data nods ;
          run;
         data members;
            set members;
             if upcase(name)=:'SUPP' and upcase(name)^=:'SUPPQUAL' then
                      do;
                      rdomain = substr(name,5,2);
                      put name= rdomain= ;
