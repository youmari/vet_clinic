/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED  ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT
);

DROP TABLE IF EXISTS species;


CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

