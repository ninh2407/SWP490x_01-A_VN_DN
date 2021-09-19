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
	region varchar(5) NOT NULL,
	link_rss varchar(100)
)

CREATE TABLE lottery_result
(
	company_id varchar(5) NOT NULL FOREIGN KEY REFERENCES company(id),
	open_date date NOT NULL,
	special_prize varchar(10),
	first_prize varchar(10),
	second_prize varchar(30),
	third_prize varchar(80),
	fourth_prize varchar(100),
	fifth_prize varchar(80),
	sixth_prize varchar(50),
	seventh_prize varchar(30),
	eighth_prize varchar(5)
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
           ,[region],
		   [link_rss])
     VALUES
		   ('TDo','Công ty TNHH MTV Xổ số kiến thiết Thủ Đô','MB','https://xskt.com.vn/rss-feed/mien-bac-xsmb.rss'),
           ('AG','Công ty TNHH MTV Xổ số kiến thiết An Giang','MN','https://xskt.com.vn/rss-feed/an-giang-xsag.rss'),
		   ('BDg','Công ty TNHH MTV Xổ số kiến thiết tỉnh Bình Dương','MN','https://xskt.com.vn/rss-feed/binh-duong-xsbd.rss'),
		   ('BDh','Công ty TNHH MTV Xổ số kiến thiết Bình Định','MT','https://xskt.com.vn/rss-feed/binh-dinh-xsbdi.rss'),
		   ('BL','Công ty TNHH MTV Xổ số kiến thiết Bạc Liêu','MN','https://xskt.com.vn/rss-feed/bac-lieu-xsbl.rss'),
		   ('BPh','Công ty TNHH MTV Xổ số kiến thiết Bình Phước','MN','https://xskt.com.vn/rss-feed/binh-phuoc-xsbp.rss'),
		   ('BTr','Công ty TNHH MTV Xổ số kiến thiết Bến Tre','MN','https://xskt.com.vn/rss-feed/ben-tre-xsbt.rss'),
		   ('BTh','Công ty TNHH MTV Xổ số kiến thiết Bình Thuận','MN','https://xskt.com.vn/rss-feed/binh-thuan-xsbth.rss'),
		   ('CM','Công ty TNHH MTV Xổ số kiến thiết Cà Mau','MN','https://xskt.com.vn/rss-feed/ca-mau-xscm.rss'),
		   ('CTh','Công ty TNHH MTV Xổ số kiến thiết Cần Thơ','MN','https://xskt.com.vn/rss-feed/can-tho-xsct.rss'),
		   ('DLK','Công ty TNHH MTV Xổ số kiến thiết Đăk Lăk','MT','https://xskt.com.vn/rss-feed/dac-lac-xsdlk.rss'),
		   ('DNai','Công ty TNHH MTV Xổ số kiến thiết Đồng Nai','MN','https://xskt.com.vn/rss-feed/dong-nai-xsdn.rss'),
		   ('DNg','Công ty TNHH MTV Xổ số kiến thiết Đà Nẵng','MT','https://xskt.com.vn/rss-feed/da-nang-xsdng.rss'),
		   ('DNong','Công ty TNHH MTV Xổ số kiến thiết Đắc Nông','MT','https://xskt.com.vn/rss-feed/dac-nong-xsdno.rss'),
		   ('DTp','Công ty TNHH MTV Xổ số kiến thiết Đồng Tháp','MN','https://xskt.com.vn/rss-feed/dong-thap-xsdt.rss'),
		   ('GL','Công ty TNHH MTV Xổ số kiến thiết Gia Lai','MT','https://xskt.com.vn/rss-feed/gia-lai-xsgl.rss'),
		   ('HCM','Công ty TNHH MTV Xổ số kiến thiết Thành phố Hồ Chí Minh','MN','https://xskt.com.vn/rss-feed/tp-hcm-xshcm.rss'),
		   ('HG','Công ty TNHH MTV Xổ số kiến thiết Hậu Giang','MN','https://xskt.com.vn/rss-feed/hau-giang-xshg.rss'),
		   ('KG','Công ty TNHH MTV Xổ số kiến thiết Kiên Giang','MN','https://xskt.com.vn/rss-feed/kien-giang-xskg.rss'),
		   ('KH','Công ty TNHH MTV Xổ số kiến thiết Khánh Hòa','MT','https://xskt.com.vn/rss-feed/khanh-hoa-xskh.rss'),
		   ('KT','Công ty TNHH MTV Xổ số kiến thiết Kon Tum','MT','https://xskt.com.vn/rss-feed/kon-tum-xskt.rss'),
		   ('LA','Công ty TNHH MTV Xổ số kiến thiết Long An','MN','https://xskt.com.vn/rss-feed/long-an-xsla.rss'),
		   ('LD','Công ty TNHH MTV Xổ số kiến thiết Lâm Đồng','MT','https://xskt.com.vn/rss-feed/lam-dong-xsld.rss'),
		   ('NT','Công ty TNHH MTV Xổ số kiến thiết Ninh Thuận','MT','https://xskt.com.vn/rss-feed/ninh-thuan-xsnt.rss'),
		   ('PY','Công ty TNHH MTV Xổ số kiến thiết Phú Yên','MT','https://xskt.com.vn/rss-feed/phu-yen-xspy.rss'),
		   ('QB','Công ty TNHH MTV Xổ số kiến thiết Quảng Bình','MT','https://xskt.com.vn/rss-feed/quang-binh-xsqb.rss'),
		   ('QNg','Công ty TNHH MTV Xổ số kiến thiết Quảng Ngãi','MT','https://xskt.com.vn/rss-feed/quang-ngai-xsqng.rss'),
		   ('QNam','Công ty TNHH MTV Xổ số kiến thiết Quảng Nam','MT','https://xskt.com.vn/rss-feed/quang-nam-xsqnm.rss'),
		   ('QT','Công ty TNHH MTV Xổ số kiến thiết Quảng Trị','MT','https://xskt.com.vn/rss-feed/quang-tri-xsqt.rss'),
		   ('ST','Công ty TNHH MTV Xổ số kiến thiết Sóc Trăng','MN','https://xskt.com.vn/rss-feed/soc-trang-xsst.rss'),
		   ('TG','Công ty TNHH MTV Xổ số kiến thiết Tiền Giang','MN','https://xskt.com.vn/rss-feed/tien-giang-xstg.rss'),
		   ('TN','Công ty TNHH MTV Xổ số kiến thiết Tây Ninh','MN','https://xskt.com.vn/rss-feed/tay-ninh-xstn.rss'),
		   ('HUE','Công ty TNHH MTV Xổ số kiến thiết Thừa Thiên Huế','MT','https://xskt.com.vn/rss-feed/thua-thien-hue-xstth.rss'),
		   ('TV','Công ty TNHH MTV Xổ số kiến thiết Trà Vinh','MN','https://xskt.com.vn/rss-feed/tra-vinh-xstv.rss'),
		   ('VL','Công ty TNHH MTV Xổ số kiến thiết Vĩnh Long','MN','https://xskt.com.vn/rss-feed/vinh-long-xsvl.rss'),
		   ('VT','Công ty TNHH MTV Xổ số kiến thiết Vũng Tàu','MN','https://xskt.com.vn/rss-feed/vung-tau-xsvt.rss')
GO

INSERT INTO [dbo].[lottery_result]
           ([company_id]
           ,[open_date]
           ,[special_prize]
           ,[first_prize]
           ,[second_prize]
           ,[third_prize]
           ,[fourth_prize]
           ,[fifth_prize]
           ,[sixth_prize]
           ,[seventh_prize]
           ,[eighth_prize])
     VALUES
           ('AG','2021-04-23', '266191','91576','85249', '09403 - 75219',' 91149 - 09481 - 04304 - 22854 - 50339 - 07476 - 12474','6867', '0157 - 1849 - 7020', '520', '08'),
		   ('BDg','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3071 - 4738 - 8741', '711', '41'),
		   ('BDh','2021-04-23', '545157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '9900 - 4209 - 7764', '840', '76'),
		   ('BL','2021-04-23', '522157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7527 - 5757 - 6464', '180', '65'),
		   ('BPh','2021-04-23', '501157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1124 - 4730 - 0464', '108', '02'),
		   ('BTr','2021-04-23', '630157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '0088 - 4889 - 0324', '300', '07'),
		   ('BTh','2021-04-23', '500157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '2002 - 4739 - 1764', '999', '74'),
		   ('CM','2021-04-23', '999157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3077 - 4778 - 7841', '555', '14'),
		   ('CTh','2021-04-23', '570307','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3147 - 2222 - 3663', '704', '32'),
		   ('DLK','2021-04-23', '111444','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3888 - 8888 - 9999', '303', '99'),
		   ('DNai','2021-04-23', '742016','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7522 - 7569 - 2264', '010', '88'),
		   ('DNg','2021-04-23', '572111','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '4372 - 7439 - 1864', '741', '47'),
		   ('DNong','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3202 - 4739 - 1564', '804', '48'),
		   ('DTp','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3899 - 8539 - 9702', '751', '49'),
		   ('GL','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3089 - 9654 - 1864', '357', '25'),
		   ('HCM','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '8899 - 4544 - 6699', '963', '23'),
		   ('HG','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3112 - 8839 - 3364', '632', '20'),
		   ('KG','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1751 - 2047 - 8005', '701', '11'),
		   ('KH','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '9972 - 4777 - 1764', '348', '91'),
		   ('KT','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '2329 - 6203 - 8881', '851', '41'),
		   ('LA','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '0157 - 1849 - 7020', '369', '71'),
		   ('LD','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '5026 - 4135 - 9441', '147', '22'),
		   ('NT','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7283 - 3056 - 7342', '123', '30'),
		   ('PY','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '753', '39'),
		   ('QB','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '5878 - 1199 - 0536', '176', '35'),
		   ('QNg','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '762', '66'),
		   ('QNam','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '435', '69'),
		   ('QT','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1002 - 4438 - 1733', '032', '68'),
		   ('ST','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3882 - 4739 - 1764', '002', '70'),
		   ('TG','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3072 - 4009 - 1741', '782', '73'),
		   ('TN','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1132 - 8250 - 8223', '875', '15'),
		   ('HUE','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '0369 - 2128 - 2895', '789', '01'),
		   ('TV','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3078 - 4259 - 1064', '699', '89'),
		   ('VL','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '2209 - 1464 - 5491', '889', '98'),
		   ('VT','2021-04-23', '572157','856034','07876', '15133 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '6379 - 9679 - 2502', '463', '35')
GO
