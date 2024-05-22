kurs <- read.csv("data/kurs.csv")

kurs <- setNames(as.list(kurs$value), kurs$currency)