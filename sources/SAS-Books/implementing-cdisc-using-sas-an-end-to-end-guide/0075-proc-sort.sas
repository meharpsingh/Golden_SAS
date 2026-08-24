    proc sort
      data = analysisresults;
      by docleafid;
    run;
    proc sort
      data = externallinks (keep = leafid title
                            rename=(leafid=docleafid title=doctitle))
      out  = doc_links;
      by docleafid;
    run;
    data analysisresults;
      merge analysisresults (in = inar) doc_links (in = indoc_links);
      by docleafid;
      if inar;
      ** if the leaf ID exists, then the title of the leaf ID will be printed
      ** and can be removed from DOCUMENTIATION;
      if indoc_links then
        documentation = tranwrd(documentation, '[r]' || trim(docleafid) ||
                        '[\r]', " ");
    run;
    proc sort
      data = analysisresults;
      by arrow;
    run;
  %end;
**** CREATE DEFINE FILE HEADER SECTION;
filename dheader "&path\define_header.txt";
data define_header;
    set define_header;
    file dheader notitles;
       creationdate = compress(put(datetime(), IS8601DT.));
