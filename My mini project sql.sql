create database elearning_platform;
use elearning_platform;
create table learners(
learner_id int primary key,
full_name varchar(100)not null,
country varchar(50) not null
);
create table course(
course_id int primary key,
course_name varchar(100) not null,
category varchar(50) not null,
unit_price decimal(10,2) not null
);

create table purchases (

purchase_id int primary key,
learner_id  int not null,
course_id int not null,
Quantity int not null,
purchase_date date not null,
foreign key(learner_id) references learners(learner_id),
foreign key(course_id) references courses(course_id)

);
ALTER TABLE course RENAME TO courses;

SHOW TABLES;
insert into learners values(1,"aishwarya","india");
insert into learners values(2,"anjali","india");
insert into learners values(3,"diya","india");
insert into learners values(4,"binoj","india");
insert into learners values(5,"aiswarya","india");
select * from learners;
insert into courses values(101,"Python for Data Analysis","Data Science", 1500.00);
insert into courses values(102, "SQL for Beginners", "Database", 1200.00);
insert into courses values(103, "Power BI Dashboard Mastery", "Business Intelligence", 1800.00);
insert into courses values(104, "Advanced Excel", "Data Analytics", 1000.00);
insert into courses values(105, "Machine Learning Basics", "Data Science", 2500.00);
select * from courses;
insert into purchases values(1001, 1, 101, 1, "2026-01-10");
insert into purchases values(1002, 1, 102, 1, "2026-01-15");
insert into purchases values(1003, 2, 103, 2, "2026-02-05");
insert into purchases values(1004, 2, 104, 1, "2026-02-10");
insert into purchases values(1005, 3, 101, 1, "2026-02-15");
insert into purchases values(1006, 4, 103, 1, "2026-03-01");
insert into purchases values(1007, 4, 101, 2, "2026-03-05");
insert into purchases values(1008, 5, 102, 3, "2026-03-10");
select * from purchases;

SELECT 
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.Quantity AS quantity,
    ROUND(p.Quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT 
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.Quantity AS quantity,
    ROUND(p.Quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM learners l
LEFT JOIN purchases p ON l.learner_id = p.learner_id
LEFT JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT 
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.Quantity AS quantity,
    ROUND(p.Quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM learners l
RIGHT JOIN purchases p ON l.learner_id = p.learner_id
RIGHT JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT 
    l.full_name AS learner_name,
    l.Country AS country,
    ROUND(SUM(p.Quantity * c.unit_price), 2) AS total_spent
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.Country
ORDER BY total_spent DESC;

SELECT 
    c.course_name AS course_name,
    SUM(p.Quantity) AS total_quantity_sold
FROM purchases p
INNER JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT 
    c.category AS category,
    ROUND(SUM(p.Quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
INNER JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category
ORDER BY total_revenue DESC;

SELECT 
    l.full_name AS learner_name,
    COUNT(DISTINCT c.category) AS category_count
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC;

SELECT 
    c.course_name AS course_name,
    c.category AS category
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;