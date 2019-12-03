#This script runs the Python script pdfannots.py in R and does some streamlining of the end result through the R package "tm"

#First we have to install the reticulate package, which allows us to run python in R
install.packages("reticulate")
library("reticulate")

#Now we will have to locate the file which we are extracting annotations from. In my case it is the "a_history_medieval_heresy_and_inquisition.pdf" file.
## The heresy pdf can be used to check the script, but other PDFs can be used as well. Just be sure to put them in the input folder. 

#From here we will have to run the script using this line: 
##The input/ can be any .pdf file with annotations
### the -p flag shows the progress of the script in the console. the -o output.txt makes a .txt file with the output in it
### You can call the output file whatever makes sence in your case
system("python pdfannots.py -p -o output.txt input/a_history_of_medieval_heresy_and_inquisition.pdf") 

##Textcleaning 
#From here we will have to do some cleaning of the final result. The .txt file can have some huge white spaces which can be removed using regular expressions
## First we will have to get the data. Please copy the output.txt into the messytxts folder at first 
file.copy("output.txt", "messytxts/output.txt")

#Then delete the old output.txt file 
unlink("output.txt")

#Now we will do some textmining
#The fundamentals of this scripts i have found in Adela Sobotkovas TextMiningTutorial GitHub repository at https://github.com/adivea/TextMiningTutorial
#These lines are to get our file from the pdfannots.py script as a corpus
cname <- file.path("./messytxts/")   
cname   
dir(cname)

## Get R packages for text mining
install.packages(tm)
library(tm)

## Lets load texts to R
docs <- VCorpus(DirSource(cname))   
summary(docs)

## For details about documents in the corpus, use the inspect(docs) command.
inspect(docs[1])

# To write out the full text, use writeLines()
class(docs[1])
writeLines(as.character(docs[1]))

#This is the regular expression section to use if there are a lot of \t in the plain text file from writeLines(as.character(docs[1]))
## Furthermore this one changes multiple spaces to a single space
for (j in seq(docs)) {
  docs[[j]] <- gsub("\t"," ", docs[[j]]) 
  docs[[j]] <- gsub(" +"," ", docs[[j]])
}

#To show the file (or one of the files) afterwards use this command again:
writeLines(as.character(docs[1]))

#This command saves the changes to the documents
docs <- tm_map(docs, PlainTextDocument)

#This command exports the clean text to the Results folder
writeCorpus(docs, path = "./results//", filenames = NULL) #Files get named by their number in the corpus, makes no difference when running the script on one file at a time



