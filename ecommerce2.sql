create database ecommerce2;
use ecommerce2;


create table customers ( customer_id varchar(5) primary key,
    name varchar(15),
    email varchar(20),
    location varchar(12),
    join_date date);


create table products ( product_id varchar(4) primary key,
    product_name varchar(15));

create table carriers ( carrier_id varchar(5) primary key,
    carrier_name varchar(15),
    avg_delivery_time int);


create table orders ( order_id varchar(5) primary key,
    customer_id varchar(5),
    product_id varchar(4),
    quantity int,
    order_date date,
    order_status varchar(10),
    total_amount decimal(6, 2),
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id) references products(product_id));


create table shipments ( shipment_id varchar(5) primary key,
    order_id varchar(5),
    carrier_id varchar(5),
    dispatch_date date,
    delivery_date date,
    status varchar(15),
    foreign key (order_id) references orders(order_id),
    foreign key (carrier_id) references carriers(carrier_id));


create table delivery_status (delivery_id varchar(5) primary key,
    shipment_id varchar(5),
    status varchar(15),
    updated_at datetime,
    foreign key (shipment_id) references shipments(shipment_id));



create table customer_feedback ( feedback_id varchar(5) primary key,
    customer_id varchar(5),
    order_id varchar(5),
    rating int,
    comments varchar(30),
    foreign key (customer_id) references customers(customer_id),
    foreign key (order_id) references orders(order_id));
    
insert into customers (customer_id, name, email, location, join_date)
values ('c001', 'john doe', 'john@example.com', 'new york', '2023-01-15'),
('c002', 'jane smith', 'jane@example.com', 'los angeles', '2022-11-10'),
('c003', 'alice brown', 'alice@example.com', 'chicago', '2023-02-05'),
('c004', 'bob white', 'bob@example.com', 'miami', '2023-03-22'),
('c005', 'ram sharma', 'ram@example.com', 'miami', '2022-12-01'),
('c006', 'ravi varma', 'ravi@example.com', 'new york', '2023-04-10'),
('c007', 'devi bhat', 'devid@example.com', 'chicago', '2022-09-15');

select * from customers;

insert into products (product_id, product_name)
values ('p001', 'laptop'),
('p002', 'smartphone'),
('p003', 'tablet'),
('p004', 'headphones'),
('p005', 'smartwatch');

select * from products;


insert into carriers (carrier_id, carrier_name, avg_delivery_time)
values ('cr001', 'fedex', 2),
('cr002', 'ups', 3),
('cr003', 'dhl', 4),
('cr004', 'dtdc', 2),
('cr005', 'blue dart', 2);

select * from carriers;

insert into orders (order_id, customer_id, product_id, order_date, order_status, total_amount, quantity)
values ('o1001', 'c001', 'p001', '2024-10-05', 'shipped', 120.50, 6),
('o1002', 'c002', 'p002', '2024-10-10', 'delivered', 340.00, 8),
('o1003', 'c003', 'p003', '2024-10-15', 'pending', 90.25, 5),
('o1004', 'c004', 'p004', '2024-10-20', 'canceled', 210.75, 7),
('o1005', 'c005', 'p005', '2024-11-01', 'pending', 150.00, 9),
('o1006', 'c006', 'p001', '2024-11-05', 'pending', 200.00, 10),
('o1007', 'c007', 'p002', '2024-11-10', 'delivered', 300.00, 7),
('o1008', 'c001', 'p003', '2024-11-15', 'shipped', 110.00, 6),
('o1009', 'c002', 'p004', '2024-11-20', 'canceled', 250.00, 8),
('o1010', 'c003', 'p005', '2024-12-01', 'pending', 180.00, 5),
('o1011', 'c004', 'p001', '2024-12-05', 'delivered', 220.00, 7),
('o1012', 'c005', 'p002', '2024-12-10', 'shipped', 320.00, 9),
('o1013', 'c006', 'p003', '2024-12-15', 'delivered', 130.00, 6),
('o1014', 'c007', 'p004', '2025-01-01', 'canceled', 240.00, 8),
('o1015', 'c001', 'p005', '2025-01-05', 'delivered', 170.00, 5);


select * from orders;

insert into shipments (shipment_id, order_id, carrier_id, dispatch_date, delivery_date, status)
values ('s2001', 'o1001', 'cr001', '2024-10-06', '2024-10-08', 'delivered'),
('s2002', 'o1002', 'cr002', '2024-10-11', '2024-10-14', 'delivered'),
('s2003', 'o1003', 'cr001', '2024-10-16', null, 'in transit'),
('s2004', 'o1004', 'cr003', '2024-10-21', null, 'canceled'),
('s2005', 'o1005', 'cr004', '2024-11-02', null, 'in transit'),
('s2006', 'o1006', 'cr005', '2024-11-06', null, 'in transit'),
('s2007', 'o1007', 'cr001', '2024-11-11', '2024-11-13', 'delivered'),
('s2008', 'o1008', 'cr002', '2024-11-16', '2024-11-19', 'delivered'),
('s2009', 'o1009', 'cr003', '2024-11-21', null, 'canceled'),
('s2010', 'o1010', 'cr004', '2024-12-02', null, 'in transit'),
('s2011', 'o1011', 'cr005', '2024-12-06', '2024-12-08', 'delivered'),
('s2012', 'o1012', 'cr001', '2024-12-11', '2024-12-13', 'delivered'),
('s2013', 'o1013', 'cr002', '2024-12-16', '2024-12-19', 'delivered'),
('s2014', 'o1014', 'cr003', '2025-01-02', null, 'canceled'),
('s2015', 'o1015', 'cr004', '2025-01-06', '2025-01-08', 'delivered');

select * from shipments;

insert into delivery_status (delivery_id, shipment_id, status, updated_at)
values ('d3001', 's2001', 'delivered', '2024-10-08 10:30'),
('d3002', 's2002', 'delivered', '2024-10-14 12:45'),
('d3003', 's2003', 'in transit', '2024-10-16 15:00'),
('d3004', 's2004', 'canceled', '2024-10-21 08:20'),
('d3005', 's2005', 'in transit', '2024-11-02 09:00'),
('d3006', 's2006', 'in transit', '2024-11-06 10:00'),
('d3007', 's2007', 'delivered', '2024-11-13 11:30'),
('d3008', 's2008', 'delivered', '2024-11-19 13:45'),
('d3009', 's2009', 'canceled', '2024-11-21 08:30'),
('d3010', 's2010', 'in transit', '2024-12-02 09:15'),
('d3011', 's2011', 'delivered', '2024-12-08 10:45'),
('d3012', 's2012', 'delivered', '2024-12-13 12:00'),
('d3013', 's2013', 'delivered', '2024-12-19 14:15'),
('d3014', 's2014', 'canceled', '2025-01-02 09:30'),
('d3015', 's2015', 'delivered', '2025-01-08 11:00');

select * from delivery_status;

insert into customer_feedback (feedback_id, customer_id, order_id, rating, comments)
values ('f4001', 'c001', 'o1001', 5, 'fast delivery!'),
('f4002', 'c002', 'o1002', 4, 'good service but expensive'),
('f4003', 'c003', 'o1003', 3, 'delayed shipment'),
('f4004', 'c004', 'o1004', 2, 'order was canceled'),
('f4005', 'c005', 'o1005', 3, 'delayed shipment'),
('f4006', 'c006', 'o1006', 3, 'delayed shipment'),
('f4007', 'c007', 'o1007', 5, 'fast delivery!'),
('f4008', 'c001', 'o1008', 4, 'good service but expensive'),
('f4009', 'c002', 'o1009', 2, 'order was canceled'),
('f4010', 'c003', 'o1010', 3, 'delayed shipment'),
('f4011', 'c004', 'o1011', 4, 'good service but expensive'),
('f4012', 'c005', 'o1012', 5, 'fast delivery!'),
('f4013', 'c006', 'o1013', 5, 'fast delivery!'),
('f4014', 'c007', 'o1014', 2, 'order was canceled'),
('f4015', 'c001', 'o1015', 5, 'fast delivery!');

select * from customer_feedback;

