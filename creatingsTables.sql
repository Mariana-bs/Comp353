CREATE DATABASE MYVC;   -- Creates the MYVC database
USE MYVC;               -- Switches to the MYVC database


CREATE TABLE Locations (  -- Creates the Locations table
    location_id INT AUTO_INCREMENT,
    type VARCHAR(255),
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(2),
    postal_code VARCHAR(20),
    phone_number VARCHAR(20),
    web_address VARCHAR(255),
    capacity INT,
    personnel_id INT,
    PRIMARY KEY (location_id)
);

CREATE TABLE Personnel (
personnel_id INT AUTO_INCREMENT,
location_id INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
dob DATE,
ssn VARCHAR(20) UNIQUE NOT NULL,
medicare_card VARCHAR(20) UNIQUE,
phone_number VARCHAR(20),
address VARCHAR(255),
city VARCHAR(255),
province VARCHAR(2),
postal_code VARCHAR(20),
email VARCHAR(255),
role VARCHAR(255) NOT NULL,
mandate TEXT,
PRIMARY KEY (personnel_id),
FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE FamilyMembers (
    family_member_id INT AUTO_INCREMENT,
    location_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    ssn VARCHAR(20) UNIQUE NOT NULL,
    medicare_card VARCHAR(20) UNIQUE,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(2),
    postal_code VARCHAR(20),
    email_address VARCHAR(255),
    PRIMARY KEY (family_member_id),
    FOREIGN KEY (location_id) REFERENCES Locations (location_id)
);


CREATE TABLE ClubMembers (
club_member_id INT AUTO_INCREMENT, 
family_member_id INT,
location_id INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
dob DATE,
height INT,
weight INT,
ssn VARCHAR(20),
medicare_card VARCHAR(20),
phone_number VARCHAR(20),
address VARCHAR(255),
city VARCHAR(255),
province VARCHAR(2),
postal_code VARCHAR(20),
relationship VARCHAR(20),
status VARCHAR(20),
last_payment_date DATE,
PRIMARY KEY (club_member_id),
FOREIGN KEY (family_member_id) REFERENCES
FamilyMembers(family_member_id),
FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


CREATE TABLE Payments (
payment_id INT AUTO_INCREMENT, club_member_id INT,
payment_date DATE,
amount DECIMAL(10, 2), 
payment_method VARCHAR(20),
membership_date DATE,
is_donation BOOLEAN,
installment_number INT,
PRIMARY KEY (payment_id),
FOREIGN KEY (club_member_id) REFERENCES ClubMembers(club_member_id)
);


CREATE TABLE Teams (
team_id INT AUTO_INCREMENT,
location_id INT,
team_gender VARCHAR(20),
team_name VARCHAR(255),
age_group VARCHAR(255),
PRIMARY KEY (team_id),
FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


CREATE TABLE PersonnelLocations ( personnel_id INT,
location_id INT,
start_date DATE,
end_date DATE,
PRIMARY KEY (personnel_id, location_id, start_date),
FOREIGN KEY (personnel_id) REFERENCES Personnel(personnel_id),
FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


CREATE TABLE FamilyMemberLocations ( family_member_id INT,
location_id INT,
start_date DATE,
end_date DATE,
PRIMARY KEY (family_member_id, location_id, start_date), FOREIGN KEY (family_member_id) REFERENCES
FamilyMembers(family_member_id),
FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);



SHOW TABLES;   -- Lists all tables in the current database
