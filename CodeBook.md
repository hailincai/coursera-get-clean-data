This file describes everything about how the clean script works, and what we save after the script running.
# Steps for cleaning the data
  - Check local has data folder, if not, create the data folder
  - Download original data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" to data folder, the local file name is dataset.zip
  - Unzip dataset.zip into data folder
  - Load test data, test activity data, test subject data into variables named testData, testActi and testSubject
  - Load train data, train activity data, train subject data into variables named trainData, trainActi and trainSubject
  - Select required column ( mean and std ) column from testData, and then append data from testActi and testSubject into it ( new columns are called activity and subject ). The result is saved back to variable testData
  - Select required column ( mean and std ) column from trainData, and then append data from trainActi and trainSubject into it( new columns are called activity and subject ). The result is saved back to variable trainData
  - Merge testData and trainData into one data set named **finalData**
  - Transfer the finalData$activity to factor, and make the factor levels to be meaningful string
  - Convert finalData to tbl_df, keep the content in variable named finalData1
  - Group the finalData1 with activity and subject
  - Calculate the average value for each variable on finalData1 and export the result to **summary.csv** under data folder
  
# Columns for finalData
## Notes
 - **any variables starts with t means time domain signals**
 - **any variables starts with f is the value after Fast Fourier      Transform (FFT) applied to corresponding time domain signals**
## Dictionary 
 - tbodyaccmeanx    
Mean for body acceleration x 
 - tbodyaccmeany
Mean for body acceleration y 
 - tbodyaccmeanz            
Mean for body acceleration z 
 - tbodyaccstdx
Standard deviation for body acceleration x 
 - tbodyaccstdy   
Standard deviation for body acceleration y
 - tbodyaccstdz            
Standard deviation for body acceleration z
 - tgravityaccmeanx         
Mean for gravity acceleration x
 - tgravityaccmeany        
Mean for gravity acceleration y
 - tgravityaccmeanz         
Mean for gravity acceleration z 
 - tgravityaccstdx         
Standard deviation for gravity acceleration x
 - tgravityaccstdy          
Standard deviation for gravity acceleration y
 - tgravityaccstdz         
Standard deviation for gravity acceleration z 
 - tbodyaccjerkmeanx        
Mean for body acceleration jerk x 
 - tbodyaccjerkmeany       
Mean for body acceleration jerk y 
 - tbodyaccjerkmeanz        
Mean for body acceleration jerk z  
 - tbodyaccjerkstdx        
Standard deviation for body acceleration jerk x  
 - tbodyaccjerkstdy         
Standard deviation for body acceleration jerk y   
 - tbodyaccjerkstdz        
Standard deviation for body acceleration jerk z   
 - tbodygyromeanx   
Mean for body gyroscope x 
 - tbodygyromeany          
Mean for body gyroscope y 
 - tbodygyromeanz        
Mean for body gyroscope z
 - tbodygyrostdx          
Standard deviation for body gyroscope x  
 - tbodygyrostdy            
Standard deviation for body gyroscope y 
 - tbodygyrostdz           
Standard deviation for body gyroscope z 
 - tbodygyrojerkmeanx     
Mean for body gyroscope jerk x  
 - tbodygyrojerkmeany      
Mean for body gyroscope jerk y 
 - tbodygyrojerkmeanz       
Mean for body gyroscope jerk z 
 - tbodygyrojerkstdx       
Standard deviation for body gyroscope jerk x   
 - tbodygyrojerkstdy        
Standard deviation for body gyroscope jerk y 
 - tbodygyrojerkstdz       
Standard deviation for body gyroscope jerk z 
 - tbodyaccmagmean  
Mean for body acceleration magnitude 
 - tbodyaccmagstd          
Standard deviation for body acceleration magnitude 
 - tgravityaccmagmean       
Mean for gravity acceleration magnitude
 - tgravityaccmagstd       
Standard deviation for gravity acceleration magnitude 
 - tbodyaccjerkmagmean   
Mean for body acceleration jerk  magnitude
 - tbodyaccjerkmagstd      
Standard deviation for body acceleration jerk magnitude 
 - tbodygyromagmean         
Mean for body gyroscope magnitude
 - tbodygyromagstd         
Standard deviation for body gyroscope magnitude 
 - tbodygyrojerkmagmean     
Mean for body gyroscope jerk magnitude
 - tbodygyrojerkmagstd     
Standard deviation for body gyroscope jerk magnitude 
 - fbodyaccmeanx   
Mean for body acceleration x 
 - fbodyaccmeany           
Mean for body acceleration y 
 - fbodyaccmeanz            
Mean for body acceleration z 
 - fbodyaccstdx            
Standard deviation for body acceleration x  
 - fbodyaccstdy             
Standard deviation for body acceleration y 
 - fbodyaccstdz            
Standard deviation for body acceleration z  
 - fbodyaccjerkmeanx        
Mean for body acceleration jerk x 
 - fbodyaccjerkmeany       
Mean for body acceleration jerk y 
 - fbodyaccjerkmeanz        
Mean for body acceleration jerk z 
 - fbodyaccjerkstdx        
Standard deviation for body acceleration jerk x 
 - fbodyaccjerkstdy         
Standard deviation for body acceleration jerk y 
 - fbodyaccjerkstdz        
Standard deviation for body acceleration jerk z 
 - fbodygyromeanx   
Mean for body gyroscope x 
 - fbodygyromeany          
Mean for body gyroscope y 
 - fbodygyromeanz        
Mean for body gyroscope z 
 - fbodygyrostdx         
Standard deviation for body gyroscope x
 - fbodygyrostdy            
Standard deviation for body gyroscope y 
 - fbodygyrostdz           
Standard deviation for body gyroscope z 
 - fbodyaccmagmean 
Mean for body acceleration magnitude 
 - fbodyaccmagstd          
Standard deviation for body acceleration magnitude 
 - fbodybodyaccjerkmagmean  
Mean for body acceleration jerk magnitude 
 - fbodybodyaccjerkmagstd  
Standard deviation for body acceleration jerk magnitude 
 - fbodybodygyromagmean     
Mean for body gyroscope magnitude
 - fbodybodygyromagstd     
Standard deviation for body gyroscope magnitude
 - fbodybodygyrojerkmagmean 
Mean for body gyroscope jerk magnitude
 - fbodybodygyrojerkmagstd 
Standard deviation for body gyroscope jerk magnitude 
 - activity                 
Activity label 
 - subject
Identifier to who perform the activity
Identifier to who perform the activity
# Columns for summary.csv
## Notes
 - **any variables starts with avgt means time domain signals**
 - **any variables starts with avgf is the value after Fast Fourier      Transform (FFT) applied to corresponding time domain signals**
## Dictionary
 - activity                 
Activity label 
 - subject
Identifier to who perform the activity
 - avgtbodyaccmeanx    
Average value of mean for body acceleration x 
 - avgtbodyaccmeany
Average value of mean for body acceleration y 
 - avgtbodyaccmeanz            
Average value of mean for body acceleration z 
 - avgtbodyaccstdx
Average value of standard deviation for body acceleration x 
 - avgtbodyaccstdy   
Average value of standard deviation for body acceleration y
 - avgtbodyaccstdz            
Average value of standard deviation for body acceleration z
 - avgtgravityaccmeanx         
Average value of mean for gravity acceleration x
 - avgtgravityaccmeany        
Average value of mean for gravity acceleration y
 - avgtgravityaccmeanz         
Average value of mean for gravity acceleration z 
 - avgtgravityaccstdx         
Average value of standard deviation for gravity acceleration x
 - avgtgravityaccstdy          
Average value of standard deviation for gravity acceleration y
 - avgtgravityaccstdz         
Average value of standard deviation for gravity acceleration z 
 - avgtbodyaccjerkmeanx        
Average value of mean for body acceleration jerk x 
 - avgtbodyaccjerkmeany       
Average value of mean for body acceleration jerk y 
 - avgtbodyaccjerkmeanz        
Average value of mean for body acceleration jerk z  
 - avgtbodyaccjerkstdx        
Average value of standard deviation for body acceleration jerk x  
 - avgtbodyaccjerkstdy         
Average value of standard deviation for body acceleration jerk y   
 - avgtbodyaccjerkstdz        
Average value of standard deviation for body acceleration jerk z   
 - avgtbodygyromeanx   
Average value of mean for body gyroscope x 
 - avgtbodygyromeany          
Average value of mean for body gyroscope y 
 - avgtbodygyromeanz        
Average value of mean for body gyroscope z
 - avgtbodygyrostdx          
Average value of standard deviation for body gyroscope x  
 - avgtbodygyrostdy            
Average value of standard deviation for body gyroscope y 
 - avgtbodygyrostdz           
Average value of standard deviation for body gyroscope z 
 - avgtbodygyrojerkmeanx     
Average value of mean for body gyroscope jerk x  
 - avgtbodygyrojerkmeany      
Average value of mean for body gyroscope jerk y 
 - avgtbodygyrojerkmeanz       
Average value of mean for body gyroscope jerk z 
 - avgtbodygyrojerkstdx       
Average value of standard deviation for body gyroscope jerk x   
 - avgtbodygyrojerkstdy        
Average value of standard deviation for body gyroscope jerk y 
 - avgtbodygyrojerkstdz       
Average value of standard deviation for body gyroscope jerk z 
 - avgtbodyaccmagmean  
Average value of mean for body acceleration magnitude 
 - avgtbodyaccmagstd          
Average value of standard deviation for body acceleration magnitude 
 - avgtgravityaccmagmean       
Average value of mean for gravity acceleration magnitude
 - avgtgravityaccmagstd       
Average value of standard deviation for gravity acceleration magnitude 
 - avgtbodyaccjerkmagmean   
Average value of mean for body acceleration jerk  magnitude
 - avgtbodyaccjerkmagstd      
Average value of standard deviation for body acceleration jerk magnitude 
 - avgtbodygyromagmean         
Average value of mean for body gyroscope magnitude
 - avgtbodygyromagstd         
Average value of standard deviation for body gyroscope magnitude 
 - avgtbodygyrojerkmagmean     
Average value of mean for body gyroscope jerk magnitude
 - avgtbodygyrojerkmagstd     
Average value of standard deviation for body gyroscope jerk magnitude 
 - avgfbodyaccmeanx   
Average value of mean for body acceleration x 
 - avgfbodyaccmeany           
Average value of mean for body acceleration y 
 - avgfbodyaccmeanz            
Average value of mean for body acceleration z 
 - avgfbodyaccstdx            
Average value of standard deviation for body acceleration x  
 - avgfbodyaccstdy             
Average value of standard deviation for body acceleration y 
 - avgfbodyaccstdz            
Average value of standard deviation for body acceleration z  
 - avgfbodyaccjerkmeanx        
Average value of mean for body acceleration jerk x 
 - avgfbodyaccjerkmeany       
Average value of mean for body acceleration jerk y 
 - avgfbodyaccjerkmeanz        
Average value of mean for body acceleration jerk z 
 - avgfbodyaccjerkstdx        
Average value of standard deviation for body acceleration jerk x 
 - avgfbodyaccjerkstdy         
Average value of standard deviation for body acceleration jerk y 
 - avgfbodyaccjerkstdz        
Average value of standard deviation for body acceleration jerk z 
 - avgfbodygyromeanx   
Average value of mean for body gyroscope x 
 - avgfbodygyromeany          
Average value of mean for body gyroscope y 
 - avgfbodygyromeanz        
Average value of mean for body gyroscope z 
 - avgfbodygyrostdx         
Average value of standard deviation for body gyroscope x
 - avgfbodygyrostdy            
Average value of standard deviation for body gyroscope y 
 - avgfbodygyrostdz           
Average value of standard deviation for body gyroscope z 
 - avgfbodyaccmagmean 
Average value of mean for body acceleration magnitude 
 - avgfbodyaccmagstd          
Average value of standard deviation for body acceleration magnitude 
 - avgfbodybodyaccjerkmagmean  
Average value of mean for body acceleration jerk magnitude 
 - avgfbodybodyaccjerkmagstd  
Average value of standard deviation for body acceleration jerk magnitude 
 - avgfbodybodygyromagmean     
Average value of mean for body gyroscope magnitude
 - avgfbodybodygyromagstd     
Average value of standard deviation for body gyroscope magnitude
 - avgfbodybodygyrojerkmagmean 
Average value of mean for body gyroscope jerk magnitude
 - avgfbodybodygyrojerkmagstd 
Average value of standard deviation for body gyroscope jerk magnitude 
# Environment to run the script
 - R x64 3.1.3
 - R dplyr package, you can install it by command install.packages("dplyr")