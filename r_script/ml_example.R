#################################################################################################################
## Machine Learning Exercise Example
## by Mario Catuogno and Francesco Pastore
## 30/09/2016
#################################################################################################################

### LOAD PACKAGES
rm(list = ls())
require(readr)
require(dplyr)
require(ggplot2)

#################################################################################################################

### IMPORTING

## Set working directory
setwd("/Users/mariocatuogno/Dropbox/Github/IMDb")
## Import example data
data <- read_csv("data/example_data.csv")

#################################################################################################################

### DATA CLEANSING

## Select only "Feature Film" discarding "TV Series"
data <- data %>%
  tbl_df %>%
  filter(`Title type` == "Feature Film")
## Select and rename columns
data <- data %>%
  select(movie_id = const,
         movie_title = Title,
         movie_genre = Genres,
         movie_runtime = `Runtime (mins)`,
         movie_year = Year,
         date_release = `Release Date (month/day/year)`,
         cast_director = Directors,
         rating_personal = `You rated`,
         rating_IMDb = `IMDb Rating`,
         num_votes = `Num. Votes`)
## Rename columns







