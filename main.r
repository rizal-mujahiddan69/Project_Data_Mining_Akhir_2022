library(tidyverse)
library(dplyr)

data <- read.csv("dataset.csv")
ukuran_data <- dim(data)

# Check column if have NA's
kolom_NA <- data.frame(as.list(colSums(is.na(data))))
kolom_NA <- as.data.frame(t(kolom_NA))
kolom_NA <- data.frame(names = row.names(kolom_NA), kolom_NA)
rownames(kolom_NA) <- NULL
colnames(kolom_NA) <- c("Nama_Kolom","freq")

# pipelining https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf
kolom_NA <- kolom_NA %>% 
              mutate(percen_freq = freq / ukuran_data[1] * 100) %>% 
              filter(freq > 0)
print(kolom_NA)

#percent missing value threshold = 10% (bennet 2001)
#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3701793/

kolom_delete <- kolom_NA %>% filter(percen_freq > 10)
kolom_NA <- kolom_NA %>%
              filter(percen_freq <= 10)


data <- data %>% select(-c(kolom_delete$Nama_Kolom))


