-- 1. One-To-One Relationship
CREATE TABLE people (
    person_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) DEFAULT 0,
    passport_id INT UNIQUE
);
CREATE table passports (
    passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(8) UNIQUE
);
ALTER TABLE people
ADD CONSTRAINT pk_people PRIMARY KEY (person_id),
    ADD CONSTRAINT fk_people_passports FOREIGN KEY (passport_id) REFERENCES passports(passport_id);
INSERT INTO passports (passport_id, passport_number)
VALUES (101, 'N34FG21B'),
    (102, 'K65LO4R7'),
    (103, 'ZE657QP2');
INSERT INTO people (first_name, salary, passport_id)
VALUES ('Roberto', 43300.00, 102),
    ('Tom', 56100.00, 103),
    ('Yana', 60200.00, 101);
-- 2. One-To-Many Relationship
CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    established_on DATE NOT NULL
);
CREATE TABLE models (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    manufacturer_id INT,
    CONSTRAINT fk_models_manufacturers FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (manufacturer_id)
);
ALTER TABLE models AUTO_INCREMENT = 101;
INSERT INTO manufacturers(name, established_on)
VALUES ('BMW', '1916-03-01'),
    ('Tesla', '2003-01-01'),
    ('Lada', '1966-05-01');
INSERT INTO models(name, manufacturer_id)
VALUES ('X1', 1),
    ('i6', 1),
    ('Model S', 2),
    ('Model X', 2),
    ('Model 3', 2),
    ('Nova', 3);
-- 3. Many-To-Many Relationship
CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 101;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    CONSTRAINT pk_students_exams PRIMARY KEY (exam_id, student_id),
    CONSTRAINT fk_students_exams FOREIGN KEY (exam_id) REFERENCES exams (exam_id),
    CONSTRAINT fx_exams_students FOREIGN KEY (student_id) REFERENCES students (student_id)
);
INSERT INTO students (name)
VALUES ('Mila'),
    ('Toni'),
    ('Ron');
INSERT INTO exams (name)
VALUES ('Spring MVC'),
    ('Neo4j'),
    ('Oracle 11g');
INSERT INTO students_exams
VALUES (1, 101),
    (1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);
-- 4. Self-Referencing
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(255),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id)
);
INSERT INTO teachers (teacher_id, name, manager_id)
VALUES (101, 'John', NULL),
    (106, 'Greta', 101),
    (105, 'Mark', 101),
    (104, 'Ted', 105),
    (102, 'Maya', 106),
    (103, 'Silvia', 106);
-- 6. University Database
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);
CREATE TABLE majors (
    major_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,
    CONSTRAINT fk_students_majors FOREIGN KEY (major_id) REFERENCES majors(major_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment_amount DECIMAL(8, 2),
    student_id INT,
    CONSTRAINT fk_payments_students FOREIGN KEY (student_id) REFERENCES students(student_id)
);
CREATE TABLE agenda (
    student_id INT,
    subject_id INT,
    CONSTRAINT pk_agenda PRIMARY KEY (student_id, subject_id),
    CONSTRAINT fk_agenda_students FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_agenda_subjects FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);