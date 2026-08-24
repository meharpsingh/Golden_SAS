       data dpatw;
         set dpat;
         array aps(*) ps_:;
         IPW=1/aps(cohortn);
       run;
       * MIXED with EMPIRICAL option in order to get robust ("sandwich")
         Estimation of error;
