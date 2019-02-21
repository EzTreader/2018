-- Ezra Tredwin
-- 03/19/18

-- #1
-- Find the name of the buddy of the trainer named ‘Ash’.
SELECT 
	POKEMON.Name 
FROM 
	POKEMON, TRAINER
WHERE
	TRAINER.Name = "Ash" AND PokemonID = Buddy;

-- #2
-- List the names of trainers who have not participated in a single battle.
SELECT 
DISTINCT
	Trainer.Name 
FROM 
	TRAINER, BATTLE 
WHERE 
	TRAINER.TrainerID 
NOT IN (
	SELECT 
		TRAINER.TrainerID
	FROM 
		BATTLE
	);

-- #3
-- List the categories of Pokémon monsters caught in Albuquerque
SELECT
	Category
FROM
	POKEMON, CAPTURED 
WHERE 
	CAPTURED.LocationCaught = "Albuquerque" AND CAPTURED.PokemonID = POKEMON.PokemonID;


-- #4
-- Find the ages of captured Pokémon that are younger than the youngest trainer.
SELECT
DISTINCT 
	POKEMON.Name 
FROM 
	POKEMON, CAPTURED, TRAINER 
WHERE 
	(SELECT 
		MIN(AGE) 
	FROM TRAINER) > PokemonAge AND POKEMON.PokemonID = CAPTURED.PokemonID;


-- #5
-- Find the names of Pokémon monsters not chosen as any trainer’s buddy.
SELECT 
DISTINCT	
	POKEMON.Name 
FROM 
	POKEMON, TRAINER 
WHERE 
	PokemonID 
NOT IN (
	SELECT 
		Buddy 
	FROM 
		TRAINER
	);
