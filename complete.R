complete <- function(directory, id = 1:332) {
  ###############################################################
  ##              INSTRUCTIONS FROM COURSERA                   ## 
  ###############################################################  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Returns a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  ###############################################################
  ##              END OF INSTRUCTIONS FROM COURSERA            ##
  ############################################################### 
  
  ## Initialise nobs
  nobs <- c()
  
  ## Produces character vector of every .csv file in the directory we 
  ## passed as an arg
  dir <- paste(getwd(),"/",directory,"/",sep="")
  all_files <- as.character(list.files(dir))
  
  ## Makes a vector of file paths from the list of .csv files
  file_paths <- paste(dir, all_files, sep="")
  
  ## Goes through every file in id and reads the .csv data
  for(i in id) {
    
    ## Reads the .csv data from the current file
    current_file <- read.csv(file_paths[i])
    
    ## Sums the number of complete cases in the current file
    ccs <- sum(complete.cases(current_file))
    
    ## Adds number of cases onto the end of 'nobs' vector
    nobs <- c(nobs, ccs)

  }
  
return(data.frame(cbind(id, nobs)))
  
}