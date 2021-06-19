# Don't Eat That Mushroom: Using Machine Learning to Classify Mushrooms

## Introduction
The global mushroom market is expected to grow at a Compound Annual Growth Rate (CAGR) of 7.95% to grow to $62.19 billion in 2023 increasing from $42.42 billion in 2018. Edible Mushrooms are fleshy edible fruit bodies which grow above ground and are basically a fungus. Edibility is based on two factors: Absence of poisonous effects on humans and having desired taste. Mushrooms are grown and consumed all around the world, used in food, agriculture and healthcare and pharmaceutical industries. 

## Overview
In this project we have selected the topic of Mushroom Classification. We aim to create a machine learning model which classifies safe to eat mushrooms from poisonous ones. Considering the large mushroom market, we can sell this model to large scale mushroom farmers, wholesale distributors, or simply anyone growing or selling edible mushrooms but needs to ensure that edible mushrooms are separated from poisonous ones. Using machine learning can potentially save large chunks of time spent by mushroom experts in determining which mushrooms are safe and which are poisonous. 

## Data Source
We will use the Mushroom Data Set from the UCI Machine Learning Repository. This data comes from the Audobon Society Field Guide to North American Mushrooms (1981) where mushrooms are described in terms of physical characteristics and are classified as either poisonous or edible. The dataset includes description of hypothetical samples of 23 species of gilled mushrooms in the Agaricus and Lepoita Family with each species identified as either definitely edible, definitely poisonous, or unknown edibility and not recommended. For simplicity, the latter classes were combined with the poisonous ones. There is no simple rule for determining whether a mushroom is edible or not. The dataset has 22 different attributes available which can be used as features in the machine learning model. There are a wide variety of attributes such as ring type, gill color, odor, etc. 

## Technologies Used
We will be using several different technologies for the completion of our analysis

  * ### For Data Cleaning and Analysis
    * Pandas (Python) will be used to clean the data and perform exploratory data analysis (EDA)

  * ### For Database Storage and Connection
    * We will upload our csv data file into a PostgreSQL database. We will create the schema for this file. We will create a database connection using SqlAlchemy (Python) in order to import the data from a PostgreSQL database to a Jupyter Notebook for analysis.  

  * ### For Machine Learning 
    * Scikit-learn (Python) is a machine learning library we will use in order to split the data and preprocess the data. We will use the TensorFlow (Python) library for deep learning capabilities, and to create and run our deep neural network model. 

  * ### For Data Visualization 
    * Seaborn and Matplotlib are Python data visualization packages we will be using in Jupyter Notebook in order to create some initial plots in order to better understand the data. We will also use pandas package to group different variables and use functions such as value count, sum, mean etc. in order to create different subgroups which can then be visualized. After better understanding these patterns we will export our data over to Tableau, a data visualization software that helps allows us to do data storytelling in a more interactive in aesthetically pleasing way. We will export our data to Tableau where we will create a Tableau Story and present the process of Mushroom Classification through visuals. 

  * ### For Presentation
    * We will be using Google Slides, click [here.](https://docs.google.com/presentation/d/1EP28CKPbYbpHLa78xovteIuUX3ddW1zJACCxqsLnej8/edit#slide=id.p)

## Data Exploration and Machine Learning
Before employing the model, we would like to do some data exploration to ask questions such as whether there is imbalance in the target variable in the model or if there is any correlation between the features. We can visualize data with bar charts, scatterplots, and heatmaps to understand relationships between different variables in the dataset. We hope to correctly classify the dataset with the help of a number of different machine learning methods such as Logistic Regression, Support Vector Machines, Neural Networks etc. Where interpretability is possible we plan to measure feature importance to help understand which features are playing the most important role in helping determining whether a mushroom is safe or poisonous. Ideally we can afford to classify some safe mushrooms as poisonous but we have to make sure we do not classify poisonous mushrooms as safe, as poisonous mushrooms can be very dangerous for consumers. Therefore, through the help of data exploration, data visualization and machine learning, we hope to uncover interesting trends, patterns and optimize our classification of mushrooms.

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
  * Logistic Regression (Accuracy: 0.9995) 
  * SVM(Support Vector Machine) (Accuracy: 1.0) 
  * Deep Neural Network (Accuracy: 0.9862) 
  * Random Forest Classifier (Accuracy: 1.0) 

Initially we selected and used Logistic Regression Model, but after evaluating other models, such as Deep Neural Network, Support Vector Machine and Random Forest Classifier, we decided to use Random Forest classifier. We realized that Neural Network might be overfitting the data by overanalyzing and creating unnecessary patterns, one of the reasons the model yields the least accurate score of the four models, Then we decided on the Logistic Regression model, and even though the model did a nearly perfect job of a 0.9995 accuracy, we realized that with a total of 21 features and 111 dummies, it may be better to use a more complex model that might yield an accuracy of 1. Therefore, we finally decided on the Random Forest Classifier that yields an accuracy of 1.

* Benefits 
  * Out of all the models Support Vector Machine and Random Forest yield a perfect accuracy score of 1 with all outcomes classified correctly. We prefer Random Forest over Support Vector Machine because considering the large amount of categorical features we have, Random Forest adds randomness to the model, while growing the trees. Random Forest searches for the best feature within a subset of features, which also reduces overfitting. After deleting unnecessary features, we still end up with 21 features, and since all these features are categorical variable they end becoming a total of 113 dummy variables. Therefore Random Forest has a lot of depth and thus, can help us account for all the 113 dummies we have in our model. 
* Limitation
  * Random Forest has a kind of a black box approach, therefore, we have very little control on what the model does and therefore the model is less customizeable, we can at best only change the parameters or random seeds. Therefore, it is a predictive modeling tool, not a descriptive tool. 
  * Another problem with Random Forest is that a large number of trees can make the algorithm too slow and ineffective for real time predictions. Therefore, if we end up with too many trees our model may slow down and may not perform well. 

### Description and explanation of model’s confusion matrix, including final accuracy score
* Our Random Forest Classifier's Confusion Matrix explains that there were total of 4062 predictions and out of that 1958 were actually 'edible' and also predicted 'edible' while 2104 were 'poisonous' and also predicted as 'poisonous'. Thus, we got a final accuracy score of 1.

## Data Visualization Process
We will use data visualization to show the relationship between all the 23 variables we have in our dataset, with the primary goal of showing the relationship between our features and our outcome (class). Since we have largely unordered categorical variables, our analysis is limited to heatmaps, bar plots and mosaic plots. 

* We first create a bar chart for the class (outcome) variable to understand the categorical distribution and ensure there is no imbalance between the two classes. We find that our outcome categories are roughly equal in count, we do not need to use resampling methods. 
* We find that the veil type feature has one category, since all mushrooms have the same category of veil type, this feature does not contribute to the model and should be dropped
* We create a heatmap to visualize the relationships between all the variables in the model to ensure there is no multicollinearity between the features as well as to understand which features are most correlated to our outcome. We find that population, spore-print-color, ring type, stalk color above ring, gill color, gill size, gill spacing and bruises all have a correlation of greater than 0.3 with class.
* We create barplots for the remaining 21 features and find many empty bins, which show that many categories are unnecessary because they do not have any observations. Some variables are even made up of largely one category with other categories have few or no observations. These visuals allow us to drop unnecessary categories (bins) as well as unnecessary features that are adding noise to our model
* We will change our bins and drop some features and create some updated bar plots to show the results of the changes we have made
* We will visualize our confusion matrix and create a horizontal bar plot for feature importances, showing how our model performed and which were our most important features, ultimately proving how the data visualization process helped our feature selection and improved our model.

## References 

  https://www.researchandmarkets.com/reports/4451952/global-edible-mushrooms-market-industry-trends

  https://www.kaggle.com/uciml/mushroom-classification/code
  
  https://archive.ics.uci.edu/ml/datasets/Mushroom

  
  [Presentation](https://docs.google.com/presentation/d/1EP28CKPbYbpHLa78xovteIuUX3ddW1zJACCxqsLnej8/edit#slide=id.p)
