current_0 <- Sys.time()

library(tidyverse)
library(dplyr)
library(rpart)
library(rpart.plot)
library(caret)
library(caTools)
library(earth)
library(mda)
library(ROSE)

data <- read.csv("dataset.csv")
ukuran_data <- dim(data)
head_data <- head(data)
write.csv(head_data,"head_data.csv")

# Imputation

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


#percent missing value threshold = 10% (bennet 2001)
#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3701793/

kolom_delete <- kolom_NA %>% filter(percen_freq > 10)
kolom_NA <- kolom_NA %>%
              filter(percen_freq <= 10)

data <- data %>% select(-c(kolom_delete$Nama_Kolom))

# MAR karena tolak Null hypothesis
#mcar_test(data)

# pembagian kolom NA berdasarkan tipe data 
int_kat <- names(which(lapply(data[kolom_NA$Nama_Kolom],class) == "integer"))
flo_num <- names(which(lapply(data[kolom_NA$Nama_Kolom],class) == "numeric"))

kolom_NA_cat <- kolom_NA %>% filter(Nama_Kolom %in% int_kat) %>% select(Nama_Kolom)
kolom_NA_cat <- kolom_NA_cat$Nama_Kolom

kolom_NA_num <- kolom_NA %>% filter(Nama_Kolom %in% flo_num) %>% select(Nama_Kolom)
kolom_NA_num <- kolom_NA_num$Nama_Kolom


# median numeric imputation
for(kolomku in kolom_NA_num){
  data[[kolomku]][is.na(data[[kolomku]])] = median(data[[kolomku]],na.rm=T)
}

kolom_NA_cat_factor <- c()
kolom_NA_cat_int <- c()
for(kolom in kolom_NA_cat){
  banyak_unique <- length(unique(data[[kolom]]))
  if(banyak_unique > 10){
    kolom_NA_cat_int <- c(kolom_NA_cat_int,kolom)
  } else{
    kolom_NA_cat_factor <- c(kolom_NA_cat_factor,kolom)
  }
}

# median integer imputation
for(kolomku in kolom_NA_cat_int){
  data[[kolomku]][is.na(data[[kolomku]])] = median(data[[kolomku]],na.rm=T)
}

# mode factor imputation
for(kolomku in kolom_NA_cat_factor){
  data[[kolomku]][is.na(data[[kolomku]])] = as.numeric(names(sort(-table(data[[kolomku]])))[1])
  data[[kolomku]] <- as.factor(data[[kolomku]])
}


# Selecting Feature (Deleting id) because dont dependending for evaluation.

data <- data %>% select(-c(encounter_id,patient_id,
                           hospital_id,icu_id))


# Imputation and Discrezation Dataset
kol_char <- names(which(lapply(data,class)=="character"))

for(kol in kol_char){
  mode_impute <- names(sort(-table(data[[kol]])))[1]
   data[[kol]] <- replace(data[[kol]],data[[kol]]=="",mode_impute)
   data[[kol]] <- as.factor(data[[kol]])
}
head(data)

data <- data %>%
mutate(hospital_death = case_when(hospital_death == 0 ~ 'Survived',
                                  hospital_death == 1 ~ 'Death'))
data$hospital_death <- factor(data$hospital_death,levels = c("Survived","Death"),labels = c("Survived","Death"))
names(data)


# feature engineering
## averaging dataset
data$d1_diasbp <- (data$d1_diasbp_min + 
                     data$d1_diasbp_max)/2
data$d1_diasbp_noninvasive <- (data$d1_diasbp_noninvasive_min + 
                                 data$d1_diasbp_noninvasive_max)/2
data$d1_heartrate <- (data$d1_heartrate_min + 
                   data$d1_heartrate_max) / 2
data$d1_mbp <- (data$d1_mbp_max + data$d1_mbp_min)/2
data$d1_mbp_noninvasive <- (data$d1_mbp_noninvasive_max +
                            data$d1_mbp_noninvasive_min)/2
data$d1_glucose <- (data$d1_glucose_max + data$d1_glucose_min)/2
data$d1_resprate <- (data$d1_resprate_min + data$d1_resprate_max)/2
data$d1_sysbp <- (data$d1_sysbp_min + data$d1_sysbp_max)/2
data$d1_sysbp_noninvasive <- (data$d1_sysbp_noninvasive_max + 
                                data$d1_sysbp_noninvasive_min)/2
data$d1_temp <- (data$d1_temp_min + data$d1_temp_max)/2
data$h1_diasbp <- (data$h1_diasbp_max + data$h1_diasbp_min)/2
data$h1_diasbp_noninvasive <- (data$h1_diasbp_noninvasive_min + 
                                 data$h1_diasbp_noninvasive_max)/2
data$h1_heartrate <- (data$h1_heartrate_min  + data$h1_heartrate_max)/2
data$h1_mbp <- (data$h1_mbp_max + data$h1_mbp_min)/2
data$h1_mbp_noninvasive <- (data$h1_mbp_noninvasive_max + 
                              data$h1_mbp_noninvasive_min)/2
data$h1_resprate <- (data$h1_resprate_min + data$h1_resprate_max)
data$h1_spo2 <- (data$h1_spo2_min + data$h1_spo2_max)/2
data$h1_sysbp <- (data$h1_sysbp_max + data$h1_sysbp_min)/2
data$h1_sysbp_noninvasive <- (data$h1_sysbp_noninvasive_max + 
                                data$h1_diasbp_noninvasive_min)/2


data <- data %>% select(-c(d1_diasbp_min,d1_diasbp_max,
                           d1_diasbp_noninvasive_max,d1_diasbp_noninvasive_min,
                           d1_glucose_max,d1_glucose_min,
                           d1_heartrate_max,d1_heartrate_min,
                           d1_mbp_max,d1_mbp_min,d1_mbp_noninvasive_max,
                           d1_mbp_min,d1_resprate_min,d1_resprate_max,
                           d1_spo2_max,d1_spo2_min,d1_sysbp_max,d1_sysbp_min,
                           d1_sysbp_max,d1_sysbp_min,d1_sysbp_noninvasive_max,
                           d1_sysbp_noninvasive_min,d1_temp_max,d1_temp_min,
                           h1_diasbp_max,h1_diasbp_min,h1_diasbp_noninvasive_max,
                           h1_diasbp_noninvasive_min,h1_heartrate_max,h1_heartrate_min,
                           h1_mbp_min,h1_mbp_max,h1_mbp_noninvasive_max,
                           h1_mbp_noninvasive_min,h1_resprate_max,h1_resprate_min,
                           h1_spo2_max,h1_spo2_min,h1_sysbp_max,h1_sysbp_min,
                           h1_sysbp_noninvasive_min,h1_sysbp_noninvasive_max
                           ))



# N_min <- min(unname(table(data$hospital_death)))
# data <- ovun.sample(hospital_death ~ ., data=data,N=2*N_min ,seed=1234)$data

# Splitting Data
# set.seed(1234)
# ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
# trainData <- data[ind == 1,]
# testData <- data[ind == 2,]

# feature selection 
# FDA_Model <- train(hospital_death ~ . , data = trainData, method='fda')
# FDA_Imp <- varImp(FDA_Model)
# FDA_Model_Imp <- FDA_Imp$importance
# FDA_Model_Imp <- FDA_Model_Imp %>% filter(Overall>0)
# feature_selected <- rownames(FDA_Model_Imp)
# feature_selected[8] <- substr(feature_selected[8],1,nchar(feature_selected[8])-1)
# feature_selected[9] <- substr(feature_selected[9],1,nchar(feature_selected[9])-1)
# feature_selected <- c(feature_selected,"hospital_death")
# feature_selected <- gsub("`","",feature_selected)
# feature_selected <- gsub("^(.*)\\d$","\\1",feature_selected)
# feature_selected <- gsub("^(icu_[a-z|_]*)[A-Z].*$","\\1",feature_selected)
# feature_selected <- gsub("^(apache_[0-9|a-z|_]*)[A-Z].*$","\\1",feature_selected)

# print(feature_selected)
# setdiff(feature_selected,names(data))
# names(data)[grep("^apache_",names(data))]

# trainData <- trainData[,feature_selected]
# testData <- testData[,feature_selected]
# 
# current_1 <- Sys.time()
# deltatime_pre <- current_1 - current_0
# print("Preprocessing Time :")
# print(deltatime_pre)

names(data)