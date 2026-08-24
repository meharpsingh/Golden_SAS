      %macro pairwisefactMac(
         inputVarList=,
         target=,
         dataset=,
         partitionFraction=.7,
         maxIter=100,
         nFactors=25,
         learnStep=0.10,
         configFile=
      );
      %let nInputs = %sysfunc(countw(&inputVarList.));
      %put nInputs = &nInputs.;
      %let k = 2; /*k=2 requests pairs*/
      %let nCombo = %sysfunc(comb(&nInputs.,&k.));
      %put nCombo = &nCombo.;
      %let listQuoted = ;
    *identify each pair inputs;
      data pairs (keep=pairs);
            length pairs $65.;
            array V{&nInputs.} $32 (
                /*quote each input*/
                        %do i = 1 %to &nInputs.;
                              %let currentVar = %scan(&inputVarList.,&i.);
                              "&currentVar."
                        %end;
               );
                     do j=1 to &nCombo.;
                         call allcomb(j,&k.,of V[*]);
                         do i = 1 to &k.;
                            if i=1 then
                            do;
                                          pairs="";
                                counter=0;
                            end;
                            counter=counter+1;
                            pairs=cat(compress(pairs),' ',compress(V[i]));
                            if counter=&k. then output;
                         end;
                    end;
      run;
      *save pairs as macro variables;
      data _null_;
            set pairs end = eof;
          call symput ('pair'||strip(_n_),pairs);
      run;
      *call proc factmac, looping over the pairs;
     libname mycaslib sasioca ;
      data mycaslib.train mycaslib.valid;
            set &dataset.;
            if ranuni(0) le &partitionFraction. then output mycaslib.train;
                  else output mycaslib.valid;
      run;
      %do i = 1 %to &nCombo.;
            proc factmac data=mycaslib.train
                   maxiter=&maxIter.
                  nfactors=&nFactors.
                  learnstep=&learnStep.;
                  input &&pair&i. /level=nominal;
                  target &target. /level=interval;
                  output out=mycaslib.ScoreTrain&i. copyvar = (&target.);
                  savestate rstore=mycaslib.astore&i.;
            run;
            proc astore;
            score data = mycaslib.valid
            out=mycaslib.ScoreValid&i copyvar = (&target.)
                  rstore = mycaslib.astore&i.;
            run;
      %end;
      data mycaslib.ScoreTrain;
            merge
            %do i = 1 %to &nCombo.;
