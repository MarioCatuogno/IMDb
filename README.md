# IMDb
IMDb toy project

## Table of contents

* [1. Introduction](#introduction)
    * [1.1 Project overview](#project-overview)
    * [1.2 Project features](#project-features)
    * [1.3 Purpose of the project](#purpose-of-the-project)
    * [1.4 Project roadmap](#project-roadmap)
    * [1.5 Programming language used](#programming-language-used)
* [2. Functions](#functions)
    * [2.1 List of functions](#list-of-functions)
    * [2.2 Function description](#function-description)
    * [2.3 Functional analysis](#functional-analysis)
    * [2.4 Non-functional analysis](#non-functional-analysis)
* [3. Requirements](#requirements)
    * [3.1 Functional requirements](#functional-requirements)
    * [3.2 UI requirements](#ui-requirements)
    * [3.3 Usability](#usability)
* [4. Performance](#performance)
    * [4.1 Capacity](#capacity)
    * [4.2 Availability](#availability)
    * [4.3 Latency](#latency)
    * [4.4 Monitoring](#monitoring)
    * [4.5 Maintenance](#maintenance)
    * [4.6 System interface](#system-interface)

## Introduction

A Project started in Luiss for Machine Learning course in MABDA2016 class, by [__Francesco Pastore__](https://github.com/fgpastore) & [__Mario Catuogno__](https://github.com/MarioCatuogno).

#### Project overview

The program uses a set of parameters, to cluster and classify movies and propose one that you haven't seen yet. It is possible to catalogue previous seen movies to help the program to better select the results.

The project have a long-term goal, we have just started the descriptive analysis of the huge dataset of **IMDb** (*more than 12Gb of compressed data*) and we are still in the **Data Cleansing** stage.

#### Project features

* The program uses clustering algorithm to create subset of movies based on genre/actor/year (*in the future also sentiment adjectives*)
* The software make a classification of movies based on your preferences (*assigned score*)
* You can manually add/delete movies that you have watched
* You can use moods label to find the perfect movie
* The more movie you add, the more the algorithm becomes precise in selecting the perfect movie for the user
* Similar to Netflix "*Chosen for you*" but not limited by the Netflix catalogue
* The software uses a cleansed database from IMDB uploaded on the web for future updates (*weekly/monthly probably*)

#### Purpose of the project

The purpose of the project is to develop a tool which helps the user in choosing a not-seen-yet movie which he can enjoy with a certain probability.

#### Project roadmap

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

#### Programming language used

We choose to use R as programming language for this project, in combination with the following additional packages:

* __Data Importing__: readr, RSQLite
* __Data Manipulation__: dplyr
* __Data Visualization__: ggplot2

## Functions

#### List of functions
* get_history
    * intial_history
    * suggestion_history
* get_mood_social_context
* get_date
* get_trend
    * imdb_updates
* sentiment_complete_analysis
    * sentiment_cluster

#### Functions description

The function `get_history()` allows to retrieve

#### Functional analysis

#### Non-functional analysis

## Requirements

#### Functional requirements

#### UI requirements

#### Usability

## Performance

#### Capacity

#### Availability

#### Latency

#### Monitoring

#### Maintenance

#### System interface
