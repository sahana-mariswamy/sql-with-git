
create table customers (
cust_id int primary key auto_increment,
fname varchar(255) not null,
lname varchar(255) null,
gender varchar(255) not null,
phone int not null,
address varchar(255) not null,
email int not null);

create table flight(
flight_id int primary key auto_increment,
customer_id int,
price float,
flight_info varchar(20),
flight_status varchar(20));

create table schedules(
sched_id int primary key auto_increment,
flight int,
arrival datetime,
dept datetime,
sch_date date
FOREIGN KEY (flight_id) REFERENCES flight(flight_id));

create table ticket(
tkt_id int primary key auto_increment,
cust_id int,
flight_id int,
no_of_tkt int,
dept datetime,
dest varchar(20),
FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
FOREIGN KEY (flight_id) REFERENCES flight(flight_id));

create table reports(
rpt_id int primary key auto_increment,
flight_id int,
trans_id int,
revenue float,
rpt_date date,
FOREIGN KEY (trans_id) REFERENCES transaction(trans_id),
FOREIGN KEY (flight_id) REFERENCES transaction(flight_id));


create table transaction(
trans_id int primary key auto_increment,
sched_id int,
customer_id int,
trans_date date,
FOREIGN KEY (sched_id) REFERENCES schedules(sched_id) on delete cascade,
FOREIGN KEY (cust_id) REFERENCES customers(cust_id) on delete cascade);


select flight.flight_id, ticket.no_of_tkt from flight, ticket where flight.flight_id = ticket.flight_id;

select * from schedule, flight where schedule.flight_id= flight.flight_id;

select reports.revenue, flight.flight_id from flight, reports where reports.flight_id = flight.flight_id;


