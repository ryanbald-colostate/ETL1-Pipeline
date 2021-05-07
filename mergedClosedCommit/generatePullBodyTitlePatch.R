#dat = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/mergedClosedCommit/merged-closed-commits.csv", sep = "\a", header = TRUE)
datCommits = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/merged-closed-commits (3).csv", sep = "\a", header = TRUE)
datPulls = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/merged-closed-pulls.csv", sep = "\a", header = TRUE)

colnames(datCommits)
dat50 <- datCommits[1:50,]
nrow(dat50)
#data <- na.omit(dat50)
data <- dat50[1:3,]
nrow(data)
#for (row in 1:nrow(data)) {
datRow <- NULL
nrow(datRow)
datRow <-data.frame("author" = character(0), "file" =  character(0), "text" = character(0), body = character(0), title = character(0), stringsAsFactors=FALSE)
#df <- data.frame("hello"= character(0), "goodbye"=character(0), stringsAsFactors=FALSE)
for (row in 1:nrow(dat50)) {
  pr <- dat50[row, "PR.number"]
  body <- ""
  title <- ""
  for (rowPull in 1:nrow(datPulls)){
     pR <- datPulls[rowPull, "PR"]
     print(paste("pr commits ", pr, " pr pulls ", pR))
     if (pr==pR){
       body <- datPulls[rowPull, "Body"]
       title <- datPulls[rowPull, "Title"]
       print(paste("Found! pr commits ", pr, " title ", title))
       
     }
  }
  file_name <- dat50[row, "file.name"]
  text  <- dat50[row, "Patch.text"]
  author  <- dat50[row, "Author.login"]
  committer  <- dat50[row, "Committer.login"]
  if(is.na(file_name)||file_name==" "||file_name=='N/A') {
    print("file vazio")
  }
  else {
    #print(paste("file ",file_name))
    
    print(paste("Author ", author, " Committer ", committer, " file ",file_name, " title ", title))
    
    #rbind(datRow,list(author,file_name,text))
    #datRow[nrow(datRow) + 1,] = list("a",file_name,text)
    datRow = rbind(datRow, data.frame(author,file_name,text,body,title))
    
  }
}
write.table(datRow, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/authorFilePatchBodyTitle.txt"), sep = "\t", row.names = TRUE, col.names = NA)
write.csv(datRow, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/authorFilePatchBodyTitle.csv"), row.names = TRUE, col.names = TRUE)

#newdata <- dat50[which(dat50$file_name!='N/A'), c(1,2)]

#dat50[!complete.cases(dat50),]

#if (is.null(x) || x == '') {

