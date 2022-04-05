library(tidyverse)

data <- read.csv("dataset.csv")
ukuran_data <- dim(data)

# Check column if have NA's
kolom_NA <- data.frame(as.list(colSums(is.na(data))))
kolom_NA <- as.data.frame(t(kolom_NA))
colnames(kolom_NA) <- c("freq")

# pipelining https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf
kolom_NA <- kolom_NA %>% 
  filter(freq > 0) %>% 
  mutate(percen_freq = freq / ukuran_data[1] * 100)
print(kolom_NA)