drop database if exists TransportManagementSystem;

create database TransportManagementSystem;

use TransportManagementSystem;

-- vehicle table

create table vehicles ( vehicleid int auto_increment primary key, model varchar(255), capacity decimal(10, 2), type varchar(50), status varchar(50));

-- routes table

create table Routes( RouteID int primary key auto_increment, StartDestination varchar(255), EndDestination varchar(255), Distance decimal(10,2));

-- trips table

create table Trips (TripID int auto_increment primary key, VehicleID int, RouteID int, DepartureDate datetime, ArrivalDate datetime, Status varchar(50),
TripType varchar(50) default 'Freight', MaxPassengers int, foreign key (VehicleID) references Vehicles(VehicleID) on delete cascade,
foreign key (RouteID) references Routes(RouteID) on delete cascade );

-- passengers table

create table Passengers(PassengerID int auto_increment primary key, FirstName varchar(255), Gender varchar(255), Age int, Email varchar(255) unique,
PhoneNumber varchar(50));

-- bookings table

create table Bookings (BookingID int auto_increment primary key, TripID int, PassengerID int, BookingDate datetime, Status varchar(50),
foreign key (TripID) references Trips(TripID), foreign key (PassengerID) references Passengers(PassengerID));

-- insert into vehicles

insert into vehicles (model, capacity, type, status) values 
('MrM travels', 1500.00, 'bus', 'available'),
('tempo traveller', 1250.00, 'van', 'on trip'),
('volvo', 2000.00, 'bus', 'maintenance'),
('volkswagen transporter', 1800.00, 'van', 'available'),
('ford', 2200.00, 'van', 'available'),
('force traveller', 2800.00, 'van', 'available'),
('tata', 3000.00, 'truck', 'on trip'),
('volvo vnl', 3050.00, 'truck', 'available'),
('toyota', 3000.00, 'bus', 'maintenance'),
('Eicher', 4000.00, 'bus', 'available'),
('ashok leyland', 3200.00, 'bus', 'available'),
('tata winger', 1050.00, 'van', 'maintenance'),
('suzuki carry', 1125.00, 'van', 'available'),
('force traveller', 3280.00, 'van', 'available'),
('maruti eeco', 2005.00, 'van', 'on trip');

-- insert into routes

insert into Routes (StartDestination,EndDestination,Distance) values
('chennai','Trichy',332.00),
('Trichy','Tirunelveli',298.40),
('Chennai','Tirunelveli',622.70),
('Trichy','Kovai',218.40),
('Kovai','Tirunelveli',363.20),
('Chennai','Bangalore',347.50),
('Hyderabad','Chennai',629.70),
('Kerala','Chennai',649.70),
('Vellore','Salem',229.40),
('Tuticorin','Chennai',604.30),
('Madurai','Tirunelveli',161.50),
('Chennai','Kochi',690.40),
('Hyderabad','Tirupati',559.80),
('Tuticorin','Tirunelveli',45.10),
('Chennai','Kanchipuram',72.10);

-- insert into trips

insert into Trips (VehicleID, RouteID, DepartureDate, ArrivalDate, Status, TripType, MaxPassengers) values
(1, 2, '2024-05-01 08:00:00', '2024-05-01 12:00:00', 'Scheduled', 'Passenger', 50),
(2, 2, '2024-05-02 10:30:00', '2024-05-02 15:30:00', 'In Progress', 'Freight' ,40),
(3, 1, '2024-05-03 09:45:00', '2024-05-03 14:45:00', 'Completed', 'Passenger' ,30),
(9, 5, '2024-05-04 11:15:00', '2024-05-04 16:15:00', 'Scheduled', 'Freight',35),
(5, 5, '2024-05-05 13:30:00', '2024-05-05 17:30:00', 'Scheduled', 'Passenger', 45),
(6, 9, '2024-05-06 07:45:00', '2024-05-06 11:45:00', 'In Progress', 'Passenger' ,25),
(7, 8, '2024-05-07 10:00:00', '2024-05-07 14:00:00', 'Scheduled', 'Freight',40),
(8, 3, '2024-05-08 08:30:00', '2024-05-08 12:30:00', 'Scheduled', 'Freight',30),
(4, 4, '2024-05-09 12:45:00', '2024-05-09 17:45:00', 'In Progress', 'Passenger', 20),
(10, 11, '2024-05-10 11:00:00', '2024-05-10 15:00:00', 'Completed', 'Freight',30),
(13, 15, '2024-05-11 09:15:00', '2024-05-11 13:15:00', 'Scheduled', 'Passenger' ,35),
(12, 10, '2024-05-12 14:30:00', '2024-05-12 18:30:00', 'Scheduled', 'Freight',25),
(15, 13, '2024-05-13 08:45:00', '2024-05-13 13:45:00', 'In Progress', 'Passenger',40),
(14, 14, '2024-05-14 11:00:00', '2024-05-14 15:00:00', 'Scheduled', 'Freight',50),
(15, 15, '2024-05-15 10:15:00', '2024-05-15 14:15:00', 'Scheduled', 'Freight' ,30);

-- insert into passengers

insert into Passengers (FirstName, Gender, Age, Email, PhoneNumber) values
('John', 'Male', 30, 'john@gmail.com', '9234567890'),
('Zoya', 'Female', 25, 'zoya@gmail.com', '9876543210'),
('Michael', 'Male', 45, 'michael@gmail.com', '9567891230'),
('Sophia', 'Female', 35, 'sophia@gmail.com', '7891234560'),
('James', 'Male', 28, 'james@gmail.com', '6216549870'),
('Olivia', 'Female', 22, 'olivia@gmail.com', '6543219870'),
('William', 'Male', 40, 'william@gmail.com', '8561237890'),
('Tara', 'Female', 31, 'tara@gmail.com', '8873216540'),
('Benjamin', 'Male', 27, 'benjamin@gmail.com', '6547891230'),
('Bela', 'Female', 33, 'bela@gmail.com', '8239874560'),
('Charlie', 'Male', 29, 'charlie@gmail.com', '9217894560'),
('Sophia', 'Female', 24, 'sophia2@gmail.com', '7894561230'),
('Alexander', 'Male', 38, 'alexander@gmail.com', '6569873210'),
('Alia', 'Female', 26, 'alia@gmail.com', '9874563210'),
('Daniel', 'Male', 32, 'daniel@gmail.com', '6219876540');

-- insert into bookings

insert into Bookings (TripID, PassengerID, BookingDate, Status) values
(12, 1, '2024-04-30 08:00:00', 'Confirmed'),
(7, 2, '2024-05-01 10:30:00', 'Confirmed'),
(4, 3, '2024-05-02 09:45:00', 'Cancelled'),
(15, 4, '2024-05-03 11:15:00', 'Completed'),
(11, 5, '2024-05-04 13:30:00', 'Confirmed'),
(2, 6, '2024-05-05 07:45:00', 'Confirmed'),
(8, 7, '2024-05-06 10:00:00', 'Cancelled'),
(10, 8, '2024-05-07 08:30:00', 'Completed'),
(6, 9, '2024-05-08 12:45:00', 'Confirmed'),
(9, 10, '2024-05-8 11:00:00', 'Cancelled'),
(1, 11, '2024-05-10 09:15:00', 'Completed'),
(14, 12, '2024-05-11 14:30:00', 'Confirmed'),
(5, 13, '2024-05-12 08:45:00', 'Cancelled'),
(13, 14, '2024-05-13 11:00:00', 'Completed'),
(3, 15, '2024-05-14 10:15:00', 'Confirmed');

select * from vehicles;
select * from routes;
select * from trips;
select * from passengers;
select * from bookings;
