dirs <- list.dirs("./data-raw")

for (d in dirs[-1]) {
  files <- list.files(d,
                      pattern = "*.dat$|*.data$|*.csv|*.CSV|*.txt|*.TXT|*.R$|*.r$", # *.xls|
                      full.names = TRUE)

  for (f in files) {
    print(f)
#    readline("check?")
    tools:::showNonASCIIfile(f)
  }

}

