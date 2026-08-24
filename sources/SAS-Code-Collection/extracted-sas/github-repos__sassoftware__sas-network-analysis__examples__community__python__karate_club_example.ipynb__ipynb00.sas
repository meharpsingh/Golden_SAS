/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/examples/community/python/karate_club_example.ipynb (ipynb 0) */

s.dataStep.runCode(
    code = '''data casuser.NodeSetOut_labeled;
              set casuser.NodeSetOut;
              label = put(node, 4.);
              run;''';
)
