proc seqdesign boundaryscale=stdz plots=all;
   rhodesignforcan1: design nstages=4 method=errfuncpow(rho=0.3) alt=upper
   stop=reject alpha=0.025 beta=0.1;
   rhodesignforcan2: design nstages=4 method=errfuncpow(rho=0.9) alt=upper
   stop=reject alpha=0.025 beta=0.1;
   rhodesignforcan3: design nstages=4 method=errfuncpow(rho=1.5) alt=upper
   stop=reject alpha=0.025 beta=0.1;
   samplesize model=twosamplesurvival (nullmedsurvtime=6 medsurvtime=8.25
   acctime=12 totaltime=24);
run;
