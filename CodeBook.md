#Getting and Cleaning Data Project Code Book

##Transformations and Explanations

The file ```{r} run_analysis.R ``` will run code that cleans the data for the 5 
steps outlined in the project instructions

1. Data were merged using the function ```{r} rbind() ```. Each file was merged according 
to their columns and entities.

2. Only columns that have mean and standard deviation measures are taken into the dataset, and then the names are corrected according to ```{r} features.txt ```

3. Took the activity names and IDs from ```{r} activity_labels.txt ``` to add them to the dataset (activity data were valued 1:6)

4. Column names were corrected on the whole dataset to be more descriptive.

5. Generated and new dataset with average measures for each subject and activity type. The output file is ```{r} averagesdata.txt``` located in this repo. 

##Variables
-```{r} xtrain```, ```{r}ytrain```, ```{r}xtest```, ```{r} ytest```, ```{r} subjecttrain```, and ```{r} subjecttest``` are data from the downloaded files.

-```{r} data_x```, ```{r} data_y```, and ```{r} data_subject``` were used to merge the above datasets to further clean the data.

-```{r} features ``` contains the corrected names for the ```{r}data_x``` dataset, which are applied to column names in ```{r} mean_std_features```, which is a numeric vector used to extract the data.

-Similarly to before, activity names are corrected through the ```{r} activities``` variable.

-```{r}alldata``` merges ```{r}data_x```, ```{r} data_y```, and ```{r}data_subject``` into a dataset.

-```{r}averagesdata``` contains the averages that will be stored in a ```{r}.txt``` file. ```{r} ddply()``` from the plyr package is used to apply ```{r}colMeans()``` for ease of use.
