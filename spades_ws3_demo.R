# minimal demo of a working SpaDES model with harvesting (using ws3)

library(reticulate)
library(SpaDES)

setPaths(modulePath = 'modules',
         inputPath = 'input',
         outputPath = 'output',
         cachePath = 'cache')
paths <- getPaths()

modules <- list('spades_ws3_dataInit')

base.year <- 2020   
#basenames <- c("tsa08", "tsa16", "tsa24", "tsa40", "tsa41")
basenames <- list(c("tsa41"))
horizon <- 1
times <- list(start = 0, end = horizon - 1)
tifPath = "tif"
hdtPath = "hdt"
hdtPrefix = "hdt_"
outputs <-data.frame(objectName = "landscape")

#scheduler.mode <- "areacontrol"
scheduler.mode <- "optimize"
target.masks <- list(c('? ? ? ?'))
target.areas <- list(1000)
target.scalefactors <- NULL

params <- list(spades_ws3_dataInit = list(basenames = basenames,
                                          tifPath = tifPath,
                                          hdtPath = hdtPath,
                                          hdtPrefix = hdtPrefix,
                                          base.year = base.year,
                                          .saveInitialTime = 0,
                                          .saveInterval = 1,
                                          .saveObjects = c("landscape"),
                                          .savePath = file.path(paths$outputPath, "landscape")),
               spades_ws3 = list(basenames = basenames,
                                 scenario.name = scenario.name,
                                 cbird = cbird,
                                 horizon = 8,
                                 tifPath = tifPath,
                                 hdtPath = hdtPath,
                                 hdtPrefix = hdtPrefix,
                                 base.year = base.year,
                                 scheduler.mode = scheduler.mode,
                                 target.masks = target.masks,
                                 target.areas = target.areas,
                                 target.scalefactors = target.scalefactors))
sim <- simInit(paths=paths, modules=modules, times=times, params=params, outputs=outputs)
simOut <- spades(sim, debug=TRUE)

#years <- 2020:2099

#burned.area.tsa08 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa08/projected_fire_', x, '.tif')), sum) * 6.25)})
#burned.area.tsa16 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa16/projected_fire_', x, '.tif')), sum) * 6.25)})
#burned.area.tsa24 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa24/projected_fire_', x, '.tif')), sum) * 6.25)})
#burned.area.tsa40 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa40/projected_fire_', x, '.tif')), sum) * 6.25)})
#burned.area.tsa41 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa41/projected_fire_', x, '.tif')), sum) * 6.25)})

#harvested.area.tsa08 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa08/projected_harvest_', x, '.tif')), sum) * 6.25)})
#harvested.area.tsa16 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa16/projected_harvest_', x, '.tif')), sum) * 6.25)})
#harvested.area.tsa24 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa24/projected_harvest_', x, '.tif')), sum) * 6.25)})
#harvested.area.tsa40 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa40/projected_harvest_', x, '.tif')), sum) * 6.25)})
#harvested.area.tsa41 <- sapply(years, function(x){return(cellStats(raster(paste0('input/tif/tsa41/projected_harvest_', x, '.tif')), sum) * 6.25)})

