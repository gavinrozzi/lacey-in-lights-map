# Lacey in Lights Map
# Gavin Rozzi
# Produces a map and heatmap of the Lacey in Lights finalists for Christmas, 2019


library(tidyverse)
library(leaflet)
library(leaflet.extras)

# Read CSV file of finalists
lacey_in_lights <- read_csv("lacey-in-lights-finalists.csv")

# Create a heatmap of homes
lacey_in_lights_heat <- leaflet(data = lacey_in_lights) %>% addTiles() %>%
  addHeatmap(lng=~lon, lat=~lat,
             blur = 20, max = 0.05, radius = 12 )

# Create a regular map with red markers
lacey_in_lights_map <- leaflet(data = lacey_in_lights) %>% addTiles() %>%
  addAwesomeMarkers(lat=~lat, lng=~lon, icon=icons, popup = ~as.character(Address), label = ~as.character(Address))