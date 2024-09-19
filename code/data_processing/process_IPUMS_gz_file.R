
# ------------------------------
# Description:

# This R script uses the ipumsr package to read the data and DDI files provided by IPUMS.
# It was adapted from the R script you can download from the IPUMS API
# It is meant to be run from a command line interface, and requires two arguments:
# 1. The path to the data directory
# 2. The name of the DDI file

# It assumes that the data directory contains the DDI file and the data file

# ------------------------------

print("Starting the process_IPUMS_gz_file.R script...")

# Get command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if exactly two arguments (filenames) are provided
if (length(args) != 3) {
  stop("Please provide exactly three filenames - the data directory, the DDI file and the data file name")
  
}


# Go up until the folder we are in is 'Fed_IT_Employment'
wd = getwd()
# get folder we are in 
folder = basename(wd)

while (folder != "Fed_IT_Employment" ){
  old_wd = wd
  # Go up one directory
  setwd("..")
  wd = getwd()
  folder = basename(wd)
  if (wd == old_wd) {
    stop("Could not find the 'Fed_IT_Employment' folder")
  }
}

# Print current working directory
print(c("Successfully changed to the root directory: ", getwd()))

cat("Changing the working directory to:", args[1], "\n")
# Combine current working directory with the first argument and change to it
setwd(file.path(getwd(), args[1]))
cat("Working directory changed to:", getwd(), "\n")

# Check if ipumsr package is installed and install it if not
if (!require("ipumsr")) {
  #chooseCRANmirror()
  install.packages('ipumsr', repos = "https://cloud.r-project.org/")
}


# Load the ipumsr package
library(ipumsr)

print("Successfully loaded the ipumsr package")

print("Reading the DDI file...")
# Read the DDI file using first command line argument
ddi <- read_ipums_ddi(args[2])

print("Reading the data file...")
data <- read_ipums_micro(ddi, data_file = args[3])


# Save the data to a csv

# Create args[3] into csv file 
csv_fname = gsub(".gz", ".csv", args[3])
# save it in the data directory
cat("Saving the data to a csv file:", csv_fname, "\n")
write.csv(data, csv_fname, row.names = FALSE)

