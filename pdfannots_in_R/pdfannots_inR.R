#Running pdfannots.py in R

#First we have to install the reticulate package, which allows us to run python in R
install.packages("reticulate")
library("reticulate")

#Now we will have to locate the file which we are extracting annotations from. In my case it is the "a_history_medieval_heresy_and_inquisition.pdf" file.
## The heresy pdf can be used to check the script, but other PDFs can be used as well. Just Be sure to put them in the input folder. 

#From here we will have to run the script using this line: 
##The input/ can be any .pdf file with annotations
### the -p flag shows the progress of the script in the console. the -o output.txt makes a .txt file with the output in it
system("python pdfannots.py -p -o output.txt input/a_history_of_medieval_heresy_and_inquisition.pdf") 

#From here we will have to do some cleaning of the final result. The .txt file can have some huge white spaces which can be removed using regular expressions

## First we will have to get the data. Please move the output.txt into the messytxts folder at first and then do the following:
cname <- file.path("./messytxts/")   
cname   
dir(cname)

## Get R packages for text mining
library(tm)

## Lets load texts to R
docs <- VCorpus(DirSource(cname))   
summary(docs)

## For details about documents in the corpus, use the inspect(docs) command.
inspect(docs[1])

# To write out the full text, use writeLines()
class(docs[1])
writeLines(as.character(docs[1]))

#Removes whitespaces - which usually does the trick for the output of the script
docs <- tm_map(docs, stripWhitespace)

#This is the regular expression section to use if there are a lot of \t in the plain text file from writeLines(as.character(docs[1]))
for (j in seq(docs)) {
  docs[[j]] <- gsub( "\t "," ", docs[[j]])
  docs[[j]] <- gsub( "\t"," ", docs[[j]]) 
}

#To show the file (or one of the files) afterwards use this command again:
writeLines(as.character(docs[1]))

#This command saves the changes to the documents
docs <- tm_map(docs, PlainTextDocument)

