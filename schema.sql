/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE, 
    escape_attemps INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL
);
