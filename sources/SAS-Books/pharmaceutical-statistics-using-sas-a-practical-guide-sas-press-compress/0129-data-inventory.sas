options ls=70;
data inventory;
input patient time sip @@;
datalines;
1 1
9.5
9 1
7.3 17 1
4.0 25 1 10.1 33 1
4.6
1 2 12.3
9 2
6.1 17 2
3.6 25 2 15.7 33 2
4.3
2 1
3.6 10 1
0.5 18 1
6.6 26 1 10.2 34 1
4.6
2 2
0.4 10 2
1.0 18 2
7.0 26 2 15.2 34 2
4.3
3 1 17.4 11 1
6.0 19 1 13.8 27 1
9.5
3 2
7.4 11 2
3.1 19 2 10.1 27 2
8.2
4 1
3.3 12 1 31.6 20 1
9.8 28 1 19.1
4 2
2.2 12 2 16.6 20 2
8.3 28 2 21.9
5 1 13.4 13 1
0 21 1
4.8 29 1
5.6
5 2
6.0 13 2
2.3 21 2
2.9 29 2 10.6
6 1
4.1 14 1 25.0 22 1
0.9 30 1 10.7
6 2
3.5 14 2 12.2 22 2
0.4 30 2 13.1
7 1
9.9 15 1
3.4 23 1
8.0 31 1
8.6
7 2
9.9 15 2
0.7 23 2
2.8 31 2
6.1
8 1 11.3 16 1
2.8 24 1
2.7 32 1
7.5
8 2 10.6 16 2
1.7 24 2
3.8 32 2
5.2
;
* Intraclass correlation coefficient;
proc sort data=inventory;
by patient time;
proc mixed data=inventory method=type3;
class patient time;
model sip=patient time;
ods output type3=mstat1;
data mstat2;
set mstat1;
dumm=1;
if source='Residual' then do; mserr=ms; dferr=df; end;
if source='patient' then do; mspat=ms; dfpat=df; end;
if source='time' then do; mstime=ms; dftime=df; end;
retain mserr dferr mspat dfpat mstime dftime;
keep mserr dferr mspat dfpat mstime dftime dumm;
data mstat3;
set mstat2;
by dumm;
format icc lower upper 5.3;
if last.dumm;
icc=(mspat-mserr)/(mspat+(dftime*mserr));
fl=(mspat/mserr)/finv(0.975,dfpat,dfpat*dftime);
fu=(mspat/mserr)*finv(0.975,dfpat*dftime,dfpat);
lower=(fl-1)/(fl+dftime);
upper=(fu-1)/(fu+dftime);
