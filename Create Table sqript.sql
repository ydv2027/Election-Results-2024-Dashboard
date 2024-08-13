#Table Creation Sqript electionresults_2024

CREATE TABLE electionresults_2024 (
    State VARCHAR(255),
    PC_No INT,
    PC_Name VARCHAR(255),
    Sl_No INT,
    Candidate VARCHAR(255),
    Party VARCHAR(255),
    EVM_Votes INT,
    Postal_Votes INT,
    Total_Votes INT,
    Year Year
);

# Import Dataset In MYSQL 

LOAD DATA INFILE '/path/to/yourfile.csv'   # let's D Drive Lok sabha folder 
INTO TABLE electionresults_2024
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
