---
title: "Exploratory"
author: "Rizal Mujahiddan"
date: "4/22/2022"
output: 
  html_document:
    keep_md:  true
  pdf_document: default
---



# Introduction
## Data Awal


```{=html}
<div id="htmlwidget-109acc27e867dcfb3adb" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-109acc27e867dcfb3adb">{"x":{"filter":"none","vertical":false,"extensions":["FixedColumns"],"data":[["1","2","3","4","5","6"],[68,77,25,81,19,67],[22.73,27.42,31.95,22.64,27.65465458,27.56],[0,0,0,1,0,0],["Caucasian","Caucasian","Caucasian","Caucasian","Caucasian","Caucasian"],["M","F","F","F","M","M"],[180.3,160,172.7,165.1,188,190.5],["Floor","Floor","Accident &amp; Emergency","Operating Room / Recovery","Accident &amp; Emergency","Accident &amp; Emergency"],["admit","admit","admit","admit","admit","admit"],["CTICU","Med-Surg ICU","Med-Surg ICU","CTICU","Med-Surg ICU","Med-Surg ICU"],[0.541666667,0.927777778,0.000694444,0.000694444,0.073611111,0.000694444],[73.9,70.2,95.3,61.7,80.3,100],[113,108,122,203,119,301],[502.01,203.01,703.03,1206.03,601.01,403.01],[0,0,0,1,0,0],["0","0","0","0","0","0"],["3","1","3","4","4","4"],["6","3","6","6","6","6"],["0","0","0","0","0","0"],["4","1","5","5","5","5"],[118,120,102,114,60,113],["0","0","0","1","0","0"],[40,46,68,60,103,130],[36,33,37,4,16,35],[39.3,35.1,36.7,34.8,36.7,36.6],["0","1","0","1","0","0"],[68,95,88,48,99,100],[37,31,48,42,57,61],[68,95,88,48,99,100],[37,31,48,42,57,61],[119,118,96,116,89,113],[72,72,68,92,60,83],[89,120,102,84,104,127],[46,38,68,84,90,80],[89,120,102,84,104,127],[46,38,68,84,90,80],[34,32,21,23,18,32],[10,12,8,7,16,10],[100,100,98,100,100,97],[74,70,91,95,96,91],[131,159,148,158,147,173],[73,67,105,84,120,107],[131,159,148,158,147,173],[73,67,105,84,120,107],[39.9,36.3,37,38,37.2,36.8],[37.2,35.1,36.7,34.8,36.7,36.6],[68,61,88,62,99,89],[63,48,58,44,68,89],[68,61,88,74,99,89],[63,48,58,62,68,89],[119,114,96,100,89,83],[108,100,78,96,76,83],[86,85,91,92,104,111],[85,57,83,71,92,111],[86,85,91,90,104,111],[85,57,83,79,92,111],[26,31,20,12,21,12],[18,28,16,11,16,12],[100,95,98,100,100,97],[74,70,91,99,100,97],[131,95,148,136,130,143],[115,71,124,106,120,143],[131,95,148,130,130,143],[115,71,124,115,120,143],[168,145,150,185,150,156],[109,128,107,88,107,125],[0.1,0.47,0,0.04,0.05,0.05],[0.05,0.29,0,0.03,0.02,0.02],["0","0","0","0","0","0"],["0","0","0","0","0","0"],["1","1","0","0","0","1"],["0","0","0","0","0","0"],["0","0","0","0","0","0"],["0","0","0","0","0","0"],["0","0","0","0","0","0"],["0","0","0","0","0","0"],["Sepsis","Respiratory","Metabolic","Cardiovascular","Trauma","Neurological"],["Cardiovascular","Respiratory","Metabolic","Cardiovascular","Trauma","Neurologic"],["0","0","0","0","0","0"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>age<\/th>\n      <th>bmi<\/th>\n      <th>elective_surgery<\/th>\n      <th>ethnicity<\/th>\n      <th>gender<\/th>\n      <th>height<\/th>\n      <th>icu_admit_source<\/th>\n      <th>icu_stay_type<\/th>\n      <th>icu_type<\/th>\n      <th>pre_icu_los_days<\/th>\n      <th>weight<\/th>\n      <th>apache_2_diagnosis<\/th>\n      <th>apache_3j_diagnosis<\/th>\n      <th>apache_post_operative<\/th>\n      <th>arf_apache<\/th>\n      <th>gcs_eyes_apache<\/th>\n      <th>gcs_motor_apache<\/th>\n      <th>gcs_unable_apache<\/th>\n      <th>gcs_verbal_apache<\/th>\n      <th>heart_rate_apache<\/th>\n      <th>intubated_apache<\/th>\n      <th>map_apache<\/th>\n      <th>resprate_apache<\/th>\n      <th>temp_apache<\/th>\n      <th>ventilated_apache<\/th>\n      <th>d1_diasbp_max<\/th>\n      <th>d1_diasbp_min<\/th>\n      <th>d1_diasbp_noninvasive_max<\/th>\n      <th>d1_diasbp_noninvasive_min<\/th>\n      <th>d1_heartrate_max<\/th>\n      <th>d1_heartrate_min<\/th>\n      <th>d1_mbp_max<\/th>\n      <th>d1_mbp_min<\/th>\n      <th>d1_mbp_noninvasive_max<\/th>\n      <th>d1_mbp_noninvasive_min<\/th>\n      <th>d1_resprate_max<\/th>\n      <th>d1_resprate_min<\/th>\n      <th>d1_spo2_max<\/th>\n      <th>d1_spo2_min<\/th>\n      <th>d1_sysbp_max<\/th>\n      <th>d1_sysbp_min<\/th>\n      <th>d1_sysbp_noninvasive_max<\/th>\n      <th>d1_sysbp_noninvasive_min<\/th>\n      <th>d1_temp_max<\/th>\n      <th>d1_temp_min<\/th>\n      <th>h1_diasbp_max<\/th>\n      <th>h1_diasbp_min<\/th>\n      <th>h1_diasbp_noninvasive_max<\/th>\n      <th>h1_diasbp_noninvasive_min<\/th>\n      <th>h1_heartrate_max<\/th>\n      <th>h1_heartrate_min<\/th>\n      <th>h1_mbp_max<\/th>\n      <th>h1_mbp_min<\/th>\n      <th>h1_mbp_noninvasive_max<\/th>\n      <th>h1_mbp_noninvasive_min<\/th>\n      <th>h1_resprate_max<\/th>\n      <th>h1_resprate_min<\/th>\n      <th>h1_spo2_max<\/th>\n      <th>h1_spo2_min<\/th>\n      <th>h1_sysbp_max<\/th>\n      <th>h1_sysbp_min<\/th>\n      <th>h1_sysbp_noninvasive_max<\/th>\n      <th>h1_sysbp_noninvasive_min<\/th>\n      <th>d1_glucose_max<\/th>\n      <th>d1_glucose_min<\/th>\n      <th>apache_4a_hospital_death_prob<\/th>\n      <th>apache_4a_icu_death_prob<\/th>\n      <th>aids<\/th>\n      <th>cirrhosis<\/th>\n      <th>diabetes_mellitus<\/th>\n      <th>hepatic_failure<\/th>\n      <th>immunosuppression<\/th>\n      <th>leukemia<\/th>\n      <th>lymphoma<\/th>\n      <th>solid_tumor_with_metastasis<\/th>\n      <th>apache_3j_bodysystem<\/th>\n      <th>apache_2_bodysystem<\/th>\n      <th>hospital_death<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","scrollX":true,"fixedColumns":{"leftColumns":1},"columnDefs":[{"className":"dt-right","targets":[1,2,3,6,10,11,12,13,14,20,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```
Jika anda menghitungnya, maka tabel ini memiliki 78 kolom dan kira kira 91713 baris. 

```
##  [1] "age"                           "bmi"                          
##  [3] "elective_surgery"              "ethnicity"                    
##  [5] "gender"                        "height"                       
##  [7] "icu_admit_source"              "icu_stay_type"                
##  [9] "icu_type"                      "pre_icu_los_days"             
## [11] "weight"                        "apache_2_diagnosis"           
## [13] "apache_3j_diagnosis"           "apache_post_operative"        
## [15] "arf_apache"                    "gcs_eyes_apache"              
## [17] "gcs_motor_apache"              "gcs_unable_apache"            
## [19] "gcs_verbal_apache"             "heart_rate_apache"            
## [21] "intubated_apache"              "map_apache"                   
## [23] "resprate_apache"               "temp_apache"                  
## [25] "ventilated_apache"             "d1_diasbp_max"                
## [27] "d1_diasbp_min"                 "d1_diasbp_noninvasive_max"    
## [29] "d1_diasbp_noninvasive_min"     "d1_heartrate_max"             
## [31] "d1_heartrate_min"              "d1_mbp_max"                   
## [33] "d1_mbp_min"                    "d1_mbp_noninvasive_max"       
## [35] "d1_mbp_noninvasive_min"        "d1_resprate_max"              
## [37] "d1_resprate_min"               "d1_spo2_max"                  
## [39] "d1_spo2_min"                   "d1_sysbp_max"                 
## [41] "d1_sysbp_min"                  "d1_sysbp_noninvasive_max"     
## [43] "d1_sysbp_noninvasive_min"      "d1_temp_max"                  
## [45] "d1_temp_min"                   "h1_diasbp_max"                
## [47] "h1_diasbp_min"                 "h1_diasbp_noninvasive_max"    
## [49] "h1_diasbp_noninvasive_min"     "h1_heartrate_max"             
## [51] "h1_heartrate_min"              "h1_mbp_max"                   
## [53] "h1_mbp_min"                    "h1_mbp_noninvasive_max"       
## [55] "h1_mbp_noninvasive_min"        "h1_resprate_max"              
## [57] "h1_resprate_min"               "h1_spo2_max"                  
## [59] "h1_spo2_min"                   "h1_sysbp_max"                 
## [61] "h1_sysbp_min"                  "h1_sysbp_noninvasive_max"     
## [63] "h1_sysbp_noninvasive_min"      "d1_glucose_max"               
## [65] "d1_glucose_min"                "apache_4a_hospital_death_prob"
## [67] "apache_4a_icu_death_prob"      "aids"                         
## [69] "cirrhosis"                     "diabetes_mellitus"            
## [71] "hepatic_failure"               "immunosuppression"            
## [73] "leukemia"                      "lymphoma"                     
## [75] "solid_tumor_with_metastasis"   "apache_3j_bodysystem"         
## [77] "apache_2_bodysystem"           "hospital_death"
```

![](Exploratory_files/figure-html/unnamed-chunk-3-1.png)<!-- -->


```
## Warning: package 'viridis' is in use and will not be installed
```




