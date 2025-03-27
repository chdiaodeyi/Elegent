library("rstudioapi")
input.path <- dirname(getActiveDocumentContext()$path)
input.path <- gsub("/tools", "/InputData", input.path)

dir.files <- fs::dir_ls(path = input.path, recurse = TRUE, type = "file")
dir.xlsx <- fs::dir_ls(path = input.path, recurse = TRUE, regexp = ".xlsx")
dir.csv <- fs::dir_ls(path = input.path, recurse = TRUE, regexp = ".csv")
dir.folder <- fs::dir_ls(path = input.path, recurse = TRUE, type = "directory")
df.folder <- data.frame(basename(dir.folder))
df.xlsx.sh <- data.frame(basename(dir.xlsx))
df.csv.sh <- data.frame(basename(dir.csv))
df.xlsx.sh$varname <- substring(df.xlsx.sh$basename.dir.xlsx.,4,nchar(df.xlsx.sh$basename.dir.xlsx.))
# df.folder[,2:5] <- ""
# for (i in 1 : length(dir.folder)){
#   folder.files <-  fs::dir_ls(path = dir.folder[i], recurse = FALSE, type = "file")
#   folder.csv <-  fs::dir_ls(path = dir.folder[i], recurse = FALSE, regexp = ".csv")
#   folder.files <- folder.files[!(folder.files %in% folder.csv)]
#   if(length(folder.files) >0) {
#     df.folder[i, 2:(1+length(folder.files))] <- folder.files
#   }
# }
# unique(df.folder[,3])
# dir.csvcap <- fs::dir_ls(path = input.path, recurse = TRUE, regexp = ".CSV")
# dir.xlsx.sd <- dir.xlsx[grepl("sd-", basename(dir.xlsx))]
# 
# dir.csvcap
# dir.xlsx.sd
# dir.csvcap <- dir.csvcap[!grepl("CSV Export Tool.xlsm", dir.csvcap)]
# df.CSV <- data.frame(dir.csvcap,dir.csvcap)
# df.CSV[,2] <- gsub(".CSV", ".csv", df.CSV[,2])
# for (i in 1 : nrow(df.CSV)) {
#   file.rename(from=df.CSV[i,1], to=df.CSV[i,2])
# }