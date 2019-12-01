# Test it all out 
library(tidyverse)
library(tm)
library(reticulate)
test <- system("python pdfannots.py input/test.pdf") #Det her virker!!!

system("python pdfannots.py input/test.pdf")

# Is there any way to do regular expressions on the output diretly in R so i dont have to go to regex101.com?
# Is there any way to print the output from the console into a .txt file so that i could automate the ending of process a bit more?
#     When i'm using either cat("") or capture.output("") it only prints a 0 - can these functions in anyway print characters?
# In my paper, should i then make a guide for setting up reticulate (Python in R) or just provide usefull links to those slides you've send me and another page i used?
# I find it really hard to figure out how to do my references - i have used no references in the way i normally would, more like tutorials 
## reference til reticulate 
# Should our final product be located in teh digital methods github repository or in our own - maybe both?

out <- capture.output(system("python pdfannots.py input/test.pdf"))
print(out)
repl_python()

devtools::install_github("rstudio/reticulate")
install.packages("reticulate")
library(tidyverse)
library(reticulate)
repl_python()

system("python pdfannots.py -p -o testoutput.txt input/a_history_of_medieval_heresy_and_inquisition.pdf")
system("python pdfannots.py --help") #Brings up the help menu

