/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-workbench-demos/banking/Loan-Default-Models-with-Lending-Club/python/LendingClub_Python.ipynb (ipynb 5) */

# Gradient Boosting

# Set the parameters needed for our gradient boosting model;
model = GradientBoostingClassifier(
    random_state=42
)

# Creating our model pipeline
gb_pipeline = Pipeline([
    ('classifier', model)
])

#Train our model using the training data and training "Status" results;
gb_pipeline.fit(X_train, y_train)

# Accuracy metrics comparing our training and testing data predictions to the actual results of Status;
# Data model was trained on;
train_accuracy = accuracy_score(y_train, gb_pipeline.predict(X_train))
# Unseen data to test model's fit;
test_accuracy = accuracy_score(y_valid, gb_pipeline.predict(X_valid))

skgb_train_auc = roc_auc_score(y_train, gb_pipeline.predict_proba(X_train)[:,1])
skgb_test_auc = roc_auc_score(y_valid, gb_pipeline.predict_proba(X_valid)[:,1])

skgb_train_gini = 2 * skgb_train_auc - 1
skgb_test_gini = 2 * skgb_test_auc - 1

# Model Evaluation Metrics
print("Train Accuracy:", train_accuracy)
print("Test Accuracy:", test_accuracy)
print("---")
print("Train GINI:", skgb_train_gini)
print("Test GINI:", skgb_test_gini)
run;
