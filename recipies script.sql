CREATE DATABASE recipies_application;

USE recipies_application;

CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY AUTO_INCREMENT,
    recipe_name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY AUTO_INCREMENT,
    ingredient_name VARCHAR(255) NOT NULL,
    unit VARCHAR(10)
);

CREATE TABLE Recipe_Ingredients (
    recipe_id INT,
    ingredient_id INT,
    amount DECIMAL(10,2),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

-- Lasagna   
INSERT INTO Recipes (recipe_name, description)
VALUES ("Lasagna", "Garfield's favorite dish"),
       ("Vindaloo Chicken Curry", "A spicy Indian curry");

INSERT INTO Ingredients (ingredient_name, unit)
VALUES ("Lasagna sheets", "pcs"),
       ("Ground Beef", "g"),
       ("Tomato Sauce", "ml"),
       ("Onion", "pcs"),
       ("Chicken Breast", "g"),
       ("Curry Powder", "g"),
       ("Coconut Milk", "ml");
           
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, amount)
VALUES (1, 1, 10),  -- 10 pcs of lasagna sheets
       (1, 2, 300),  -- 300g Ground Beef
       (1, 3, 500),  -- 500ml Tomato Sauce
       (1, 4, 1);    -- 1 pcs Onion
       
       
-- Curry
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, amount)
VALUES 
(2, 5, 500),  -- 500g Chicken Breast
(2, 6, 20),   -- 20g Curry Powder
(2, 7, 400);  -- 400ml Coconut Milk

SELECT * FROM Recipes;

SELECT * FROM Ingredients;

SELECT * FROM Recipe_Ingredients;

SELECT r.recipe_name, i.ingredient_name, ri.amount, i.unit
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE r.recipe_name = "Lasagna";

SELECT r.recipe_name, i.ingredient_name, ri.amount, i.unit
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE r.recipe_name = "Vindaloo Chicken Curry";

