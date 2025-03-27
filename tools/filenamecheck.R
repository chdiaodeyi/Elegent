library("rstudioapi")
input.path <- dirname(getActiveDocumentContext()$path)
input.path <- gsub("/tools", "/InputData", input.path)

dir.files <- fs::dir_ls(path = input.path, recurse = TRUE, type = "file")
dir.xlsx <- fs::dir_ls(path = input.path, recurse = TRUE, regexp = ".xlsx")
dir.csv <- fs::dir_ls(path = input.path, recurse = TRUE, regexp = ".csv")

file.basename <- basename(dir.files)
file.path <- substring(dir.files, 76, nchar(dir.files) - nchar(basename(dir.files))-1)
df.file <- data.frame(file.path, file.basename)
writexl::write_xlsx(df.file, "filename and path.xlsx")

dir.folder <- fs::dir_ls(path = input.path, recurse = TRUE, type = "directory")
df.folder <- data.frame(dir.folder)