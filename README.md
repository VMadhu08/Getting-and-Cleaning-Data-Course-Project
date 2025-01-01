# Getting-and-Cleaning-Data-Course-Project

**Purpose**

This project demonstrates the ability to clean and transform wearable computing data. The raw data is collected from the accelerometers of Samsung Galaxy S smartphones during various activities performed by study participants. The final output is a tidy dataset ready for analysis.

**Repository Files**

1. **`run_analysis.R`**
   
    - This R script performs the data cleaning and transformation steps.
      
    - It reads the raw data, processes it, and outputs a tidy dataset.
      
2. **`CodeBook.md`**
   
    - Provides a detailed description of the dataset variables, the transformations applied, and any assumptions made.
      
3. **`tidy_data.txt`**
   
    - The output tidy dataset containing averages of measurements for each activity and subject.

**Data Source**

The original dataset is publicly available at: [Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones).

**How to Run the Script**

1. Download the dataset from the above source.
   
3. Unzip the dataset and set your R working directory to the extracted folder.
   
5. Run the **`run_analysis.R`** script in R.
  ``` 
    source("run_analysis.R")
  ```
6. The tidy dataset will be saved as **`tidy_data.txt`** in the working directory.

**Requirements**

- R (version 4.0.0 or later)

- R packages: dplyr
