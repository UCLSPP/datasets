#----------------------------------------------------------------
download_datasets <- function(url, collection, target, overwrite = FALSE) {
  message(paste("downloading datasets to", target))
  
  collection_filename <- file.path(url, collection)
  message(paste("  reading collection from", collection_filename))
  
  collection_data <- read.csv(collection_filename, 
                              strip.white = TRUE,
                              stringsAsFactors = FALSE)
  
  for (i in 1:nrow(collection_data)) {
    filename <- basename(collection_data$path[i])
    source_path <- file.path(url, collection_data$path[i])
    target_path <- file.path(target, filename)
    
    if (file.exists(target_path) && !overwrite)
        next

    message(sprintf("    %s", filename))
    utils::download.file(source_path, target_path, quiet = TRUE)
  }
  
  return(TRUE)
}

