# Don't Eat That Mushroom: Using Machine Learning to Classify Mushrooms

## Introduction
The global mushroom market is expected to grow at a Compound Annual Growth Rate (CAGR) of 7.95% to grow to 62.193 billion dollars in 2023 increasing from 42.419 billion in 2018. Edible Mushrooms are fleshy edible fruit bodies which grow above ground and are basically a fungus. Edibility is based on two factors: Absence of poisonous effects on humans and having desired taste. Mushrooms are grown and consumed all around the world, used in food, agriculture and healthcare and pharmaceutical industries. Therefore, in this project we have selected the topic of Mushroom Classification. We aim to create a machine learning model which classifies safe to eat mushrooms from poisonous ones. Considering the large mushroom market, we can sell this model to large scale mushroom farmers, wholesale distributors, or simply anyone growing or selling edible mushrooms but needs to ensure that edible mushrooms are separated from poisnonous ones. Using machine learning can potentially save large chunks of time spent by mushroom experts in determining which mushrooms are safe and which are poisonous. 

## Data Source
We will use the Mushroom Data Set from the UCI Machine Learning Repository.This data comes from the Audobon Society Field Guide to North American Mushrooms (1981) where mushrooms are described in terms of physical characteristics, and are classified as either poisonous or edible. The dataset includes description of hypothetical samples of 23 species of gilled mushrooms in the Agaricus and Lepoita Family with each species identified as either definitely edible, definitely posinous or unknown edibility and not recommended. For simplicity the latter classes were combined with the poisonous ones. There is no simple rule for determining whether a mushroom is edible or not. The dataset has 22 different attributes available which can be used as features in the machine learning model. There are a wide variety of attributes such as ring type, gill color, odor etc. 

## Data Exploration, Machine Learning and Visualization
Before employing the model, we would like to do some data exploration to ask questions such as whether there is imbalance in the target variable in the model or if there is any correlation between the features. We can visualize data with bar charts, scatterplots, and heatmaps to understand relationships between different variables in the dataset. We hope to correctly classify the dataset with a help of a number of different machine learning methods such as Logistic Regression, Support Vector Machines, Neural Networks etc. Where interpretability is possible we plan to measure feature importance to help understand which features are playing the most important role in helping determining whether a mushroom is safe or poisonous. Ideally we can afford to classify some safe mushrooms as poisonous but we have to make sure we do not classify posinous mushrooms as safe, as poisonous mushrooms can be very dangerous for consumers. Therefore, through the help of data exploration, data visualization and machine learning, we hope to uncover interesting trends, patterns and optimize our classification of mushrooms. 

## Communication Protocols

Team members will communicate through Slack and Zoom meetings:
* On a daily basis, Slack will be used to convey any information and useful links for the project
* Alternate day, Zoom meetings will be scheduled to discuss the status of project by each team member and clarify the doubts if any

As per the protocols, the team members followed the following:
* The first meeting was a Zoom session in which the team members were introduced to each other and then discussed about the requirements of the project.
* The process of finalizing the project needs a lot of search and then shortlisting the topics and then arriving at a consensus for a topic. Every team member
  played their part of searching the topics and conveyed the shorlisted links through Slack in a common group. The topics were crosschecked and then 'Mushrooms' 
  topic was finalized.
* As per the roles each team member worked and daily conveyed the information through Slack and discussed the status of the project as well as clarified each 
  others' doubts over Zoom meetings whenever required.

  ### References 

  https://www.researchandmarkets.com/reports/4451952/global-edible-mushrooms-market-industry-trends

  https://www.kaggle.com/uciml/mushroom-classification/code
  
  https://archive.ics.uci.edu/ml/datasets/Mushroom


### Preliminary Data Preprocessing

Data preprocessing is a data mining technique that involves transforming raw data into an understandable format (Wikipedia definition)
The following steps were carried out under Data Preprocessing:
* Examining the data for null values, missing values, checking datatypes and setting it as required
* New column 'mushroom_id' is created to give unique identification to each row
* Rows are checked for null values and dropped
* Checking for the unique values of each feature and plotting them which helps in visualizing the features
* Column 'veil_type' shows no variations, hence dropped
* In column 'stalk_root', out of 8124 rows, 2480 rows have missing values and hence dropped
* The data was denoted by just a character, so it was changed to meaningful understandable words


### Preliminary Feature Engineering 
Feature engineering is the process of transforming raw data into features that better represent the underlying problem to the predictive models, resulting in improved model accuracy on unseen data (as on https://medium.com/mindorks/what-is-feature-engineering-for-machine-learning-d8ba3158d97a)

* After dropping the mushroom_id column we are encoding all categorical columns to dummy variables (features). Here we are getting 113 columns out of 21 columns 

### Preliminary Feature Selection, including their decision-making process 

* All the columns except mushroom_id, class_edible and class_poisonous, are selected as features responsible for the target
* The visualizations of each feature and its unique values helped in deciding for which feature to be selected
* Depending on the encoded values of feature and the applied model, we will get the results
 
### Description of how data was split into training and testing sets 
* First the original dataset was split into input(X) and output(y) columns
* Next, the train_test_split function was called, passing both I/O arrays and have them split appropriately into train and test subsets
* Here we have used stratified train-test split which ensures same proportions of examples in each class. This is achieved by setting the 'stratify' argument to the y component of the original dataset

### Explanation of model choice, including limitations and benefits
* For Mushroom classification we have tried four models:
  * Logistic Regression
  * SVM(Support Vector Machine)
  * Deep Neural Network
  * Random Forest Classifier 

* Out of these four models we will be using Logistic Regression for the stated benefits
  * As our dataset is moderate, this model is easier to implement, interpret, and very efficient to train. Since Logistic Regression comes with a fast, resource friendly algorithm it scales efficiently
* Limitation
  * Logistic Regression is still prone to overfitting, although less likely than some other models. To avoid overfitting, a larger training data and regularization can be introduced
  * Logistic Regression cannot handle missing data, this means extra work has to be done on data regarding processing missing values as we removed the 'stalk_root' column because one fourth of the column values were missing