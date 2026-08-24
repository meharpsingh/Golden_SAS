/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/solar_eclipse/python/solar_eclipse.ipynb (ipynb 1) */

df = cities_inside_gdf[['node']].copy()
df['source'] = 1
df['sink'] = 1

s.upload(df, casout={'name':'node_subset', 'replace':True})

# all pairs shortest path, but link between nodes only if less than an hour of travel time between them;
res = s.network.shortestPath(
    graph          = gid,
    maxPathWeight  = 3600,
    nodesSubset    = {'name': 'node_subset'},
    outWeights     = {'name':'outPathWeights', 'replace':True},
)

res = s.datastep.runCode(
    code="""
