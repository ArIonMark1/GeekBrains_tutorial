drop database if exists `tutorial`;
create database if not exists `tutorial`;
use `tutorial`;

create table `product`
(
	id int auto_increment primary key,
    type_prod varchar(20),
    name_p varchar(30),
    company_p varchar(30),
    price int
    
);


INSERT INTO `product`  (type_prod, name_p, company_p, price)
VALUES
('TV', 'PHILIPS H45', 'PHILIPS', 200),
('Smartphone', 'Samsung S8', 'SAMSUNG', 450),
('Smartphone', 'iPhone X', 'Apple', 900),
('TV', 'TCL U49P6', 'TCL', 600);


create table `buyer`
(
	id int auto_increment primary key,
    name_b varchar(30),
    surname_b varchar(30),
    age int,
    phone bigint(13) unique
    
);

INSERT INTO `buyer` (name_b, surname_b, age, phone)
VALUES
('Mark', 'Zykerberg', 45, 39368526111),
('Tony', 'Malachov', 32, 39765231586),
('Sintia', 'Perla', 27, 39654123987);



create table `orders`
(
	id int auto_increment primary key,
    Idbuyer int,
    Idproduct int,
    order_date date,
    quantity int,
    price int,
    foreign key (Idbuyer) references `buyer`(id)
    on update cascade
    on delete cascade,
    foreign key (Idproduct) references `product` (id)
);
 












