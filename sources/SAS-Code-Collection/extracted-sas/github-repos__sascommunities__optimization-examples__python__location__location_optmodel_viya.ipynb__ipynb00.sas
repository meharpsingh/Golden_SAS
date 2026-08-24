/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__optimization-examples/python/location/location_optmodel_viya.ipynb (ipynb 0) */

# Define the model in OPTMODEL
optmodel_code = """
   /* Define set of sites, only need one set since all sites are also customers */
   set <str> SITES;

   /* Latitude and Longitude for SITES */
   num lat {SITES};
   num lon {SITES};

   /* Capacity of each site */
   num C = 5000000;

   /* Other parameters */
   num demand {SITES};
   num cost {SITES};
   num region {SITES};

   /* Define a set of tuples for all possible assignments */
   set PAIRS = {i in SITES, j in SITES};

   /* Compute distances between sites */
   num distance {<i,j> in PAIRS}
       = round(geodist(lat[i], lon[i], lat[j], lon[j], 'K'));

   /* Read the data */
   read data indata into SITES=[name] lat lon region=state demand=size cost=density;

   /* Create variables */
   var Assign {PAIRS} binary;
   var Build {SITES} binary;

   /* Define objective function */
   min TotalCost
       = sum {<i,j> in PAIRS} distance[i,j] * Assign[i,j]
         + sum {j in SITES} cost[j] * Build[j];

   /* Each site needs to be assigned to exactly once */
   con assign_def {i in SITES}:
      sum {<(i),j> in PAIRS} Assign[i,j] = 1;

   /* Each site we build can handle at most C demand */
   con capacity {j in SITES}:
      sum {<i,(j)> in PAIRS} demand[i] * Assign[i,j] <= C * Build[j];

   /* Solve with the MILP solver */
   solve;

   /* Create output data sets */
   create data assignments from;
        [customer site]={<i,j> in PAIRS: Assign[i,j] > 0.5}
        lat1=lat[i] lon1=lon[i] lat2=lat[j] lon2=lon[j] distance[i,j];
   create data sites from;
        [site]={j in SITES: Build[j] > 0.5}
            name=j lat[j] lon[j] cost[j];
"""
# Submit the model to SAS
sas.loadactionset("optimization")

_ = sas.runOptmodel(optmodel_code)

# Create output data frames to plot the solution;
assignments = sas.CASTable("assignments")
sites = sas.CASTable("sites")
run;
