# Don't Eat That Mushroom: Using Machine Learning to Classify Mushrooms

## Introduction
The global mushroom market is expected to grow at a Compound Annual Growth Rate (CAGR) of 7.95% to grow to $62.19 billion in 2023 increasing from $42.42 billion in 2018. Edible Mushrooms are fleshy edible fruit bodies which grow above ground and are basically a fungus. Edibility is based on two factors: Absence of poisonous effects on humans and having desired taste. Mushrooms are grown and consumed all around the world, used in food, agriculture and healthcare and pharmaceutical industries. 

## Overview
In this project we have selected the topic of Mushroom Classification. We aim to create a machine learning model which classifies safe to eat mushrooms from poisonous ones. Considering the large mushroom market, we can sell this model to large scale mushroom farmers, wholesale distributors, or simply anyone growing or selling edible mushrooms but needs to ensure that edible mushrooms are separated from poisonous ones. Using machine learning can potentially save large chunks of time spent by mushroom experts in determining which mushrooms are safe and which are poisonous. 

## Data Source
We will use the Mushroom Data Set from the UCI Machine Learning Repository. This data comes from the Audobon Society Field Guide to North American Mushrooms (1981) where mushrooms are described in terms of physical characteristics and are classified as either poisonous or edible. The dataset includes description of hypothetical samples of 23 species of gilled mushrooms in the Agaricus and Lepoita Family with each species identified as either definitely edible, definitely poisonous, or unknown edibility and not recommended. For simplicity, the latter classes were combined with the poisonous ones. There is no simple rule for determining whether a mushroom is edible or not. The dataset has 22 different attributes available which can be used as features in the machine learning model. There are a wide variety of attributes such as ring type, gill color, odor, etc. 

## Data Exploration, Machine Learning and Visualization
Before employing the model, we would like to do some data exploration to ask questions such as whether there is imbalance in the target variable in the model or if there is any correlation between the features. We can visualize data with bar charts, scatterplots, and heatmaps to understand relationships between different variables in the dataset. We hope to correctly classify the dataset with the help of a number of different machine learning methods such as Logistic Regression, Support Vector Machines, Neural Networks etc. Where interpretability is possible we plan to measure feature importance to help understand which features are playing the most important role in helping determining whether a mushroom is safe or poisonous. Ideally we can afford to classify some safe mushrooms as poisonous but we have to make sure we do not classify poisonous mushrooms as safe, as poisonous mushrooms can be very dangerous for consumers. Therefore, through the help of data exploration, data visualization and machine learning, we hope to uncover interesting trends, patterns and optimize our classification of mushrooms. 

## Technologies Used
We will be using several different technologies in the completion of our analysis. 

### Data Cleaning and Analysis 
Pandas (Python) will be used to clean the data and perform exploratory data analysis (EDA). 

### Database Storage and Connection
We will upload our csv data file into a PostgreSQL database. We will create the schema for this file. We will create a database connection using SqlAlchemy (Python) in order to import the data from a PostgreSQL database to a Jupyter Notebook for analysis.  

### Machine Learning 
Scikit-learn (Python) is a machine learning library we will use in order to split the data and preprocess the data. We will use the TensorFlow (Python) library for deep learning capabilities, and to create and run our deep neural network model. 

### Presentation
For our presentation of our analysis we will be using Google Sheets found [here.](https://docs.google.com/presentation/d/1EP28CKPbYbpHLa78xovteIuUX3ddW1zJACCxqsLnej8/edit#slide=id.p)

## References 

  https://www.researchandmarkets.com/reports/4451952/global-edible-mushrooms-market-industry-trends

  https://www.kaggle.com/uciml/mushroom-classification/code
  
  https://archive.ics.uci.edu/ml/datasets/Mushroom
  
  [Presentation](https://docs.google.com/presentation/d/1EP28CKPbYbpHLa78xovteIuUX3ddW1zJACCxqsLnej8/edit#slide=id.p)
