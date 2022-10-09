# We imported the dataset MachineRead_output by using the csv function and assigned the dataset to Lab4Data.
Lab4Data <- read.csv("MachineRead_output.csv")

# We removed the junk characters in the Paper.ID column ([, ], ', " ") using the gsub function.
Lab4Data$Paper.ID <- gsub("\\]", "", Lab4Data$Paper.ID)
Lab4Data$Paper.ID <- gsub("\\[", "", Lab4Data$Paper.ID)
Lab4Data$Paper.ID <- gsub("\\'", "", Lab4Data$Paper.ID)
Lab4Data$Paper.ID <- gsub(" ", "", Lab4Data$Paper.ID)

# We made a loop embedded in a loop that removes the junk papers from the Paper.ID column of the dataset Lab4Data. 
# In this example, junk papers are considered to be papers that show up exactly one time.
for (each in c(length(Lab4Data$Paper.ID):1)){
  if (length(unique(unlist(strsplit(Lab4Data$Paper.ID[each], ",")))) == 1){
    Lab4Data <- Lab4Data[-c(each),]
  }
}

#This line of code will print the number rows containing non-junk Paper IDs.
print(length(Lab4Data$Paper.ID))

# There are 83 papers that are not junk in the dataset














