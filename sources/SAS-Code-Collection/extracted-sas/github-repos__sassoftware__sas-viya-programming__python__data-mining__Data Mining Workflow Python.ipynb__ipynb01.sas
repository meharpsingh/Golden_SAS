/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/python/data-mining/Data Mining Workflow Python.ipynb (ipynb 1) */

def score_model(model):
    score = dict(
        table      = indata,
        modelTable = model + '_model',
        copyVars   = [target, '_partind_'],
        casOut     = dict(name = '_scored_' + model, replace = True)
    )
    return score

### Decision Tree
s.decisionTree.dtreeScore(**score_model('dt'))

### Gradient Boosting
s.decisionTree.gbtreeScore(**score_model('gbt'))

### Neural Network
s.neuralNet.annScore(**score_model('nn'))

### Support Vector Machine
castbl.astore.score(rstore = 'svm_model', out = dict(name = '_scored_svm', replace = True))

### Create standardized prediction column
for i in range(len(models)-1):
    s.dataStep.runCode('''
        data _scored_''' + list(models)[i] + '''; 
            set _scored_''' + list(models)[i] + ''';
            if _''' + list(models)[i] + '''_predname_ = 1;
                then p_''' + target + '''1 = _''' + list(models)[i] + '''_predp_; 
                else p_''' + target + '''1 = 1 - _''' + list(models)[i] + '''_predp_;
        run;
    ''')
