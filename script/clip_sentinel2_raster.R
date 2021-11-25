start.time <- Sys.time()
setwd("/home/gilleol2/Bureau/L3_TELEDETECTION/S2_BREST/05_MAI_S2_BREST")
filesList <- list.files(pattern = ".jp2")
ze = sf::st_read("/home/gilleol2/Bureau/L3_TELEDETECTION/L8_BREST/ze.shp")
for(r in filesList){
  raster_best = raster::raster(r)
  raster_best_crop = raster::crop(raster_best,ze)
  raster::writeRaster(raster_best_crop,paste0("CLIP_",tools::file_path_sans_ext(r),'.TIF'),options=c('TFW=YES'),overwrite=TRUE)
}
end.time <- Sys.time()
time.taken <- end.time - start.time
cat("Temps d'execution ==>",time.taken)
