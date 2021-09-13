CREATE DATABASE lottery_database
GO

USE lottery_database
GO

CREATE TABLE account
(
	user_mail varchar(100) NOT NULL PRIMARY KEY,
	password varchar(100) NOT NULL,
	user_name nvarchar(50) NOT NULL,
	user_phone varchar(10) NULL,
	is_admin int NOT NULL
)

CREATE TABLE company
(
	id varchar(5) NOT NULL PRIMARY KEY,
	name nvarchar(100) NOT NULL,
	region varchar(5) NOT NULL
)

CREATE TABLE lottery_result
(
	company_id varchar(5) NOT NULL FOREIGN KEY REFERENCES company(id),
	open_date date NOT NULL,
	sepcial_prize varchar(6),
	first_prize varchar(6),
	second_prize varchar(15),
	third_prize varchar(50),
	fourth_prize varchar(50),
	fifth_prize varchar(50),
	sixth_prize varchar(30),
	seventh_prize varchar(20),
	eighth_prize varchar(2)
	PRIMARY KEY (company_id, open_date)
)

CREATE TABLE lottery_ticket 
(
	company_id varchar(5) NOT NULL FOREIGN KEY REFERENCES company(id),
	open_date date NOT NULL,
	ticket_code varchar(6) NOT NULL,
	user_mail varchar(100) NOT NULL FOREIGN KEY REFERENCES account(user_mail),
	PRIMARY KEY (company_id, open_date, ticket_code)
)








