-- 1. Mountains and Peaks
CREATE TABLE mountains(
    id INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    CONSTRAINT pk_mountains_id PRIMARY KEY (id)
);
CREATE TABLE peaks(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    mountain_id INT NOT NULL,
    CONSTRAINT fk_peaks_mountain_id_mountains_id FOREIGN KEY (mountain_id) REFERENCES mountains(id)
);
-- 2. Trip Organization
SELECT driver_id,
    vehicle_type,
    CONCAT(first_name, ' ', last_name) AS 'driver_name'
FROM vehicles
    JOIN campers ON driver_id = campers.id;