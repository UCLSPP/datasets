# script called by Makefile for building with rmarkdown

library(tidyverse)

args <- commandArgs(TRUE)
stopifnot(length(args) >= 1)

# ---------------------------------------------------------------------
site <- function() {
  rmarkdown::render_site(encoding = 'UTF-8')
}

# ---------------------------------------------------------------------
archives <- function() {
  collections <- sort(list.files(path = "./collections", pattern = "*.csv", full.names = TRUE))

  for (filename in collections) {

    collection_name <- tools::file_path_sans_ext(basename(filename))

    collection <- read_csv(filename) %>%
      mutate(name = trimws(name), path = trimws(path)) %>%
      arrange(name)

    zipfile <- file.path("_site", paste(collection_name, "zip", sep = "."))
    zip(zipfile, files = collection$path, flags = "-j")
  }
}

do.call(args[1], args = as.list(tail(args, -1)))


