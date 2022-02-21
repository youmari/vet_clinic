/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth <= '2019/12/31';

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < '3';

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu') ;

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5; 

SELECT * FROM animals WHERE neutered = 'true';

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';

BEGIN;

UPDATE animals

SET species = 'unspecified';

\d animals;

ROLLBACK;

\d animals;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;

BEGIN; 

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;
 
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';

SAVEPOINT here;

UPDATE animals

SET weight_kg = weight_kg * -1;

ROLLBACK TO here;

UPDATE animals

SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

UPDATE animals 
SET species_id = 1 WHERE name LIKE '%mon';

UPDATE animals 
SET species_id = 2 WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1 WHERE name LIKE 'Agumon';

UPDATE animals
SET owner_id = 2 WHERE name LIKE 'Gabumon' OR name LIKE 'Pikachu'; 

UPDATE animals
SET owner_id = 3 WHERE name LIKE 'Devimon' OR name like 'Plantmon'; 

UPDATE animals
SET owner_id = 4 WHERE name LIKE 'Charmander' OR name like 'Squirtle' OR name LIKE 'Blossom';

UPDATE animals
SET owner_id = 5 WHERE name LIKE 'Angemon' OR name like 'Boarmon';

SELECT owners.full_name, animals.name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name LIKE 'Melody Pond';

SELECT animals.name, species.name FROM species INNER JOIN animals ON species.id = animals.species_id;

SELECT animals.name, owners.full_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT COUNT(animals.name), species.name FROM species INNER JOIN animals ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name LIKE 'Jennifer Orwell' AND animals.name LIKE '%mon';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name LIKE 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT COUNT(animals.name), owners.full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
    JOIN visits ON (animals.id = visits.animal_id) 
    JOIN vets ON (vets.id = visits.vet_id) 
    WHERE vets.name LIKE 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT species.name, animals.name, vets.name  FROM animals 
  JOIN visits ON (animals.id = visits.animal_id)
  JOIN species ON (species.id = animals.species_id) 
  JOIN vets ON (vets.id = visits.vet_id) 
  WHERE vets.name LIKE 'Stephanie Mendez';

SELECT species.name, vets.name  FROM vets 
  LEFT JOIN specializations ON (specializations.vet_id = vets.id)
  LEFT JOIN species ON (species.id = specializations.species_id);

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
    JOIN visits ON (animals.id = visits.animal_id) 
    JOIN vets ON (vets.id = visits.vet_id) 
    WHERE vets.name LIKE 'Stephanie Mendez' 
    AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT COUNT(animals.name), animals.name FROM animals 
    JOIN visits ON (animals.id = visits.animal_id) GROUP BY animals.name;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
    JOIN visits ON (animals.id = visits.animal_id) 
    JOIN vets ON (vets.id = visits.vet_id) 
    WHERE vets.name LIKE 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name, animals.neutered, 
      animals.escape_attempts,animals.date_of_birth, 
      animals.weight_kg,vets.name AS vet_name, vets.age AS vet_age, 
      vets.date_of_graduation, visits.date_of_visit FROM animals 
    JOIN visits ON (animals.id = visits.animal_id) 
    JOIN vets ON (vets.id = visits.vet_id) 
    ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
JOIN specializations ON specializations.vet_id = visits.vet_id
WHERE animals.species_id != specializations.species_id;


SELECT species.name AS species, COUNT(*) FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;

