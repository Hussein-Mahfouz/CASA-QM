library(sf)
library(tidyverse)
library(tmap)

#for basemap
cairo_hexagons <- st_read("Shapefiles/H3res-8_GCR_4326.shp") %>% 
  filter(!grepl('10th of Ramadan|10 Of Rammadan', nam_tfc))

# to add text labels for the new towns on the outskirts
cairo_new_towns <- st_read("Shapefiles/Central-Inner_Shiyakha_NDC_CAPMAS.shp") %>% 
  filter(zoning_tfc == "Outer")

# Remove 10th of Ramadan City and Giza_Outer Labels)
cairo_new_towns <- cairo_new_towns[!duplicated(cairo_new_towns$name_citya),] %>% 
  filter(!grepl('Giza_Outer|10th of Ramdan', name_citya))


garages <- st_read("Shapefiles/garages_point_layer.shp") %>% 
  filter(!grepl('Al Mataria|Katameya|El Basatin|Tiba', name))



# plot

depot <-  tm_shape(cairo_hexagons) +
              tm_fill("lightgrey") +
          tm_shape(garages) +
              tm_symbols(size = 0.12, col = 'indianred', alpha = 0.9) +
              tm_text(text = "name", col = 'black', size = 0.7, auto.placement = TRUE) +
          tm_shape(cairo_new_towns) + 
              tm_text(text = "name_citya", col = 'black', size = 0.8, 
                     alpha = 0.7, ymod = 1.2, case = "upper", fontface = "bold") +
          tm_add_legend(type = "symbol", labels = ' Depot', col = 'indianred', size = 0.5) +
          tm_scale_bar(color.dark = "gray60",
                         position = c("left", "bottom")) 

depot
tmap_save(tm = depot, filename = "Plots/depot_map.png")

