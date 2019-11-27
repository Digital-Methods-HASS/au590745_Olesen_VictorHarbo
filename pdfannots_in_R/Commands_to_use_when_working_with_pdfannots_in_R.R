install.packages("Rtools") #Installs Rtools package
install.packages("reticulate") #Installs reticulate package
library("reticulate") #Loads reticulate package - now the exotic animal (python) can live in your home (Rstudio)

repl_python() #Opens python in R

# Different commands comming with the reticulate package 
py_run_file("FILENAME.PY") #Runs a python file ending in .py - this is the typical form of scripts 
py_run_string("STRING") #Runs a string in python
source_python("FILENAME.PY") #This sources a python.py file - does almost the same as py_run_file
system("python pdfannots.py PATH TO FILE") #This command runs the pdfannots.py script with the path to the .pdf file to run it on

# DENNE COMMAND GØR AT MAN KAN KØRE SCRIPTET MED EN INFILE
system("python pdfannots.py input/test.pdf") #Det her virker!!!

