proc iml;
    start standsub(stand,mean,stdv,x);
        n=nrow(x);
        mean=x[:,];            /* means for all columns */
        xbar=repeat(mean,n,1); /* n rows of means */
        x=x-xbar;              /* center x to mean zero */
        stdv=std(x);    /* standard deviations for columns */
       stand=x/stdv;           /* scale to std dev 1 */
     finish;
