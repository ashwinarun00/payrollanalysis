# City Payroll Analysis
Exploratory data analysis and ML model on city payroll dataset.

### About the Dataset
This dataset is sourced from Kaggle and it contains the salary information of all civil or city employees in Los Angeles in the period of 2013-2016. It contains payroll information about every employee title in Los Angeles city departments. The database includes their entitled salary, monthly (or quarterly) payments, annual bonuses, various types of benefits and compensation amounts. 

Dataset Link:
https://www.kaggle.com/cityofLA/city-payroll-data

### Objectives:
* * * 
1.To identify the civil job or department that has positions offering below median salary. i.e. Insufficient salary 

2.To plot/illustrate the variance of salary between the lowest and highest level of every department.

3.To outline the benefit provisions offered by various departments.

4.To derive a relationship between final quarterly payment and base pay of a particular department and predict the base pay of its employees.
* * *

### Plan of Action:
First cleaning of dataset is performed. THis includes various operations such as conversion of values from string to numeric, removal of extra spaces, data imputation etc.
This is performed in the file prep.R
The next phase consists of exploratory data analysis followed by data visualisation. This summarises the key features and provides an overall view of the data.

Final phase includes the model building part and prediciton of values. This is provided in pred.R.

