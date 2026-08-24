/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/hands-on-workshop/Part 2 - Getting Started with SWAT.html (htmlpre 24) */

Help on table.Tableinfo in module swat.cas.actions object:

class table.Tableinfo(CASAction)
 |  Shows information about a table
 |  
 |  Parameters
 |  ----------
 |  name : string or CASTable, optional
 |  
 |  caslib : string, optional
 |      specifies the caslib containing the table that you want to use with
 |      the action. By default, the active caslib is used. Specify a value;
 |      only if you need to access a table from a different caslib.;
 |  
 |  quiet : boolean, optional
 |      when set to True, attempting to show information for a table that;
 |      does not exist returns an OK status and severity. When set to False,
 |      attempting to show information for a table that does not exist
 |      Default: False
 |  
 |  Returns
 |  -------
 |  Tableinfo object
 |  
 |  Method resolution order:
 |      table.Tableinfo
 |      CASAction
 |      swat.cas.utils.params.ParamManager
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __call__(_self_, name=None, caslib=None, quiet=None, **kwargs)
 |      Shows information about a table
 |      
 |      Parameters
 |      ----------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      CASResults object
 |  
 |  __init__(_self_, name=None, caslib=None, quiet=None, **kwargs)
 |      Shows information about a table
 |      
 |      Parameters
 |      ----------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      Tableinfo object
 |  
 |  get_param(_self_, key)
 |      Get the value of an action parameter
 |      
 |      Parameters
 |      ----------
 |      key : string
 |      
 |      Valid Parameters
 |      ----------------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      any
 |  
 |  get_params(_self_, *keys)
 |      Get the value of one or more action parameters
 |      
 |      Parameters
 |      ----------
 |      *keys : one or more strings
 |      
 |      Valid Parameters
 |      ----------------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      dict
 |  
 |  set_param(_self_, *args, **kwargs)
 |      Set one or more action parameters;
 |      
 |      Parameters
 |      ----------
 |      *args : string / any pairs, optional
 |          Parameters can be specified as fully-qualified names (e.g, table.name)
 |          and values as subsequent arguments.  Any number of name / any pairs
 |      **kwargs : any, optional
 |      
 |      Examples
 |      --------
 |      #
 |      # String / any pairs
 |      #
 |      > summ = s.simple.Sumamry()
 |      > summ.set_param('table.name', 'iris',
 |                       'table.singlepass', True,
 |                       'casout.name', 'iris_summary')
 |      > print(summ)
 |      ?.simple.Summary(table={'name': 'iris', 'singlepass': True},
 |                       casout={'name': 'iris_summary'})
 |      
 |      #
 |      # Keywords
 |      #
 |      > summ.set_param(casout=dict(name='iris_out'))
 |      > print(summ)
 |      ?.simple.Summary(table={'name': 'iris', 'singlepass': True},
 |                       casout={'name': 'iris_out'})
 |      
 |      Valid Parameters
 |      ----------------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      None
 |  
 |  set_params(_self_, *args, **kwargs)
 |      Set one or more action parameters;
 |      
 |      Parameters
 |      ----------
 |      *args : string / any pairs, optional
 |          Parameters can be specified as fully-qualified names (e.g, table.name)
 |          and values as subsequent arguments.  Any number of name / any pairs
 |      **kwargs : any, optional
 |      
 |      Examples
 |      --------
 |      #
 |      # String / any pairs
 |      #
 |      > summ = s.simple.Sumamry()
 |      > summ.set_param('table.name', 'iris',
 |                       'table.singlepass', True,
 |                       'casout.name', 'iris_summary')
 |      > print(summ)
 |      ?.simple.Summary(table={'name': 'iris', 'singlepass': True},
 |                       casout={'name': 'iris_summary'})
 |      
 |      #
 |      # Keywords
 |      #
 |      > summ.set_param(casout=dict(name='iris_out'))
 |      > print(summ)
 |      ?.simple.Summary(table={'name': 'iris', 'singlepass': True},
 |                       casout={'name': 'iris_out'})
 |      
 |      Valid Parameters
 |      ----------------
 |      name : string or CASTable, optional
 |      
 |      caslib : string, optional
 |          specifies the caslib containing the table that you want to use with
 |          the action. By default, the active caslib is used. Specify a value;
 |          only if you need to access a table from a different caslib.;
 |      
 |      quiet : boolean, optional
 |          when set to True, attempting to show information for a table that;
 |          does not exist returns an OK status and severity. When set to False,
 |          attempting to show information for a table that does not exist
 |          Default: False
 |      
 |      Returns
 |      -------
 |      None
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes defined here:;
 |  
 |  all_params = {'caslib', 'name', 'quiet'}
 |  
 |  param_names = ['name', 'caslib', 'quiet']
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from CASAction:;
 |  
 |  __iter__(self)
 |      Call the action and iterate over the results
 |  
 |  invoke(self, **kwargs)
 |      Invoke the action
 |      
 |      Parameters
 |      ----------
 |      **kwargs : any, optional
 |          Arbitrary key/value pairs to add to the arguments sent to the
 |          action.  These key/value pairs are not added to the collection
 |          of parameters set on the action object.  They are only used in;
 |      
 |      Returns
 |      -------
 |      self
 |          Returns the CASAction object itself
 |  
 |  retrieve = __call__(self, **kwargs)
 |      Call the action
 |      
 |      Parameters
 |      ----------
 |      **kwargs : any, optional
 |          Arbitrary key/value pairs to add to the arguments sent to the
 |          action.  These key/value pairs are not added to the collection
 |          of parameters set on the action object.  They are only used in;
 |      
 |      Returns
 |      -------
 |      CASResults object
 |          Collection of results from the action call;
 |  
 |  ----------------------------------------------------------------------
 |  Class methods inherited from CASAction:;
 |  
 |  from_reflection(asname, actinfo, connection) from builtins.type;
 |      Construct a CASAction class from reflection information;
 |      
 |      Parameters
 |      ----------
 |      asname : string
 |          The action set name;
 |      actinfo : dict
 |          The reflection information for the action
 |      connection : CAS object
 |          The connection to associate with the CASAction
 |      defaults : dict
 |          Default parameters for the action
 |      
 |      Returns
 |      -------
 |      CASAction class
 |  
 |  get_connection() from builtins.type;
 |      Return the registered connection
 |      
 |      The connection is only held by a weak reference.  If the;
 |      
 |      Raises
 |      ------
 |      SWATError
 |          If the registered connection no longer exists;
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from CASAction:;
 |  
 |  trait_names = None
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from swat.cas.utils.params.ParamManager:;
 |  
 |  __delattr__(self, name)
 |      Delete an attribute
 |  
 |  __enter__(self)
 |  
 |  __exit__(self, type, value, traceback)
 |  
 |  __getattr__(self, name)
 |      Get named attribute
 |  
 |  __repr__(self)
 |  
 |  __setattr__(self, name, value)
 |      Set an attribute;
 |  
 |  __str__(self)
 |  
 |  del_param = del_params(self, *keys)
 |      Delete parameters
 |      
 |      Parameters
 |      ----------
 |      *keys : strings
 |         Names of parameters to delete
 |      
 |      Returns
 |      -------
 |      None
 |  
 |  del_params(self, *keys)
 |      Delete parameters
 |      
 |      Parameters
 |      ----------
 |      *keys : strings
 |         Names of parameters to delete
 |      
 |      Returns
 |      -------
 |      None
 |  
 |  has_param = has_params(self, *keys)
 |      Return a boolean indicating whether or not the parameters exist
 |      
 |      Parameters
 |      ----------
 |      *keys : one or more strings
 |          Names of parameters
 |      
 |      Returns
 |      -------
 |      True or False
 |  
 |  has_params(self, *keys)
 |      Return a boolean indicating whether or not the parameters exist
 |      
 |      Parameters
 |      ----------
 |      *keys : one or more strings
 |          Names of parameters
 |      
 |      Returns
 |      -------
 |      True or False
 |  
 |  to_dict(self)
 |      Return the parameters as a dictionary
 |  
 |  to_json(self, *args, **kwargs)
 |      Convert parameters to JSON
 |      
 |      Parameters
 |      ----------
 |      *args : any, optional
 |          Additional arguments to json.dumps
 |      **kwargs : any, optional
 |          Additional arguments to json.dumps
 |      
 |      Returns
 |      -------
 |      string
 |  
 |  to_params = to_dict(self)
 |      Return the parameters as a dictionary
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from swat.cas.utils.params.ParamManager:;
 |  
 |  __dict__
 |      dictionary for instance variables (if defined);
 |  
 |  __weakref__
 |      list of weak references to the object (if defined);
run;
