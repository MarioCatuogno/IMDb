# IMDb
IMDb toy project

## Introduction

A Project started in Luiss for Machine Learning course in MABDA2016 class, by [__Francesco Pastore__](https://github.com/fgpastore) & [__Mario Catuogno__](https://github.com/MarioCatuogno).

## Project Overview

The program uses a set of parameters, to cluster and classify movies and propose one that you haven't seen yet. It is possible to catalogue previous seen movies to help the program to better select the results.

The project have a long-term goal, we have just started the descriptive analysis of the huge dataset of **IMDb** (*more than 12Gb of compressed data*) and we are still in the **Data Cleansing** stage.

## Project Roadmap

Goal | Description | Status
--- | --- | ---
__Import__ | Import the following dataset: **actors.csv**, **actresses.csv**, **directors.csv**, **editors.csv**, **genres.csv**, **movies.csv**, **plots.csv**, **running-time.csv** | 30%
__Cleansing__ | Clean the dataset | 0%
__Create DB__ | Create a **SQLite DB** containing the data used by the algorithms | 0%
__DB Analysis__ | Analyze data and crete some descriptive statistics reports | 0%
__Function:Update__ | Create an "update()" function to update data from IMDb for future movies | 0%
__Function:Cluster__ | Create a clustering function to create **k** clusters | 0%
__Function:Classification__ | Create a classification function for movie clusters | 0%
__Function:SentimentAnalysis__ | Create a function to perform a **Sentiment Analysis** on movie plots | 0%


## R Functions list

* get_history
    * intial_history
    * suggestion_history
* get_mood_social_context
* get_date
* get_trend
    * imdb_updates
* sentiment_complete_analysis
    * sentiment_cluster

## Functions description

The function `get_history()` allows to retrieve
