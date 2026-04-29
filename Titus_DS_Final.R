setwd("C:/Users/User/Downloads/Titus_DS_Final")

library(caret)
library(terra)

#Load Shapefiles
panels <- terra::vect("/cloud/project/Rooftop_Solar_Panels.shp")
buildings <- terra::vect("/cloud/project/BASEMAP_Buildings.shp")
zoning <- terra::vect("/cloud/project/CDD_ZoningDistricts.shp")
City_Bound <- terra::vect("/cloud/project/BOUNDARY_CityBoundary.shp")
MA_Tracts <- terra::vect("/cloud/project/tl_2025_25_tract.shp")

#Ensure all in same projection
panels <- project(panels, crs(buildings))
MA_Tracts <- project(MA_Tracts, crs(City_Bound))

#Select only buildings with panels
Panel_Buildings <- buildings[panels, ]
plot(Panel_Buildings)

#Select Tracts within Cambridge Bounds
Cambridge_Tracts <- terra::intersect(City_Bound, MA_Tracts)
plot(Cambridge_Tracts)
