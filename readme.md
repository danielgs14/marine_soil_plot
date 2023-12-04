# Marine Soil Analysis

With this R project, soil data from oceanographical campaigns can be input into a script to generate a ternary plot, placing points of each station according to its amount of sand, clay, and silt. 
Data can be organized in an Excel file, using a column for the stations and three columns for each of sand, clay or silt like in this example: 

| station  | sand | clay  | silt |
| ------------- | ------------- | ------------- | ------------- |
| a1  | 33  | 43  | 24  |
| a2  | 12  | 62  | 26  |
| a3  | 29  | 54  | 17  |

The script is set up to read csv files, but can be manipulated to read Excel files. If you'd rather not change the script, then export your Excel file as a csv file. 

Sample data to test the script can be found in the `raw` folder.