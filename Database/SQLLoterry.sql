CREATE DATABASE LotteryDB
GO

USE LotteryDB
GO

CREATE TABLE Account
(
	user_mail varchar(100) NOT NULL PRIMARY KEY,
	password varchar(100) NOT NULL,
	user_name nvarchar(50) NOT NULL,
	user_phone varchar(10),
	account_role int NOT NULL
)

CREATE TABLE Company
(
	company_id varchar(5) NOT NULL PRIMARY KEY,
	name nvarchar(100) NOT NULL,
	region varchar(5) NOT NULL
)

CREATE TABLE Lottery_result
(
	company_id varchar(5) NOT NULL FOREIGN KEY REFERENCES Company(company_id),
	date_open date NOT NULL,
	sepcial varchar(6),
	first varchar(6),
	second varchar(6),
	third varchar(15),
	fourth varchar(60),
	fifth varchar(10),
	sixth varchar(30),
	seventh varchar(20),
	eighth varchar(20)
	PRIMARY KEY (company_id, date_open)
)

CREATE TABLE Ticket 
(
	company_id varchar(5) NOT NULL,
	date_open date NOT NULL,
	ticket_code varchar(6) NOT NULL,
	user_mail varchar(100) NOT NULL,
	PRIMARY KEY (company_id, date_open,ticket_code)
)




