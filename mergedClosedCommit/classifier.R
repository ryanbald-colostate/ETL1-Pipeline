datCommits = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/merged-closed-commits (3).csv", sep = "\a", header = TRUE)
datPulls = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/merged-closed-pulls.csv", sep = "\a", header = TRUE)

colnames(datCommits)
colnames(datPulls)
#datC50 <- datCommits[1:500,]
#datP50 <- datPulls[1:500,]
datC50 <- datCommits
datP50 <- datPulls
nrow(datC50)
nrow(datP50)
#data <- na.omit(dat50)
#datC3 <- datC50[1:3,]
#datP3 <- datP50[1:3,]
#nrow(datC3)
#for (row in 1:nrow(data)) {
datRow <- NULL
datClass <- NULL
datLog <- NULL
nrow(datRow)
datRow <-data.frame("author" = character(0), "file" =  character(0), "text" = character(0), "commit" = character(0),"PR" = numeric(), stringsAsFactors=FALSE)
datClass <- data.frame("PR.Number"= numeric(), "author" = character(0), "Title"= character(0), "Body"= character(0), "Commit.Message"= character(0), "file"= character(0), "Skill"= character(0), "Date.Closed"= character(0), "Patch.text"= character(0), stringsAsFactors=FALSE)
datLog <- data.frame("PR"= numeric(),"PRP"= numeric())
#df <- data.frame("hello"= character(0), "goodbye"=character(0), stringsAsFactors=FALSE)
for (row in 1:nrow(datC50)) {
  file_name <- datC50[row, "file.name"]
  text  <- datC50[row, "Patch.text"]
  author  <- datC50[row, "Author.login"]
  committer  <- datC50[row, "Committer.login"]
  commit  <- datC50[row, "Commit.Message"]
  pr <- datC50[row, "PR.number"]
  if(is.na(file_name)||file_name==" "||file_name=='N/A') {
    print(paste("file vazio:",pr))
  }
  else {
    achei <- 0
    for (rowP in 1:nrow(datP50)) {
      #print(paste("file ",file_name))
      prP <- datP50[rowP, "PR"]
      #print(paste( "PR C ",pr, "PR P", prP))
      #datLog = rbind(datLog, data.frame(pr,prP))
      
      if(pr == prP){
        achei <- 1  
        title <- datP50[rowP, "Title"]
        body <- datP50[rowP, "Body"]
        date_closed <- datP50[rowP, "Date.Closed"]
        skill <- "---"
        
        print(paste("Author ", author, "Date Closed ", date_closed, "PR C ",pr, "PR P", prP))
        
        #rbind(datRow,list(author,file_name,text))
        #datRow[nrow(datRow) + 1,] = list("a",file_name,text)
        datRow = rbind(datRow, data.frame(author,file_name,text))
        datClass = rbind(datClass, data.frame(pr, author, title, body, commit, file_name, skill, date_closed, text))
      }
    }
    if (achei==0){
      datLog = rbind(datLog, data.frame(pr,0))
      print(paste( "PR C :",pr, "Achei:", achei))
      
    }
  }
}
write.table(datRow, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/authorFilePatch.txt"), sep = "\t", row.names = TRUE, col.names = NA)
write.csv(datClass, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/authorFilePatch.csv"), sep = "\a", row.names = TRUE, col.names = TRUE)
write.csv(datLog, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/authorFilePatchLog.csv"), row.names = TRUE, col.names = TRUE)

#newdata <- dat50[which(dat50$file_name!='N/A'), c(1,2)]

#dat50[!complete.cases(dat50),]

#if (is.null(x) || x == '') {

