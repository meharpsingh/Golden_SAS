%macro ITRabcLin_predict(
  dat=,        /* input dataset with test data*/
  X=,        /*list of covariates: the same names and order as was used for
    training*/
  betas=ITRabcLin_train_betas, /*betas dataset created by training*/
  out=ITRabcLin_predict_out,   /*output dataset with estimated optimal treatment*/
  D=est_opt_trt                       /*name of estimated optimal treatment variable to be
added on &out*/
  );
  proc iml;
    use &dat;
    read all var {&X} into x;
    close &dat;
    use &betas;
    read all var {betas} into betas;
    close &betas;
* the below 3 modules are the same as for ITRabcLin_train;
    *##############################################################;
    start XI_gen(dum) global(k);
        XI = J(k-1,k,0);
        XI[,1]=repeat((k-1)##(-1/2),k-1,1);
        do ii=2 to k;
            XI[,ii]=repeat( -(1+sqrt(k))/((k-1)##(1.5)), k-1,1);
            XI[ii-1,ii]=XI[ii-1,ii]+sqrt(k/(k-1));
        end;
        return(XI);
    finish;
    *##############################################################;
    start pred(f);
        y=min(loc(f=max(f)));
        return(y);
    finish;
    *##############################################################;
    start pred_vertex_MLUM(x_test, t) global(np,k);
        XI=XI_gen(.);
        beta=J(np,k-1,0);
        beta0=repeat(0,1,k-1);
        do ii=1 to (k-1);
            beta[,ii]=t[ ((np+1)#ii-np) : ((np+1)#ii-1) ];
            beta0[ii]=t[ii#(np+1)];
        end;
        f_matrix = t(t(x_test * beta)+t(beta0));
        nr=nrow(x_test);
        inner_matrix=J(nr,k, 0);
        do ii=1 to k;
            inner_matrix[,ii] = (t(t(f_matrix)#XI[,ii]))[,+];
        end;
        z=j(1,nr,.);
        do ii=1 to nr;
          z[ii]=pred(inner_matrix[ii,]);
        end;
        return(z);
    finish;
    *##############################################################;
    *** main code;
    k=nrow(betas)/(ncol(x)+1)+1; * # trt.arms;
    np = ncol(x); * #baseline Xs;
    * predict opt.trt.;
    betas=t(betas);
    opt=pred_vertex_MLUM(x, betas);
    * store opt.trt;
    &D=opt;
    create &out var {&D};
    append;
    close &out;
  quit;
  data &out;
    merge &dat &out;
  run;
%mend ITRabcLin_predict;
