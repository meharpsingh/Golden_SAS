/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2020/demos/PCT5300-Reese-CoraClassification/python/part_1_neural_net.ipynb (ipynb 2) */

def performPca(nPca):
    nPca = nPca
    s.pca.eig(
        table="contentTrain",
        n=nPca,
        prefix="pca",
        inputs=baseFeatureList,
        code={
            "casOut": {"name": "pcaTransformCode", "replace": True},
            "comment": False,
            "tabForm": True
        },
        output={"casOut": {"name": "contentTrainPca", "replace": True},
                "copyVars": ["node", "target", "partition"],
                "score": "pca"}
    )
    s.datastep.runCodeTable(
        table="contentPartitioned",
        codeTable="pcaTransformCode",
        casout={"name": "contentPartitionedPca"},
        dropVars=baseFeatureList
    )
