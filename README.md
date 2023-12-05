# SuperTravel-ETL-Process
The SuperTravel project for APAN 5310 SQL & Database Design in Columbia University. Below are the descriptions of each folder:

# Data Integration
We have our raw data from various source like Kaggle and Hugging Face save in "./data_inegration/raw" and with clean.ipynb to filter out few conflicted attributes that distributed in our datasets and some unrelated data into "./data_inegration/data" and then use integrate.ipynb to further simulate the relationship between travelers and their corresponding accomondation type and transportation type. Finally, we have our main dataset save into df_integrated_travel_new.csv file which is capable to join into all 4 other csv files.

# ETL
The ER Diagram provides a overview of our whole database schema design which contain 17 tables in total after 3rd normalization.
The SQL code of our schema creation is in both .sql and ETL notebook file. The ETL notebook performs the whole progress of database creation, extraction from cleaned and manipulated data from csv files and load into PostgreSQL databases with PGadmin.

# Analytics
In this project, we had done EDA analysis to investigate the correlation of different attributes of our datasets for data teams to utilize. And furthermore, we have perform few more visualization for the C-level executives.