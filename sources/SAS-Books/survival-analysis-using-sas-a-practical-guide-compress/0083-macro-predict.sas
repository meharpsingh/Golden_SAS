%macro predict (outest=, out=_last_,xbeta=,time=);
data _pred_;
_p_=i;
set &outest (keep=_dist
scale
shapel_ ) point=_p_;
set &out;
lp=&xbeta;
t=&time;
gamma=l/_scale_;
alpha=exp(-lp*gamma);
prob=0;
if _dist_='EXPONENT1 or _dist_='WEIBULL' then prob=exp(-alpha*t**gamma);
if _dist_='LNORMAL' then prob=l-probnorm((log(t)-lp)/_scale_);
if _dist_='LLOGISTC' then prob=l/(l+alpha*t**gamma);
if _dist_='GAMMA1 then do;
d=_shapel_;
k=l/(d*d);
u=(t*exp(-lp))**gamma;
prob=l-probgam(k*u**d,k);
if d It 0 then prob=l-prob;
end;
drop Ip gamma alpha _dist
scale
shapel_ d k u;
run;
proc print data=_pred_;
run;
%mend predict;
