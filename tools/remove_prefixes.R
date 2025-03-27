## This R Script is used by Smart Trans team to remove the regional prefixes of 
## the input data. The prefixes are kept during the work to keep track of the
## variables used to different provincial models. It is removed in the final
## version.
ibrary("rstudioapi")
input.path <- dirname(getActiveDocumentContext()$path)
input.path <- gsub("/tools", "/InputData", input.path)
xlsx.files <- fs::dir_ls(path = input.path, regexp = ".xlsx", recurse = TRUE)
df <- data.frame(xlsx.files, xlsx.files)
df[,2] <- gsub("sd-", "", df[,2])
df[,2] <- gsub("na-", "", df[,2])
df[,2] <- gsub("cn-", "", df[,2])

for (i in 1 : nrow(df)) {
  file.rename(from=df[i,1], to=df[i,2])
}