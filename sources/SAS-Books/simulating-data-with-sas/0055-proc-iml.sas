proc iml;
call randseed(123);
x = j(&NumSamples,&N);
/* many samples (rows), each of size N */
/* "long" format: first generate data IN ROWS... */
call randgen(x, "Uniform");
/* 1. Simulate data (all samples) */
ID = repeat( T(1:&NumSamples), 1, &N); /* {1
1 ...
1,
2 ...
2,
... ... ... ...
100 100 ... 100} */
/* ...then convert to long vectors and write to SAS data set */
SampleID = shape(ID, 0, 1);
/* 1 col, as many rows as necessary */
z = shape(x, 0, 1);
create Long var{SampleID z}; append; close Long;
