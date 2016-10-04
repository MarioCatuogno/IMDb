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

# Create data frame with frequencies for each movie genre
movie_genre <- c("Action", "Adventure", "Crime", "Drama", "Comedy", "Family",   
                 "Fantasy", "History", "Horror", "Musical", "Mystery", "Romance", 
                 "SciFi", "Sport", "Thriller", "War", "Western")
movie_freq <- c(2, 11, 11, 46, 22, 20, 
                53, 1, 4, 4, 15, 53, 
                76, 10, 151, 19, 9)
movie_genre_freq <- data.frame(movie_genre, movie_freq)
rm(movie_genre, movie_freq)

# Arrange levels of factor by frequency
movie_genre_freq$movie_genre <- factor(movie_genre_freq$movie_genre, levels = movie_genre_freq$movie_genre[order(movie_genre_freq$movie_freq)])

## P1: Number of movies by genre
p1 <- ggplot(data = movie_genre_freq, aes(x = movie_genre, y = movie_freq, label = movie_freq, fill = movie_genre)) + 
  geom_bar(stat = "identity") + geom_text(nudge_y = 4.5) + coord_flip() +
  labs(x = "Count", y = "Movie genre", title = "Number of movies by genre") +
  theme(plot.title = element_text(face = "bold", size = 18),
        axis.text.x = element_blank(),
        axis.text.y = element_text(size = 10),
        axis.title = element_text(size = 12),
        axis.ticks = element_blank(),
        legend.position = "none", 
        legend.text = element_text(face = "italic", size = 10),
        legend.title = element_blank())
plot(p1)

# P2: Show the correlation between IMDb ratings and personal ratings
p2 <- ggplot(data = data, aes(x = rating_IMDb, y = rating_personal, colour = rating_personal)) + geom_jitter() +
  scale_y_continuous(limits = c(1,10), breaks = c(1,3,5,7,9)) +
  scale_x_continuous(limits = c(1,10), breaks = c(1,3,5,7,9)) +
  scale_color_continuous(low = "#D73027", high = "#1A9850") +
  labs(x = "IMDb ratings", y = "Personal ratings", title = "Correlation between \n IMDb and personal ratings") +
  theme(plot.title = element_text(face = "bold", size = 18),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        axis.title = element_text(size = 12),
        axis.ticks = element_blank(),
        legend.position = "none", 
        legend.text = element_text(face = "italic", size = 10),
        legend.title = element_blank())
plot(p2)



