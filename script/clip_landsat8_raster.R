start.time <- Sys.time()
for (d in c('01_JANVIER','04_AVRIL','08_AOUT','10_OCTOBRE')){
  setwd(paste0("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/",d,"_2017_L8_BREST"))
  filesList <- list.files(pattern = ".TIF")
  ze = sf::st_read("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/ze.shp")
  for(r in filesList){
    raster_best = raster::raster(r)
    raster_best_crop = raster::crop(raster_best,ze)
    raster::writeRaster(raster_best_crop,paste0(tools::file_path_sans_ext(r),'_clip.TIF'),options=c('TFW=YES'),overwrite=TRUE)
  }
}
end.time <- Sys.time()
time.taken <- end.time - start.time
cat("Temps d'execution ==>",time.taken)


# raster_best = raster::raster("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B7.TIF")
# raster_best_crop = raster::crop(raster_best,ze)
# raster::writeRaster(raster_best_crop,paste0('/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B7_clip.TIF'),
#                       options=c('TFW=YES'),overwrite=TRUE)
# 
# raster_best = raster::raster("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B6.TIF")
# raster_best_crop = raster::crop(raster_best,ze)
# raster::writeRaster(raster_best_crop,paste0('/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B6_clip.TIF'),
#                     options=c('TFW=YES'),overwrite=TRUE)
# 
# raster_best = raster::raster("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B1.TIF")
# raster_best_crop = raster::crop(raster_best,ze)
# raster::writeRaster(raster_best_crop,paste0('/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/04_AVRIL_2017_L8_BREST/04_AVRIL_2017_L8_BREST_B1_clip.TIF'),
#                       options=c('TFW=YES'),overwrite=TRUE)
