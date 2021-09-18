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
	special_prize varchar(6),
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

INSERT INTO [dbo].[account]
           ([user_mail]
           ,[password]
           ,[user_name]
           ,[user_phone]
           ,[is_admin])
     VALUES
           ('ninh2407@gmail.com',
			'aabb9087',
			'ninh',
			'0333833908',
			1)
GO

INSERT INTO [dbo].[company]
           ([id]
           ,[name]
           ,[region])
     VALUES
		   ('TDo','Công ty TNHH MTV Xổ số kiến thiết Thủ Đô','MB'),
           ('AG','Công ty TNHH MTV Xổ số kiến thiết An Giang','MN'),
		   ('BDg','Công ty TNHH MTV Xổ số kiến thiết tỉnh Bình Dương','MN'),
		   ('BDh','Công ty TNHH MTV Xổ số kiến thiết Bình Định','MT'),
		   ('BL','Công ty TNHH MTV Xổ số kiến thiết Bạc Liêu','MN'),
		   ('BPh','Công ty TNHH MTV Xổ số kiến thiết Bình Phước','MN'),
		   ('BTr','Công ty TNHH MTV Xổ số kiến thiết Bến Tre','MN'),
		   ('BTh','Công ty TNHH MTV Xổ số kiến thiết Bình Thuận','MN'),
		   ('CM','Công ty TNHH MTV Xổ số kiến thiết Cà Mau','MN'),
		   ('CTh','Công ty TNHH MTV Xổ số kiến thiết Cần Thơ','MN'),
		   ('DLK','Công ty TNHH MTV Xổ số kiến thiết Đăk Lăk','MT'),
		   ('DNai','Công ty TNHH MTV Xổ số kiến thiết Đồng Nai','MN'),
		   ('DNg','Công ty TNHH MTV Xổ số kiến thiết Đà Nẵng','MT'),
		   ('DNong','Công ty TNHH MTV Xổ số kiến thiết Đắc Nông','MT'),
		   ('DTp','Công ty TNHH MTV Xổ số kiến thiết Đồng Tháp','MN'),
		   ('GL','Công ty TNHH MTV Xổ số kiến thiết Gia Lai','MT'),
		   ('HCM','Công ty TNHH MTV Xổ số kiến thiết Thành phố Hồ Chí Minh','MN'),
		   ('HG','Công ty TNHH MTV Xổ số kiến thiết Hậu Giang','MN'),
		   ('KG','Công ty TNHH MTV Xổ số kiến thiết Kiên Giang','MN'),
		   ('KH','Công ty TNHH MTV Xổ số kiến thiết Khánh Hòa','MT'),
		   ('KT','Công ty TNHH MTV Xổ số kiến thiết Kon Tum','MT'),
		   ('LA','Công ty TNHH MTV Xổ số kiến thiết Long An','MN'),
		   ('LD','Công ty TNHH MTV Xổ số kiến thiết Lâm Đồng','MT'),
		   ('NT','Công ty TNHH MTV Xổ số kiến thiết Ninh Thuận','MT'),
		   ('PY','Công ty TNHH MTV Xổ số kiến thiết Phú Yên','MT'),
		   ('QB','Công ty TNHH MTV Xổ số kiến thiết Quảng Bình','MT'),
		   ('QNg','Công ty TNHH MTV Xổ số kiến thiết Quảng Ngãi','MT'),
		   ('QNam','Công ty TNHH MTV Xổ số kiến thiết Quảng Nam','MT'),
		   ('QT','Công ty TNHH MTV Xổ số kiến thiết Quảng Trị','MT'),
		   ('ST','Công ty TNHH MTV Xổ số kiến thiết Sóc Trăng','MN'),
		   ('TG','Công ty TNHH MTV Xổ số kiến thiết Tiền Giang','MN'),
		   ('TN','Công ty TNHH MTV Xổ số kiến thiết Tây Ninh','MN'),
		   ('HUE','Công ty TNHH MTV Xổ số kiến thiết Thừa Thiên Huế','MT'),
		   ('TV','Công ty TNHH MTV Xổ số kiến thiết Trà Vinh','MN'),
		   ('VL','Công ty TNHH MTV Xổ số kiến thiết Vĩnh Long','MN'),
		   ('VT','Công ty TNHH MTV Xổ số kiến thiết Vũng Tàu','MN')
GO






