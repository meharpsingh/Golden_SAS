/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-network-analysis/applications/health/hetionet/python/hetionet_linkprediction_unsupervised.ipynb (ipynb 3) */

def join_ground_truth(resembles_link_type, fetch_cutoff_weight, min_weight, max_weight):
    s.datastep.runCode(
        code=f"""
            data linksRes;
               set links(where=(type="{resembles_link_type}"));
               if to < from then do;
                  temp=to;
                  to=from;
                  from=temp;
               end;
               drop temp;
            run;
        """
    )
    fetch_cutoff = fetch_cutoff_weight*(max_weight-min_weight)
    s.fedsql.execDirect(
        query=f"""
            create table linksResJoinedR {{options replace=true}} as;
           select a.*, b.weight as "weight", c.name as "fromName", d.name as "toName";
           from linksRes a;
           right join projLinksGrouped b;
           on a.from = b.from and a.to = b.to;
           left join nodes c;
           on b.from = c.node;
           left join nodes d;
           on b.to = d.node
           where b.weight > {fetch_cutoff} /* Subset to manage table size */;
           ;
        """
    )

    link_prediction_tbl = s.CASTable("LINKSRESJOINEDR")
    link_prediction_tbl["hit"] = link_prediction_tbl["type"]!=""
