data operate;
input hospital trt $ severity $ wt @@;
datalines;
1 v+d none 23
1 v+d slight
1 v+d moderate 2
1 v+a none 23
1 v+a slight 10
1 v+a moderate 5
1 v+h none 20
1 v+h slight 13
1 v+h moderate 5
1 gre none 24
1 gre slight 10
1 gre moderate 6
2 v+d none 18
2 v+d slight
2 v+d moderate 1
2 v+a none 18
2 v+a slight
2 v+a moderate 2
2 v+h none 13
2 v+h slight 13
2 v+h moderate 2
2 gre none
2 gre slight 15
2 gre moderate 2
3 v+d none
3 v+d slight
3 v+d moderate 3
3 v+a none 12
3 v+a slight
3 v+a moderate 4
3 v+h none 11
3 v+h slight
3 v+h moderate 2
3 gre none
3 gre slight
3 gre moderate 4
4 v+d none 12
4 v+d slight
4 v+d moderate 1
4 v+a none 15
4 v+a slight
4 v+a moderate 2
4 v+h none 14
4 v+h slight
4 v+h moderate 3
4 gre none 13
4 gre slight
4 gre moderate 4
;
