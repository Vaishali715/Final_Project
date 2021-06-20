# Don't Eat That Mushroom: Using Machine Learning to Classify Mushrooms

## Introduction
The global mushroom market is expected to grow at a Compound Annual Growth Rate (CAGR) of 7.95% to grow to $62.19 billion in 2023 increasing from $42.42 billion in 2018. Edible Mushrooms are fleshy edible fruit bodies which grow above ground and are basically a fungus. Edibility is based on two factors: Absence of poisonous effects on humans and having desired taste. Mushrooms are grown and consumed all around the world, used in food, agriculture and healthcare and pharmaceutical industries. 

## Overview
In this project we have selected the topic of Mushroom Classification. We aim to create a machine learning model which classifies safe to eat mushrooms from poisonous ones. Considering the large mushroom market, we can sell this model to large scale mushroom farmers, wholesale distributors, or simply anyone growing or selling edible mushrooms but needs to ensure that edible mushrooms are separated from poisonous ones. In recent years, there has also been rise in popularity of mushroom farming or "shrooming" which also further reinforces the need that allows farmers to be able to classify a poisonous mushroom from edible ones. Using machine learning can potentially save large chunks of time spent by mushroom experts in determining which mushrooms are safe and which are poisonous. 

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

## Data Storage
For our project, we are dealing with structured data with columns and rows. Therefore we would use a SQL databases such as MySQL Workbench, Postgres, Microsoft SQL etc. For our Data Storage we completed the following steps: 
* Uploaded our raw CSV file into a Postgres Relational Database
* Created a PostgreSQL database connection using Python in Jupyter Notebook to upload and analyze the data
* Performed any data cleaning/preprocessing on raw file, then exported the cleaned dataset to our database
* Resulted in a total of two tables in our database:
       1. Raw data
       2. Cleaned data


## Data Exploration 
Before employing the model, we would like to do some data exploration to ask questions such as whether there is imbalance in the target variable in the model or if there is any correlation between the features and our outcome variable. We can visualize data with bar charts and heatmaps to understand relationships between different variables in the dataset and we use these visualization to help aid our process. 

### Graphical Univariate Analysis 
In order to understand the categorical distribution of both our features and our outcome we create bar charts for all our features. Since all our features are categorical, we cannot use scatterplots, boxplots and other visualizations used for continuous data. Therefore, our visualizations are limited to bar charts and heatmaps. We plot these charts in order to gain some initial insights regarding the data. 

#### Bar Chart: Outcome Variable
![This is a alt text.](/Images/Class_Distribution.png)

After plotting our outcome variable, we see that value counts of both edible and poisonous mushrooms are roughly similar. This plot is important as it shows a healthy distribution and no imbalance in the categorical distribution, and that’s why there is no need of any resampling methods (Oversampling, Undersampling, Combination Sampling)

#### Bar Chart: Features 
For all feature bar charts please refer to: 
https://github.com/Vaishali715/Final_Project/tree/main/Images

![This is a alt text.](/Images/Dropped_variable.png)
![This is a alt text.](/Images/stalk_root.png)

After analyzing the bar charts for all 22 features, we find anamolies in two of these features. In the veil type feature, we find that veil type count plot has only one category. If all mushroom samples, both poisonous and edible, have only one category of veil type, this feature will have no effect on. In the stalk root feature, we can see around 2500 counts of missing values, which may create an adverse effect on the outcome of model, therefore we dropped this category as well from our dataset. 

### Heatmap 
We used label encoder to encode our unique values of each categorical feature into numeric values. After this conversion we created a heatmap to understand the correlation between different features. 

![This is a alt text.](/Images/heatmap_g.png)

In order to visualize, and understand, the correlations between our variables, we used a heatmap. Heatmap helps us understand which features are most correlated amongst each other as well as our outcome variable.
It also allows us to understand relationships between all of the variables in our data. The stronger any given variable is correlated to class, the more likely the variable is to be important to the outcome of the model. Out of 21 features, 8 features are the most correlated to the target feature. In our heatmap, our most correlated features to our outcome (class) include Population, Spore Print Color, Ring Type, Stalk Color Above Ring, Gill Color, Gill Size, Gill Spacing and Bruises, all of which have a correlation of greater than 0.3.  

### Data Preprocessing 
Data preprocessing is a data mining technique that involves transforming raw data into an understandable format. 
The following steps were carried out under Data Preprocessing:
* Examining the data for null values, missing values, checking datatypes and setting it as required
* New column 'mushroom_id' is created to give unique identification to each row
* Rows are checked for null values and dropped
* Checking for the unique values of each feature and plotting them which helps in visualizing the features
* The data was denoted by just a character, so it was changed to meaningful understandable words

## Feature Engineering 
Feature engineering is the process of transforming raw data into features that better represent the underlying problem to the predictive models, resulting in improved model accuracy on unseen data. 

For feature engineering, after dropping the mushroom_id column we are encoding all categorical columns using the label encoder which results in all variables getting unique values based on the number of categories. For example if cap surface has 6 unique types (convex, bell, sunken, flat, knobbed, conical), each of these types will be converted into a numerical format and given a value between 0 and 5, a value for each type. This is because our machine learning model does not understand letters but only understands numbers so by converting our letters into numerical values we can read our data into the machine learning model. We end up with 21 columns, 1 which presents our outcome variable, Poisonous (0) and Edible (1), and remaining 20 columns for our features. 


### Preliminary Feature Selection, including their decision-making process 
* All the columns except mushroom_id, class_edible and class_poisonous, are selected as features responsible for the target
* The visualizations of each feature and its unique values helped in deciding for which feature to be selected
* After visualizing the feautres we found: 
 1. Column 'veil_type' shows no variations, hence dropped
 2. In column 'stalk_root', out of 8124 rows, 2480 rows have missing values and hence            dropped
* Depending on the label encoded values of feature and the applied model, we will get the results

## Machine Learning 
We hope to correctly classify the dataset with the help of a number of different machine learning methods such as Logistic Regression, Support Vector Machines, Neural Networks etc. Where interpretability is possible we plan to measure feature importance to help understand which features are playing the most important role in helping determining whether a mushroom is safe or poisonous. Ideally we can afford to classify some safe mushrooms as poisonous but we have to make sure we do not classify poisonous mushrooms as safe, as poisonous mushrooms can be very dangerous for consumers. We aim to use the power of machine learning to to uncover interesting trends, patterns and optimize our classification of mushrooms.

### Description of how data was split into training and testing sets 
* First the original dataset was split into input(X) and output(y) columns
* Next, the train_test_split function was called, passing both I/O arrays and have them split appropriately into train and test subsets
* Here we have used stratified train-test split which ensures same proportions of examples in each class. This is achieved by setting the 'stratify' argument to the y component of the original dataset

### Metrics Breakdown
In evaluating our model we are interested in three main metrics: Precision, Recall and Accuracy Score. Precision is calculated as the True Positives as a fraction of our the sum of our True Positive and False Positive. In more simpler terms True Positive (TP) is an edible mushroom correctly predicted edible and False Positive (FP) is a poisonous mushroom incorrectly predicted edible. Recall is calculated as True Positive as a fraction of the sum of True Positive and False Negative. False Negative (FN) in our context is 
an edible mushroom incorrectly predicted as poisonous. Accuracy score is simply the percentage of observations we have classified correctly, which is a good metric of the overall performance of our model. Whether we are more interested in Precision and Recall is really dependent on what we are interested in our model. Our model has two main outcomes: Poisonous (0) or Edible (1). In our case, Precision is more important to us than Recall because we can allow certain edible mushrooms to be predicted as poisonous (False Negative), it may cause wastage but we can allow for some flexibility. However, we can not allow for poisonous mushrooms to be misclassified as edible (False Positive) because if anyone eats a such a mushroom it can cause increased health risks along with some legal ramifications. Therefore, even though ideally we want to have both a high precision and outcome, in this case if we had to choose we would prefer a higher precision score than outcome. 

### Explanation of model choice, including limitations and benefits
* For Mushroom classification we have tried four models:
  * Logistic Regression (Accuracy: 93%) 
  * SVM(Support Vector Machine) (Accuracy: 94%) 
  * Deep Neural Network (Accuracy: 85.4%) 
  * Random Forest Classifier (Accuracy: 100%) 

Initially we selected and used Logistic Regression Model, but after evaluating other models, such as Deep Neural Network, Support Vector Machine and Random Forest Classifier, we decided to use Random Forest classifier. We realized that Neural Network might be overfitting the data by overanalyzing and creating unnecessary patterns, one of the reasons the model yields the least accurate score of the four models with an accuracy of only 85.4%, Then we decided on the Logistic Regression model, and even though the model did a nearly perfect job of a 93% accuracy, we realized that with a total of 20 features and lots of variation in the data due to 20 categorical features, it may be better to use a more complex model that might yield an accuracy of 100%. We used Support Vector Machine and the model improved another percentage point to 94%. Lastly, we tried the Random Forest model, which yielded an accuracy of 100%. Therefore, we decided to give with the Random Forest Model. 

* Benefits 
  * First and foremost, Random Forest ended up being the only model that yielded an accuracy of 100% with all observations properly classified. Therefore, after trying all other models, we decided to go with Random Forest because it provided us the best results.  
  * Random Forest adds randomness to the model, while growing the trees. Random Forest searches for the best feature within a subset of features, which also reduces overfitting. After deleting unnecessary features, we still end up with 20 features, all of which are categorical and have a number of unique values. Therefore Random Forest has a lot of depth and thus, can help us account for the variation in our model. 
* Limitation
  * Random Forest has a kind of a black box approach, therefore, we have very little control on what the model does and therefore the model is less customizeable, we can at best only change the parameters or random seeds. Therefore, it is a predictive modeling tool, not a descriptive tool. 
  * Another problem with Random Forest is that a large number of trees can make the algorithm too slow and ineffective for real time predictions. Therefore, if we end up with too many trees our model may slow down and may not perform well. 

### Description and explanation of model’s confusion matrix, including final accuracy score
In order to better understand how we determine Random Forest classifier to be our model of choice, let's look at the confusion matrix for all four models. There are a total of 4062 observations in our data our of which 2104 are 'edible' and 1958 are poisonous. 

![This is a alt text.](/Images/cm_neuralnetwork.png)
![This is a alt text.](/Images/cm_logistic.png)
![This is a alt text.](/Images/cm_svm.png)
![This is a alt text.](/Images/cm_rf.png)

In our confusion matrix, on the y axis we have our true labels and on the x axis we have our predicted labels. Top left are all Edible mushrooms correctly predicted as Edible, top right is all Edible mushrooms misclassified as Poisonous (False Negative), botton left is all Poisonous mushroom being misclassified as Edible (False Positive). This False Positive is our danger zone because it relates to our precision, as we cannot misclassify any poisonous mushroom as edible due to the health and legal complications it may cause. Therefore, it is our preference for this bottom left portion to be zero. Finally our botton right is all poisonous mushroom being classified as poisonous. 

Now looking at all four classifier we find that our neurel network model performs the worst with 481 Poisonous mushrooms being misclassified as Edible, failing to meet our criteria on our most important metric while it also misclassifies 111 Edible mushrooms as Poisonous. Our Logistic and Support Vector Machine classifiers have a roughly similar performance, misclassifying 160 and 135 Poisonous mushrooms as Edible, and 110 and 99 Edible mushrooms as Poisonous. Therefore, our best perfoming models ends up being the Random Forest which classifies all our observations correctly with all 2104 Edible mushrooms classified as Edible and 1958 Poisonous mushroom classified as Poisonous. It meets our ideal criteria of having 0 Poisonous mushrooms misclassified as Edible with a 100% Precision, while also having perfect Recall rate which is a bonus for us. Therefore, we determined that Random Forest is the best classifier in this scenario. 

### Feature Importances 
After the confusion matrix. we look at the feature importances of our Random Forest model to see which features played the most importance role in determining our perfect accuracy. 

![This is a alt text.](/Images/feature_importance.png)

Looking at the featue importances, we find that Spore Print Color, Odor, Gill Size, Ring Type, Population and Bruises end up being some of the top feature importances in our graph. However, what's striking is that Spore Print Color, Ring Type, Gill Size, Population and Bruises were also among the most correlated variables to our outcome when we made our heatmap. This shows us that calculating correlation earlier on can give us a good indication of what variables will play an important role in our model. Therefore, it's very importance to conduct initial data exploration to better understand relationships between variables to give us a better idea behind feature selection and feature importances, especially when dealing with very large number of features. 

### Recommendations for Future Analysis
For future analysis we provide the following recommendations: 
* Our dataset was comprised of hypothetical samples so it would be informative to implement the model on real mushroom samples from the same species and mushroom families. This would give us insight on a real-life application of our model.There are over 14,000 known species of mushrooms, and our dataset contained hypothetical samples from only 23 species and two families
* We would be interested to see how well our model performs when testing a new, unseen data, perhaps with completely different mushroom samples from different species
* There are many poisonous plants that may appear harmless, but could be deadly or cause injury or illness to humans or animals. Further tweaking of and implementation of our model could possibly assist in predicting poisonousness of other plants

### What Would We Do Differently? 
Due to time constraints, we completed this project in just four weeks. If had more time we provide, we would explore this project further by: 
* Exploring individual features and their correlation in more detail, as well as their importance to the outcome of the model
* Although our accuracy score with Random Forest Classifier was perfect, it would be interesting to play around with dropping even more features, focusing on those deemed most meaningful. We could then re-run various supervised machine learning models to compare and contrast their outcomes. This could lead to the possibility of another model performing better than our Random Forest Classifier.
* Since our dataset is categorical, we could perform further statistical analysis by looking at frequency data; for example, the number of occurrences of each unique value per physical characteristic. We could also implement the chi-squared test to comparing the different between categorical levels of different features and comparing it our outcome for example by seeing whether different Population of mushrooms (scattered, numerous, abundant, solitary, clustered, several) are have a relationship with whether a mushroom's class is Edible or Poisonous. 


## Data Visualization 

### Data Visualization: Dashboard
For our Data Visualization, we created some initial plots in Jupyter Notebook using matplotlib and seaborn to do some initial data exploration. Afterwards, we decided to use Tableau to display some interactive features, creating a Tableau Dashboard which displays our confusion matrix, feature importances, heatmap and an interactive element for a bar chart displaying our most important feature, spore print color. You can access our dashboard in the link here: 
https://public.tableau.com/app/profile/pj.smith/viz/MushroomAnalysis/MushroomDashboard

### Data Visualization: Summary 
We used data visualization to show the relationship between all the 22 variables we have in our dataset, with the primary goal of showing the relationship between our features and our outcome (class). Since we have largely unordered categorical variables, our analysis is limited to heatmaps, and barplots. We will also use data visualization to plot our confusion matrix and feature importances. 

* We first created a bar chart for the class (outcome) variable to understand the categorical distribution and ensure there is no imbalance between the two classes. We find that our outcome categories are roughly equal in count, we do not need to use resampling methods. 
* We find that the veil type feature has one category, since all mushrooms have the same category of veil type, this feature does not contribute to the model and should be dropped
* We create a heatmap to visualize the relationships between all the variables in the model to understand which features are most correlated to our outcome. We find that population, spore print color, ring type, stalk color above ring, gill color, gill size, gill spacing and bruises all have a correlation of greater than 0.3 with class.
* We create barplots for the remaining 21 features to understand categorical distribution of all variables in our model. 
* We create an interactive element in Tableau where we can toggle on the bar chart for our most important feature, spore print color, to see the distribution of categories of spore print color within Edible mushrooms, Poisonous mushrooms or even both.
* We visualized our confusion matrix to show model performance and created a horizontal bar plot for feature importances of our model of choice: Random Forest. These visuals showed how our model performed and which were our most important features, ultimately proving how the data visualization process helped our feature selection and improved our model.

## References 

  https://www.researchandmarkets.com/reports/4451952/global-edible-mushrooms-market-industry-trends

  https://www.kaggle.com/uciml/mushroom-classification/code
  
  https://archive.ics.uci.edu/ml/datasets/Mushroom

  
  [Presentation](https://docs.google.com/presentation/d/1EP28CKPbYbpHLa78xovteIuUX3ddW1zJACCxqsLnej8/edit#slide=id.p)
