library(openxlsx)
library(readxl)
library(tidyverse)
#measles_DB <- excel_sheets("C:/Users/ijdoc/Desktop/R_Directory/Measles_DB.xlsx")
#measles_DB

MSL_DB <- excel_sheets("C:/Users/ijdoc/Desktop/Measles_DB.xlsx")
MSL_DB
DB <- read_excel("C:/Users/ijdoc/Desktop/Measles_DB.xlsx", sheet = 'Database_2025')
DB
DB <- unique(DB)


DB %>% 
  filter(!is.na(IDNumber)) %>% # Keeps all the cases with ID numbers
  distinct(ProvinceOfResidence,DistrictofResidence) %>%  # unique Province & District in the dataset
  count(ProvinceOfResidence, name = 'Num_LGAs') # Counts all the district that reported cases by province of residence.
  

summary_table <- DB %>%
  filter(!is.na(IDNumber)) %>% 
  group_by(ProvinceOfResidence) %>% 
  summarise(
    NumDistricts = n_distinct(DistrictofResidence),
    TotalCases   = n(),
    
    # Percent IGM positive
    percent_IGM_pos = sum(MeaslesIgm == 1, na.rm = TRUE) / TotalCases * 100,
    
    # Count compatible cases
    Compatible_cases = sum(FinalClassification == 3, na.rm = TRUE),
    
    # Count without lab results
    without_labResults = sum(MeaslesIgm == 5, na.rm = TRUE),
    
    # Count cases with lab results (values 1–4)
    percent_withlabRes = sum(MeaslesIgm %in% c(1,2,3,4), na.rm = TRUE)
  ) %>% 
  mutate(across(starts_with('percent'),round,0))
summary_table

