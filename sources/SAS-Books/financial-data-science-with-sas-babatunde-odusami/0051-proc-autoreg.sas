ods graphics on;
proc autoreg data= corporate_bonds (where=(date
      model raaap= / archtest=(qlm);         /*
      model raaap= /  archtest=(wl,lk);/*wl-Won
      output out=pred residual=resid   predicte
run;
quit;
