# Analyzing Stress and Fatigue Drivers in Railroad Workforces
_Railroad dispatcher data on demographics, work, lifestyle, and stress factors_

Data sourced from **Federal Railroad Administration (FRA)**: https://catalog.data.gov/dataset/work-schedules-and-sleep-patterns-of-railroad-employees

This github respository contains the code used for the data cleaning and exploratory process as well as the original and cleaned datasets sourced from 'Federal Railroad Administration (FRA)' which can be viewed at the link above.

## This respository contains two folders:

### Data Cleaning and Exploration:
- **RailroadStudy Data Cleaning.sql** = Code used during the data cleaning process.
- **RailroadStudy Exploratory Data Analysis.sql** = Code used during the data exploration process to address critical questions needed for analysis.

### Dataset Files:
- **Dispatchers_Background_Data.xls** = The original (uncleaned) dataset you can download via the data.gov link above.
- **RailroadStudy Cleaned.xlsx** = The cleaned dataset converting all of the numeric values with its actual text meaning. This is identical to 'RailroadStudy Cleaned JOINED' but without the stress columns in numeric values joined to it.
- **RailroadStudy Stress Columns Numeric.xlsx** = A separate table I created containing only all of the stress related columns from the original dataset with the default numeric values and excluding everything else.
- **RailroadStudy Cleaned JOINED.xlsx** = 'RailroadStudy Cleaned' and 'RailroadStudy Stress Columns Numeric' joined together via ID. This is the finalized cleaned dataset. Please view 'RailroadStudy Data Cleaning.sql' to see the code used for the data cleaning process. The Kaggle link below contains all the contents from this csv file but in a much more readable format.

## Kaggle link: https://www.kaggle.com/datasets/ryanwong1/factors-of-fatigue-on-railroad-employees
