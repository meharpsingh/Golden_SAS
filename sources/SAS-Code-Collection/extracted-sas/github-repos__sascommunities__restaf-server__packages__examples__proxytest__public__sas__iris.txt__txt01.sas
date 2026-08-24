/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__restaf-server/packages/examples/proxytest/public/sas/iris.txt (txt 1) */

data work.iris;
input Sepal Length   Sepal Width   Petal Length   Petal Width   Species   Index;
;
datalines;  
5.1,3.5,1.4,0.2,setosa,1
4.9,3.0,1.4,0.2,setosa,2
4.7,3.2,1.3,0.2,setosa,3
4.6,3.1,1.5,0.2,setosa,4
5.0,3.6,1.4,0.2,setosa,5
run;
