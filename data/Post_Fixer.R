rm(list=ls())

files <- list.files("./content/post", pattern = "*md",full.names = TRUE)
files

author <- "author: Rodney J. Dyer"
for( file in files ) {
  fname <- strsplit(file,split="/")[[1]][4]
  date <- paste("date:", paste(strsplit( fname, split="-")[[1]][1:3], collapse="-"))
  
  
  txt <- scan( file, what=character(), sep = "\n")
  
  output <- c(txt[1],author,date,txt[2:length(txt)])
  
  write(output,file=file, sep="\n")
}