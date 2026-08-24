data from that object.
In [83]: iris = conn.CASTable('data.iris',
caslib='casuser',
   ....:                      where='''sepal_length > 6.8
and
   ....:                               species =
"virginica"''',
   ....:                      computedvars=
['length_factor'],
   ....:                      computedvarsprogram='''length_f
=
   ....:                             sepal_length *
petal_length;''')
In [84]: iris
Out[84]: CASTable('data.iris', caslib='casuser',
                  where='sepal_length > 6.8 and
                         species = "virginica"',
                  computedvars=['length_factor'],
                  computedvarsprogram='length_factor =
                          sepal_length * petal_length;')
run;
