################################################################################
##
## [ PROJ ] < Problem set 3 >
## [ FILE ] < Byrne_Katherine_PS3 >
## [ AUTH ] < Katherine Byrne / katherineabyrne >
## [ INIT ] < 1-30-2023 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)
library(dplyr)
library(readr)
library(readxl)
library(haven)

## ---------------------------
## directory paths
## ---------------------------

input_data_dir <- file.path(".", "data")
output_file_dir <- file.path(".", "analysis", "files")
bib_data_dir <- file.path(".", "bib")
analysis_data_dir <- file.path(".", "analysis")

## -----------------------------------------------------------------------------
## Part X - Label each question using comments
## -----------------------------------------------------------------------------

#Part 1 Extra Credit: create git repository
# Katherines-MacBook-Pro-3:ps3_directory katherinebyrne$ git clone https://github.com/katherineabyrne/PS3.git

#Part 1 Question 4: Create Subdirectories
dir.create(path = "data")
dir.create(path = "bib")
dir.create(path = "analysis")
dir.create(path = "analysis/files")

#Part 1 Question 5: Download Data
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/housing.zip", destfile = file.path(input_data_dir, "housing.zip"))
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/apa.csl", destfile = file.path(bib_data_dir, "apa.csl"))
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/references.bib", destfile = file.path(bib_data_dir, "references.bib"))
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/ps2_template.Rmd", destfile = file.path(analysis_data_dir, "Byrne_Katherine_PS3.Rmd"))

#Part 2 Question 1: Unzip
unzip(zipfile = file.path(input_data_dir, "housing.zip"), exdir = input_data_dir)

#Part 2 Question 2: Read in Data
housing_df <- read_csv("housing.csv")

#Part 2 Question 3: Scatterplot
housing_df %>% ggplot(aes(x=median_income, y=median_house_value)) + geom_point()

#Part 2 Question 4: Filter df
housing_df <- housing_df %>% filter(median_house_value <= 500000)

#Part 2 Question 5: Investigate Variable
#housing_df %>% count(ocean_proximity)
#class(housing_df$ocean_proximity)

housing_df %>% ggplot(aes(x=median_income, y=median_house_value, color=ocean_proximity)) + geom_point()


#Part 2 Question 6: Convert Variable to Factor
housing_df$ocean_proximity <- factor(
  housing_df$ocean_proximity, 
  levels= c("ISLAND", "NEAR BAY", "NEAR OCEAN", "<1H OCEAN", "INLAND"))

housing_df %>% ggplot(aes(x=median_income, y=median_house_value, color=ocean_proximity)) + geom_point()

#Part 2 Question 7: Save df as RDS
saveRDS(object=housing_df, file=file.path(output_file_dir, "housing.RDS"))



## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
