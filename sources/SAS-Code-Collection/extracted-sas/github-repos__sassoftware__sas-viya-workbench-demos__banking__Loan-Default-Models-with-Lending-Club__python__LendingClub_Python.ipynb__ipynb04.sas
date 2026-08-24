/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-workbench-demos/banking/Loan-Default-Models-with-Lending-Club/python/LendingClub_Python.ipynb (ipynb 4) */

# Random Forest

# Setting our weights and random state for consistent results
model = RandomForestClassifier(
    class_weight='balanced',
    random_state=42
)

# Creating our model pipeline
rf_pipeline = Pipeline([
    ('classifier', model)
])

#Train our model using the training data and training "Status" results;
rf_pipeline.fit(X_train, y_train)

# Accuracy metrics comparing our training and testing data predictions to the actual results of Status;
# Data model was trained on;
train_accuracy = accuracy_score(y_train, rf_pipeline.predict(X_train))
# Unseen data to test model's fit;
test_accuracy = accuracy_score(y_valid, rf_pipeline.predict(X_valid))

from sklearn.metrics import roc_auc_score;
def calculate_gini(y, x):
    auc = roc_auc_score(y, x)
    gini = 2 * auc - 1
    return gini

skrf_train_auc = roc_auc_score(y_train, rf_pipeline.predict_proba(X_train)[:,1])
skrf_test_auc = roc_auc_score(y_valid, rf_pipeline.predict_proba(X_valid)[:,1])

skrf_train_gini = 2 * skrf_train_auc - 1
skrf_test_gini = 2 * skrf_test_auc - 1

# Model Evaluation Metrics
print("Train Accuracy:", train_accuracy)
print("Test Accuracy:", test_accuracy)
print("---")
print("Train GINI:", skrf_train_gini)
print("Test GINI:", skrf_test_gini)
run;
