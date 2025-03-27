library("rstudioapi")
input.path <- dirname(getActiveDocumentContext()$path)
input.path <- gsub("/tools", "/InputData", input.path)
model.name <- strsplit(input.path,"/")[[1]][length(strsplit(input.path,"/")[[1]])-1]
csv.files <- fs::dir_ls(path = input.path, regexp = ".csv", recurse = TRUE)
df <- data.frame(matrix(ncol = 120, nrow = 0))

for (i in 1 : length(csv.files)) {
  input <- read.csv(csv.files[i], header = FALSE)
  output <- rep("",120)
  output[1] <- basename(csv.files[i])
  output[2: (ncol(input) + 1)] <- unlist(input[1,])
  df <- rbind(df, output)
}
df2 <- df[,1:2]
df2$max.year <- NA
for(j in 1 : nrow(df)){
  max.year <- max(as.numeric(unlist(df[j,3:120])), na.rm = TRUE)
  df2$max.year[j] <- max.year
}
write.csv(df, paste0(gsub("InputData", "", input.path), model.name,"-csv-headers.csv"))
