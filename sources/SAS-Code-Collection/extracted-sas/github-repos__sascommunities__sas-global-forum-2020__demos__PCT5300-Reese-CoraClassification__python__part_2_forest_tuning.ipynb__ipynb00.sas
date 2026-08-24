/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2020/demos/PCT5300-Reese-CoraClassification/python/part_2_forest_tuning.ipynb (ipynb 0) */

s.datastep.runCode(
    code = f"data contentTestNetwork; set {tableContentPartitionedNetwork}(where=(partition=0)); run;";
)
print(f"contentTestNetwork: (rows, cols) = {s.CASTable('contentTestNetwork').shape}")

s.datastep.runCode(
    code = f"data contentTestPcaNetwork; set {tableContentPartitionedNetworkPca}(where=(partition=0)); run;";
)
print(f"contentTestPcaNetwork: (rows, cols) = {s.CASTable('contentTestPcaNetwork').shape}")
