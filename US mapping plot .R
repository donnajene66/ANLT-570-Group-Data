library(tidyverse)

ggplot(data = US_Referral_data_for_Heart_failure) + 
  geom_bar(mapping = aes(x = referring_primary_affiliation_label))

summary(US_Referral_data_for_Heart_failure)

sapply(US_Referral_data_for_Heart_failure, function(x) length(unique(x)))

count(US_Referral_data_for_Heart_failure, vars = referring_name, sort = TRUE)
count(US_Referral_data_for_Heart_failure, vars = hcp_primary_affiliation_label, sort = TRUE)
count(US_Referral_data_for_Heart_failure, vars = hco_label, sort = TRUE)
count(US_Referral_data_for_Heart_failure, vars = hco_name, sort = TRUE)
count(US_Referral_data_for_Heart_failure, vars = , sort = TRUE)


library(usmap)
library(maps)



#us <- map_data("usa")

#ggplot(us, aes(long, lat)) +
geom_polygon(fill = "white", colour = "black")

#ggplot(us, aes(long, lat)) +
#geom_polygon(fill = "white", colour = "black") +
#geom_point(data = US_Referral_data_for_Heart_failure, aes(x = hcp_longitude, y = hcp_latitude), color = "navy", size = 0.25)

## code needed for plot 
library(tidyverse)
library(leaflet)
library(ggplot2)
library(widgetframe)



leaflet(data = US_Referral_data_for_Heart_failure) %>%
  addTiles() %>%
  addMarkers(lng =~ hcp_longitude, lat =~ hcp_latitude, clusterOptions = markerClusterOptions()) %>%
  frameWidget()


## filtered for physician groups 
doctor_group <- filter(US_Referral_data_for_Heart_failure, referring_primary_affiliation_label == "Physician Group")

leaflet(data = doctor_group) %>%
  addTiles() %>%
  addMarkers(lng =~ hcp_longitude, lat =~ hcp_latitude, clusterOptions = markerClusterOptions()) %>%
  frameWidget()
