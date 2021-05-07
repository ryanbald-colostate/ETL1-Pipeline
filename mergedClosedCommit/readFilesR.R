diretorio <- "D:/base"
arquivos <- list.files(diretorio, pattern = "*.PDF")
quantidade <- length(arquivos)

#
df = NULL
for (k in 1:quantidade) {
  
  nome = arquivos[k]
  print(nome)
  Sys.sleep(1) 
  dados = read_pdf(arquivos[k],ocr = T)
  print(dados)
  Sys.sleep(1)
  df = rbind(df, data.frame(nome,dados))
  Sys.sleep(1)
}
Encoding(df$text) <- "UTF-8"