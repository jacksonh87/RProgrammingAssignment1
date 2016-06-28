corr <- function(directory, threshold = 0) {
  ###############################################################
  ##              INSTRUCTIONS FROM COURSERA                   ## 
  ###############################################################  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Returns a numeric vector of correlations
  ###############################################################
  ##              END OF INSTRUCTIONS FROM COURSERA            ##
  ############################################################### 
  
  ## Initialise a vector of correlations called "cors"
  cors <- c()
  
  ## Produces character vector of every .csv file in the directory we 
  ## passed as an arg
  dir <- paste(getwd(),"/",directory,"/",sep="")
  all_files <- as.character(list.files(dir))
  number_files <- length(all_files)
  file_index <- 1:number_files
  
  ## Makes a vector of file paths from the list of .csv files
  file_paths <- paste(dir, all_files, sep="")
  
  ## Goes through every file in id and reads the .csv data
  for(i in file_index) {
    
    ## Reads the .csv data from the current file
    current_file <- read.csv(file_paths[i])
    
    ## Makes a complete-cases only version of "current_file"
    complete_cases <- current_file[complete.cases(current_file),]
    
    ## Gets the number of complete cases in the file and compares
    ## to the threshold
    if (nrow(complete_cases) > threshold) {
      
    ## If there are enough complete cases, gets the correlation between 
    ## sulfate and nitrate and adds to end of "cors" vector
      cors <- c(cors, cor(complete_cases$sulfate, complete_cases$nitrate))
      
    }
    
  }
  return(cors)
  
}
    


  

  
