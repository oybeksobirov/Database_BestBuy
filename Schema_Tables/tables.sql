create table store (
	storeID int primary key
);

create table vendors(
	vendorID int primary key,
    name varchar(50),
    email varchar(25)
);

create table discount(
	discountID int primary key,
    amount int
);

create table customer(
	customerID int primary key
);

create table product(
	productID int primary key,
    vendorID int,
    discountID int,
    price decimal(10,2),
    name varchar(50),
    foreign key(vendorID) references vendors(vendorID),
    foreign key(discountID) references discount(discountID)
);

create table orders(
	orderID int primary key,
    orderDate date,
    storeID int,
    customerID int,
    foreign key(storeID) references store(storeID),
    foreign key(customerID) references customer(customerID)
);

create table order_item(
    orderID int,
    productID int,
    quantity int,
    primary key(orderID,productID),
    foreign key(orderID) references orders(orderID),
	foreign key(productID) references product(productID)
);

create table payment (
	paymentID int primary key,
    payment_type varchar(25)
);

create table order_payment (
	orderID int,
    paymentID int,
    total decimal(10,2),
    primary key(orderID,paymentID),
    foreign key(orderID) references orders(orderID),
	foreign key(paymentID) references payment(paymentID)
);

create table BM (
	storeID int primary key,
    address varchar(50),
    city varchar(25),
    state varchar(15),
    foreign key(storeID) references store(storeID) on delete cascade 
);

create table webstore (
	storeID int primary key,
    URL varchar(100),
	foreign key(storeID) references store(storeID) on delete cascade 
);

create table electronics (
	productID int primary key,
    watts int,
	foreign key(productID) references product(productID) on delete cascade 

);
create table appliances (
	productID int primary key,
    brand varchar(25),
	foreign key(productID) references product(productID) on delete cascade 
);
create table furniture (
	productID int primary key,
    size varchar(20),
	foreign key(productID) references product(productID) on delete cascade 
);
create table toys (
	productID int primary key,
    age int,
	foreign key(productID) references product(productID) on delete cascade 
);

create table inventory(
    productID int,
    storeID int,
    primary key(productID,storeID),
    foreign key(productID)references product(productID),
    foreign key(storeID)references store(storeID)
);

create table member(
	customerID int primary key,
    name varchar(50),
    email varchar(50),
    foreign key(customerID) references customer(customerID) on delete cascade 
);

create table guest(
	customerID int primary key,	
    foreign key(customerID) references customer(customerID) on delete cascade 
);