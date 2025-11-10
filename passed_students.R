library(readxl)
dataset <- read_excel("C:/Users/Desktop/R_Directory/combinedData.xlsx")
dataset

library(magrittr)
#Filtering Students not in SS1 A with Excellent grading
dataset %>% 
  filter(Class != 'SS1 A') %>%
  filter(Grading == 'Excellent')

#Filtering some particular students 
dataset %>% 
  filter(Name == 'Ikechukwu' | Name == 'Sam') 

#Determining the index of the column name: Name
which(colnames(dataset) == 'TestScores')

#Selecting particular Columns
Test_Grad_data <- dataset %>% 
  select(2,4:5)
Test_Grad_data

#Removing students that failed
passed_stud <- Test_Grad_data %>% 
              filter(Grading != 'Failed') 
passed_stud


library(openxlsx)
write.xlsx(passed_stud,"C:/Users/Desktop/R_Directory/passed_students.xlsx")
getwd()
