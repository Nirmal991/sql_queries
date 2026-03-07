create database bookstore;

use bookstore;

create table books(
book_id int primary key,
title varchar(100),
author varchar(100),
price decimal(10,2),
publication_date date,
category varchar(50),
in_stock int
);

INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock)
VALUES
(1, 'The Alchemist', 'Paulo Coelho', 399.00, '1988-04-15', 'Fiction', 25),
(2, 'Atomic Habits', 'James Clear', 499.00, '2018-10-16', 'Self-Help', 40),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 350.00, '1925-04-10', 'Classic', 15),
(4, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 450.00, '1997-04-01', 'Finance', 30);

select * from books;
select title, price from books where price > 350;
select title, publication_date from books where publication_date >= '2018-04-23';

select price, category from books where price < 1000 or category = 'Fiction';

select price, category from books where (category = 'Fiction' or category = 'Classic') and price < 500;
select price, category from books where category != 'Fiction';

-- pattern matching
select * from books where title like '%Great%';
select * from books where title like binary '%The%';
select * from books where author like '_ulo%';

select * from books where price between 400 and 500;

select * from books where category in (
'Fiction', 'Classic', 'Finance'
);

select * from books where price between 400 and 500 and publication_date >= '1995-01-01';

select * from books where price > (select avg(price) from books);

select * from books where publication_date = '2018-10-16' and price < 500;

SELECT title, category, in_stock
FROM books
WHERE category = 'Fiction'
AND title LIKE '%The%'
AND in_stock > 10;


