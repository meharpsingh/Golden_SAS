PROC FASTCLUS DATA = NewClusObs
              OUT  = NewClusObs_scored
              SEED = ClusterSeeds
              MAXCLUSTERS=5
              MAXITER = 0;
 VAR age weight oxygen runtime;
RUN;
