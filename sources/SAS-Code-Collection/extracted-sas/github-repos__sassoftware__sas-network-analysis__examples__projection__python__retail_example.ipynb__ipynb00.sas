/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/examples/projection/python/retail_example.ipynb (ipynb 0) */

s.fedSql.execDirect(
    query='''
        create table nodesUser {options replace=True}  as;
        select distinct a.from as "node", 0 as "partitionFlag";
        from links as a;
    '''
)
s.fedSql.execDirect(
    query='''
        create table nodesProduct {options replace=True}  as;
        select distinct a.to as "node", 1 as "partitionFlag";
        from links as a;
    '''
)
s.datastep.runCode(
    code='''
        data nodes;
            set nodesUser nodesProduct;
        run;
    '''
