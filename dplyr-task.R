#Week 4: dplyr package

#Loading titanic data set in a data frame
titanic_data <- as.data.frame(Titanic)

#display the top rows of a titanic dataset
titanic_top_rows <- head(titanic_data)

#Install and call the package dplyr
#install.packages("dplyr") // uncomment this if 'dplyr' package is not installed already
library(dplyr)

#function to 'select' the Survived and Sex columns 
Select_column_titanic <- select(titanic_data,Survived,Sex)

#function to save the two columns as one new dataset and give it a name
titanic_select_dataset <- Select_column_titanic
titanic_select_dataset
#write.csv(Select_column_titanic,"titanic_select_dataset.csv",row.names = FALSE)

#The function that deselects the sex column
deselect_column <- select(titanic_select_dataset, -Sex)

#The function that renames 'Sex' to 'Gender'
rename_column <- rename(Select_column_titanic, Gender = Sex)

#the function to create a new dataset by renaming'Sex' to 'gender' column
titanic_dataset_gender <- titanic_data %>% 
  rename(Gender = Sex) %>%
  select(Survived,Gender,Freq)

#Write the function that includes only rows that are 'male' and 'Female'
male_rows <- filter(titanic_dataset_gender, Gender == "Male")
female_rows <- filter(titanic_dataset_gender, Gender == "Female")

#function to sort the data by gender
sort_data_by_gender <- titanic_dataset_gender %>%
  arrange(Gender)

#function to group the data by gender 
group_data_by_gender <- titanic_dataset_gender %>%
  group_by(Gender) %>%
  summarise(total = sum(Freq))

#TASK: After you run it, write the total here:2201
"Freq" %in% colnames(titanic_data)
people_examined <- sum(titanic_data$Freq)
print(people_examined)

#function that joins the male and female rows 
Gender_rows <- bind_rows(male_rows,female_rows)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
# arrange original dataframe in descending order based on Freq
arrange_dataset_desc<- titanic_data %>%
                       arrange(desc(Freq))

#create a new variable with existing variable using mutate()
mutated_data_age_group <- mutate(titanic_data, age_group = Age)

# Move 'Survived' column before Age column
relocate_column <- titanic_data %>% relocate(Survived, .before = Age)

# To find Summary statistics-sum using summarise()
Sum_Freq_column <- titanic_data %>% summarise(Sum_Freq = sum(Freq))

# To find Summary statistics-mean using summarise()
Mean_Freq_column <- titanic_data %>% summarise(Mean_Freq = mean(Freq))


#slice_head() and slice_tail() to select the first or last rows.
first_five_rows <- titanic_data %>% slice_head(n=5)
last_seven_rows <- titanic_data %>% slice_tail(n=7)



