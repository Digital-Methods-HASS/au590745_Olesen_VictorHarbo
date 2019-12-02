install.packages("Rtools") #Installs Rtools package
install.packages("reticulate") #Installs reticulate package
library("reticulate") #Loads reticulate package - now the exotic animal (python) can live in your home (Rstudio)

repl_python() #This command opens the python console and lets you use python commands directly in R
# To run the pdfannots.py script this commands is not used. See the system() commands

# Different commands comming with the reticulate package 
py_run_file("FILENAME.PY") #Runs a python file ending in .py - this is the typical form of scripts 
py_run_string("STRING") #Runs a string in python
source_python("FILENAME.PY") #This sources a python.py file - does almost the same as py_run_file
system("python pdfannots.py PATH TO FILE") #This command runs the pdfannots.py script with the path to the .pdf file to run it on

# Commands to run the script with an INFILE and aan output file
system("python pdfannots.py input/FILENAME") #This command runs the script directly in the console 
system("python pdfannots.py -p -o testoutput.txt input/INFILE") #This command tuns the script, showing the progress in the console and gives the result in a .txt file called "testoutput.txt"
system("python pdfannots.py --help") #Brings up the help menu



