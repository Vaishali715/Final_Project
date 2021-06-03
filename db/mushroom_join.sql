-- Importing CSV file into mushroom database
COPY raw_mushroom FROM '/Library/PostgreSQL/11/bin/Database/mushrooms.csv' DELIMITER ',' CSV HEADER;

-- Clean mushroom table was exported to mushroom database via Pandas in our machine learning model

-- Joining the raw & clean mushroom tables together on the mushroom_id column
SELECT * 
FROM raw_mushroom 
INNER JOIN clean_mushroom
ON raw_mushroom.mushroom_id = clean_mushroom.mushroom_id;