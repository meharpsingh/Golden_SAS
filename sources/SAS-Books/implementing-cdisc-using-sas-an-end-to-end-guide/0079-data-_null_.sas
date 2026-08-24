    filename ar "&path\analysisresults.txt";
    data _null_;
      set analysisresults;
      ** note that it is required that identical display IDs be adjacent to
      ** each other in the metadata spreadsheet;
      by displayid notsorted;
      file ar notitles;
      if _n_ = 1 then
        put @5 "<!-- **************************************** -->" /
            @5 "<!-- Analysis Results MetaData are Presented Below -->" /
           @5 "<!-- ***************************************** -->"
            ;
      if first.displayid then
        put @5 '<adamref:AnalysisResultDisplays>' /
            @7 '<adamref:ResultDisplay DisplayIdentifier="' displayid +(-1)
               '" OID="' displayid +(-1) '" DisplayLabel="'
displayname +(-1)
               '" leafID="' displayid +(-1) '">'  ;
      put @9 '<adamref:AnalysisResults ' /
          @9 'OID="' arid +(-1) '"' /
          @9 'ResultIdentifier="' resultid +(-1) '"' /
          @9 'Reason="' reason +(-1) '">' /
          @9 '<!-- List the parameters and parameter codes -->' /
          @9 '<adamref:ParameterList>'
          ;
      ** loop through PARAMCD/PARAM sets;
      set = 1;
      do while(scan(paramlist,set,'|') ne '');
        paramset = scan(paramlist,set,'|');
Shostak, Jack, and Holland, Chris. Implementing CDISC Using SAS®: An End-to-End Guide. Copyright © 2012, SAS Institute Inc., Cary,
Appendix D:  %make_define SAS Macro   247
        paramcd  = scan(paramset,1,'/\');
        param    = trim(scan(paramset,2,'/\'));
        put @11 '<adamref:Parameter ParamCD="' paramcd +(-1)
                '" Param="' param +(-1) '"/>' ;
        set = set + 1;
      end;
      put @9 '</adamref:ParameterList>';
      ** loop through the analysis variables;
      set = 1;
      do while(scan(analysisvariables,set,',') ne '');
        analysisvar = scan(analysisvariables,set,',');
        put @11 '<adamref:AnalysisVariable ItemOID="' analysisdataset +(-1)
                '.' analysisvar +(-1) '"/>';
        set = set + 1;
      end;
