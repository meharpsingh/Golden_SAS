/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/health/hetionet/python/hetionet_linkprediction_unsupervised.ipynb (ipynb 0) */

s.datastep.runCode(
    code="""
        data linksTrain;
        set links;
        if type ne "DrD" and type ne "CrC";
        run;
    """
