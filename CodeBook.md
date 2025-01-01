# CodeBook for Tidy Dataset

**1. Source Data**

  The data used in this project is sourced from the Human Activity Recognition Using Smartphones Dataset, which contains measurements collected from the accelerometers and gyroscopes of Samsung Galaxy S smartphones during six different activities performed by 30 subjects.

**2. Variables in the Tidy Dataset**

**Identifiers**

  - **Subject:** An integer representing the ID of the participant (range: 1-30).
    
  - **Activity:** A descriptive label for the activity performed by the participant (e.g., WALKING, SITTING).

**Measurements**
  - Variables represent the average of each measurement for each activity and subject.
    
  - Examples:
    
      - **TimeBodyAccelerometerMeanX:** Mean of time-domain body accelerometer signal in the X direction.
        
      - **FrequencyBodyAccelerometerSTDZ:** Standard deviation of frequency-domain body accelerometer signal in the Z direction.

**Activity Labels**

- WALKING

- WALKING_UPSTAIRS

- WALKING_DOWNSTAIRS

- SITTING

- STANDING

- LAYING

**3. Data Transformations**

  1. **Merging Datasets:** Combined training and test datasets into a single dataset.

  2. **Selecting Relevant Columns:** Extracted only columns containing mean or standard deviation measurements.

  3. **Descriptive Activity Names:** Replaced activity codes with descriptive activity labels using the **`activity_labels.txt`** file.

  4. **Variable Renaming:** Renamed variables with descriptive and human-readable names:
     
       - Replaced prefixes **`t`** and **`f`** with **`Time`** and **`Frequency`**.
         
       - Expanded abbreviations (e.g., **`Acc`** to **`Accelerometer`**, **`Gyro`** to **`Gyroscope`**).
         
       - Adjusted names for clarity (e.g., **`-mean()`** replaced with **`Mean`**).
         
  5. **Tidy Dataset Creation:** Grouped data by subject and activity, then calculated the mean for each variable.


**4. Tools Used**

  - R Programming Language

  - R Packages: dplyr

  - Functions: read.table, write.table, merge, group_by, summarise

**5. Output**

The final tidy dataset contains:

  - 30 subjects × 6 activities = 180 rows.

  - Columns for subject, activity, and averages of relevant measurements.
