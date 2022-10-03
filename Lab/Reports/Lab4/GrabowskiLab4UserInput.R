# Run this line of code, then enter file name in console
filename <- readline(prompt = "Enter file path:")

# Run this line to import dataset
file <- read.csv(filename,header=TRUE)

# Run these lines of code to remove junk Paper IDs 
file$Paper.ID <- gsub("\\]", "", file$Paper.ID)
file$Paper.ID <- gsub("\\[", "", file$Paper.ID)
file$Paper.ID <- gsub("\\'", "", file$Paper.ID)
file$Paper.ID <- gsub(" ", "", file$Paper.ID)
for (each in c(length(file$Paper.ID):1)){
  if (length(unique(unlist(strsplit(file$Paper.ID[each], ",")))) == 1){
    file <- file[-c(each),]
  }
}

# This line of code will print the number of rows with non-junk Paper IDs
print(length(file$Paper.ID))
