/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-howto-tutorials/sastopython/Visualizing COVID in the US.ipynb (ipynb 2) */

def make_state_summary(df: pd.DataFrame) -> pd.DataFrame:
    """
    Function to process the initial data in two ways:;
    1) Filter down the columns to the important ones, dropping
    2) Each state is broken down into counties in the NYT data set,
       but we want state level information. We sum across the counties
    Overall, this function is comparable to a "proc freq";
    """
    
    # filter out unnecessary information. Think of a SAS 'keep' statement.;
    df = df.filter(['Date', 'State','Cases','Deaths', 'StateCode'])
    
    # sums up the data by 'Date', 'State, 'Statecode',
    # - this returns state-level 'cases' and 'deaths'
    short = df.groupby(['Date', 'State', 'StateCode'],
                        as_index=False).sum()
    return short
