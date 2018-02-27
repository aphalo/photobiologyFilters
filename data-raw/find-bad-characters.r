dirs <- list.dirs("./data-raw")

for (d in dirs[-1]) {
  files <- list.files(d,
                      pattern = "*.xls|*.dat$|*.data$|*.csv|*.CSV|*.txt|*.TXT|*.R$|*.r$",
                      full.names = TRUE)

  for (f in files) {
    print(f)
    tools:::showNonASCIIfile(f)
  }

}
