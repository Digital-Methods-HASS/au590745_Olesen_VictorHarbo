# Test it all out 

test <- system("python pdfannots.py input/test.pdf") #Det her virker!!!

system("python pdfannots.py input/test.pdf")

# Is there any way to do regular expressions on the output diretly in R so i dont have to go to regex101.com?
# Is there any way to print the output from the console into a .txt file so that i could automate the ending process a bit more?
#     When i'm using either cat("") or capture.output("") it only prints a 0 - can these functions in anyway print characters?
# In my paper, should i then make a guide for setting up reticulate (Python in R) or just provide usefull links to those slides you've send me and another page i used?
# How do i make working hyperlinks in overleaf?

out <- capture.output(system("python pdfannots.py input/test.pdf"))
print(out)
repl_python()

devtools::install_github("rstudio/reticulate")
install.packages("reticulate")
repl_python()
