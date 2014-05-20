oldwd <- setwd("raw_data/Schott/")
shell("schott2twocol", "bash")
setwd("done")
read.csv("gg400.csv", col.names=c("w.length", "Tfr"), header = FALSE)
