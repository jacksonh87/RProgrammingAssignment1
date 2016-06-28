pollutantmean <- function(directory, pollutant, id = 1:332) {
  ###############################################################
  ##              INSTRUCTIONS FROM COURSERA                   ## 
  ###############################################################  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Returns the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ###############################################################
  ##              END OF INSTRUCTIONS FROM COURSERA            ## 
  ############################################################### 
  
  ## Initialize a vector to hold the pollutant data
  mean_vector <- c()

  ## Produces character vector of every .csv file in the directory we 
  ## passed as an arg
  dir <- paste(getwd(),"/",directory,"/",sep="")
  all_files <- as.character(list.files(dir))

  ## Makes a vector of file paths from the list of .csv files
  file_paths <- paste(dir, all_files, sep="")

  ## Goes through every file in id and reads the .csv data
    for(i in id) {

      ## Reads the .csv data from the current file
      current_file <- read.csv(file_paths[i], header=T, sep=",")

      ## Takes out the NA values from the pollutant column of interest
      na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]

      ##Adds the values (NA's removed) onto the end of mean_vector
      mean_vector <- c(mean_vector, na_removed)
    }

mean(mean_vector)

}