/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-data-science-blog/multi-stage-computer-vision/SAS CODE 4.txt (txt 1) */

proc cas;
image.extractDetectedObjects /
	casOut={name='ObjectsExtracted', replace=true}
	coordType='YOLO'
	maxObjects=1
  	extractType='crop' 
quit;
