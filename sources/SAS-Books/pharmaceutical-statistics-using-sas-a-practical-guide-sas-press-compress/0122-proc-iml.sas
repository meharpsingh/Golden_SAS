proc iml;
use x; read all into x;
use y; read all into y;
use z; read all into z;
use nsub; read all into nsub;
use ntime; read all into ntime;
use initial; read all into initial;
g=j(nsub,1,0);
start integr(yd) global(psi,ecurr,vcurr,lastobs);
...
finish integr;
start loglik(parameters) global(lastobs,vcurr,ecurr,x,z,y,nsub,ntime,nrun,psi);
...
finish loglik;
opt=j(1,11,0);
opt[1]=1;
opt[2]=5;
con={. . . . 0 0 -1 0 .,
. . . . . . 1 . .};
call nlpnrr(rc,est,"loglik",initial,opt,con);
call nlpfdd(maxlik,grad,hessian,"loglik",est);
inf=-hessian;
covar=inv(inf);
var=vecdiag(covar);
stde=sqrt(var);
create result var {est stde}; append;
quit;
