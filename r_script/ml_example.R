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

### IMPORT AND DATA CLEANSING

## Set working directory
setwd("/Users/mariocatuogno/Dropbox/Github/IMDb")
## Import raw data [Package: readr]
raw_data <- read_csv("data/raw_data.csv")

## Select only "Feature Film" discarding "TV Series" [Package: dplyr]
raw_data <- raw_data %>%
  tbl_df %>%
  filter(`Title type` == "Feature Film")
## Select and rename columns [Package: dplyr]
raw_data <- raw_data %>%
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
## Select only the first movie genre as main genre, deleting secondary genres
raw_data$movie_genre <- gsub(".*,", "", raw_data$movie_genre)
## Select only the first director as main director, deleting secondary directors
raw_data$cast_director <- gsub(".*,", "", raw_data$cast_director)
## Save the newly created dataset, to speedup the import process [Package: readr]
write_csv(raw_data, "data/clean_data.csv")


#################################################################################################################

### IMPORT AND DATA EXPLORATION

## Set working directory
setwd("/Users/mariocatuogno/Dropbox/Github/IMDb")
## Import cleansed data
data <- read.csv("data/clean_data.csv")
## Check the structure of the dataset
str(data)

#################################################################################################################

### DATA VISUALIZATION

# Create a data frame with frequencies for each movie genre
movie_genre_freq <- data %>% 
  group_by(movie_genre) %>% 
  summarise(count = n()) %>%
  arrange(desc(count))

## Number of movies by genre
p1 <- ggplot(data = movie_genre_freq, aes(x = movie_genre, y = count)) + geom_bar(stat = "identity") + coord_flip()
plot(p1)



