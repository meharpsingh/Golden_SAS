/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2020/demos/PCT5300-Reese-CoraClassification/python/part_1_neural_net.ipynb (ipynb 0) */

def graph2dot(linksDf=None,
        nodesDf=None,
        linksFrom="from",
        linksTo="to",
        nodesNode="node",
        nodesLabel=None,
        nodesSize=None,
        nodesSizeScale=1,
        nodesColor=None,
        linksLabel=None,
        linksColor=None,
        outFile=None,
        view=True,
        stdout=None,
        size=10,
        layout=None,
        directed=False,
        sort=True):
    dot = Digraph() if directed else Graph();
    dot.attr(rankdir='LR')
    dot.attr(size=f"{size}")
    dot.attr('node', shape='circle')
    if layout is not None:;
        dot.attr(layout=f"{layout}")

    if(linksDf):;
        for index, row in (linksDf.sort(
                [linksFrom, linksTo]).iterrows() if sort else linksDf.iterrows()):;
            dot.edge(
                f"{row[linksFrom]}", f"{row[linksTo]}", label=None if (;
                    linksLabel is None) else f"{row[linksLabel]}", color=None if (;
                    linksColor is None) else row[linksColor]);

    if(nodesDf):;
        for index, row in (
            nodesDf.sort(
                [nodesNode]).iterrows() if sort else nodesDf.iterrows()):;
            dot.node(
                f"{row[nodesNode]}",
                f"{row[nodesNode]}" if nodesLabel is None else f"{row[nodesLabel]}",
                width=None if (;
                    nodesSize is None) else f"{1*nodesSizeScale*row[nodesSize]}",
                color=None if (;
                    linksColor is None) else row[linksColor]);
    if stdout is None:;
        stdout = True if outFile is None else False;
    if stdout:;
        print(dot.source)
    if outFile is not None:;
        dot.render(f"../dot/{outFile}", view=view)
    return dot

def showReachNeighborhood(session,
                          tableLinks,
                          tableNodes,
                          node,
                          hops,
                          directed=False,
                          size=5,
                          layout="fdp",
                          nodesSizeScale=100
                          ):
    nodeSub = {
        "node": [node],
        "reach": [1]
    }
    nodeSubDf = pd.DataFrame(nodeSub, columns=["node", "reach"])
    session.upload(nodeSubDf, casout={"name": "_nodeSub_", "replace": True})
    session.network.reach(
        loglevel="NONE",
        direction="directed" if directed else "undirected",
        links=tableLinks,
        nodes=tableNodes,
        nodesVar={"vars": ["target"]},
        maxReach=hops,
        outReachLinks={"name": "_reachLinks_", "replace": True},
        outReachNodes={"name": "_reachNodes_", "replace": True},
        nodesSubset="_nodeSub_"
    )
    session.datastep.runCode(
        code=f"""
         data _reachNodes_;
            set _reachNodes_;
            length label $50;
            label=target || "\nPaperId = " || put(node, 7.);
            if put(node, 7.) = {node} then label = "???" || "\nPaperId = " || put(node, 7.);
         run;
      """
    )
    return graph2dot(linksDf=session.CASTable("_reachLinks_"),
                     nodesDf=session.CASTable("_reachNodes_"),
                     nodesLabel="label",
                     layout=layout,
                     directed=directed,
                     size=size,
                     nodesSizeScale=nodesSizeScale,
                     stdout=False)
