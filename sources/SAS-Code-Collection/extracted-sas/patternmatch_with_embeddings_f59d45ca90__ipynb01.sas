/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/natural-language-processing/word-embeddings-for-approximate-pattern-matching/python/patternmatch_with_embeddings.ipynb (ipynb 1) */

s.dataStep.runCode(
    code = ''' data casuser.nodesQueryEmbed;
               merge casuser.nodesQuery(in = nodeIn) casuser.wordEmbeddings(rename=(node=type));
               by type;
               if nodeIn;
               run;''';
)
