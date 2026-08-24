%macro createBNCdiagram(target=Class, outnetwork=net);
   data outstruct;
        set &outnetwork;
        if strip(upcase(_TYPE_)) eq 'STRUCTURE' then output;
        keep _nodeid_   _childnode_  _parentnode_;
   run;
   data networklink;
       set outstruct;
        linkid = _N_;
        label linkid ="Link ID";
   run;
   proc sql;
      create table work._node1 as
         select distinct  _CHILDNODE_ as  node
         from networklink;
      create table work._node2  as
         select distinct _PARENTNODE_  as node
         from networklink;
   quit;
   proc sql;
      create table work._node as
         select node
         from work._node1
         UNION
         select node
         from work._node2;
   quit;
   data bnc_networknode;
       length NodeType $32.;
       set work._node;
       if strip(upcase(node)) eq strip(upcase("&target")) then do;
         NodeType = "TARGET";
         NodeColor=2;
       end;
       else  do;
         NodeType = "INPUT";
         NodeColor = 1;
       end;
       label NodeType ="Node Type" ;
       label NodeColor ="Node Color" ;
   run;
   data parents(rename=(_parentnode_ = _node_)) children(rename=(_childnode_
= _node_)) links;
       length _parentnode_ _childnode_ $ 32;
       set networklink;
       keep _parentnode_ _childnode_ ;
   run;
