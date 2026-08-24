data mc;
merge b2iv se2iv ftest b2liml se2liml b2f1 b2f4;
by sample;
tc = tinv(.975,100-2);
