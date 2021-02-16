library(ggmap)
library(lubridate)
library(ggplot2)
library(dplyr)
library(data.table)
library(ggrepel)
library(tidyverse)


all_rest= read.csv('dataset/simulated_resturants.csv', stringsAsFactors = FALSE)
rest_locations <- tibble(
  Lon = all_rest$Longitude, 
  Lat = all_rest$Latitude, 
  ID = all_rest$ID, 
  Name = all_rest$Name)
toronto_neighbourhood = read.csv('dataset/wellbeing_toronto.csv', stringsAsFactors = FALSE)


library(sf)
library(mapview)

locations_sf <- st_as_sf(rest_locations, coords = c("Lon", "Lat"), crs = 4326)
mapview(locations_sf)


