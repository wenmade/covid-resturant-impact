library(ggmap)
library(sf)
library(mapview)


all_rest= read.csv('dataset/all_resturants.csv', stringsAsFactors = FALSE)
rest_locations <- tibble(
  Lon = all_rest$Long, 
  Lat = all_rest$Lat, 
  ID = all_rest$ID, 
  Name = all_rest$Name)


locations_sf <- st_as_sf(rest_locations, coords = c("Lon", "Lat"), crs = 4326)
mapview(locations_sf)



sample_rest = read.csv('dataset/sample_resturants.csv', stringsAsFactors = FALSE)
control_rest = read.csv('dataset/control_resturants.csv', stringsAsFactors = FALSE)

sample_locations <- tibble(
  Lon = sample_rest$Long, 
  Lat = sample_rest$Lat, 
  ID = sample_rest$ID, 
  Name = sample_rest$Name)

control_locations <- tibble(
  Lon = control_rest$Long, 
  Lat = control_rest$Lat, 
  ID = control_rest$ID, 
  Name = control_rest$Name)


locations_sample <- st_as_sf(sample_locations, coords = c("Lon", "Lat"), crs = 4326)
mapview(locations_sample)

locations_control <- st_as_sf(control_locations, coords = c("Lon", "Lat"), crs = 4326)
mapview(locations_control)
