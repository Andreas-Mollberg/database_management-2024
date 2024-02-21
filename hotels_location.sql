CREATE DATABASE hotels_application;

USE hotels_application;

-- @block
CREATE table hotels(
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
    );










