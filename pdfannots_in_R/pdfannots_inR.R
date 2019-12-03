#Running pdfannots.py by Andrew Baumann in R

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
## First we will have to get the data. Please copy the output.txt into the messytxts folder at first 
file.copy("output.txt", "messytxts/output.txt")

#Then delete the old output.txt file 
unlink("output.txt")




