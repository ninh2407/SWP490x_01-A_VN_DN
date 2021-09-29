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
	link_rss varchar(100),
	province nvarchar(150)
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
           ,[region]
           ,[link_rss]
           ,[province])
     VALUES
		   ('TDo',N'Công ty TNHH MTV Xổ số kiến thiết Thủ Đô','MB','https://xskt.com.vn/rss-feed/mien-bac-xsmb.rss',N'Miền Bắc'),
           ('AG',N'Công ty TNHH MTV Xổ số kiến thiết An Giang','MN','https://xskt.com.vn/rss-feed/an-giang-xsag.rss',N'An Giang'),
		   ('BDg',N'Công ty TNHH MTV Xổ số kiến thiết tỉnh Bình Dương','MN','https://xskt.com.vn/rss-feed/binh-duong-xsbd.rss',N'Bình Dương'),
		   ('BDh',N'Công ty TNHH MTV Xổ số kiến thiết Bình Định','MT','https://xskt.com.vn/rss-feed/binh-dinh-xsbdi.rss',N'Bình Định'),
		   ('BL',N'Công ty TNHH MTV Xổ số kiến thiết Bạc Liêu','MN','https://xskt.com.vn/rss-feed/bac-lieu-xsbl.rss',N'Bạc Liêu'),
		   ('BPh',N'Công ty TNHH MTV Xổ số kiến thiết Bình Phước','MN','https://xskt.com.vn/rss-feed/binh-phuoc-xsbp.rss',N'Bình Phước'),
		   ('BTr',N'Công ty TNHH MTV Xổ số kiến thiết Bến Tre','MN','https://xskt.com.vn/rss-feed/ben-tre-xsbt.rss',N'Bến Tre'),
		   ('BTh',N'Công ty TNHH MTV Xổ số kiến thiết Bình Thuận','MN','https://xskt.com.vn/rss-feed/binh-thuan-xsbth.rss',N'Bình Thuận'),
		   ('CM',N'Công ty TNHH MTV Xổ số kiến thiết Cà Mau','MN','https://xskt.com.vn/rss-feed/ca-mau-xscm.rss',N'Cà Mau'),
		   ('CTh',N'Công ty TNHH MTV Xổ số kiến thiết Cần Thơ','MN','https://xskt.com.vn/rss-feed/can-tho-xsct.rss',N'Cần Thơ'),
		   ('DLK',N'Công ty TNHH MTV Xổ số kiến thiết Đăk Lăk','MT','https://xskt.com.vn/rss-feed/dac-lac-xsdlk.rss',N'Đăk Lăk'),
		   ('DNai',N'Công ty TNHH MTV Xổ số kiến thiết Đồng Nai','MN','https://xskt.com.vn/rss-feed/dong-nai-xsdn.rss',N'Đồng Nai'),
		   ('DNg',N'Công ty TNHH MTV Xổ số kiến thiết Đà Nẵng','MT','https://xskt.com.vn/rss-feed/da-nang-xsdng.rss',N'Đà Nẵng'),
		   ('DNong',N'Công ty TNHH MTV Xổ số kiến thiết Đắc Nông','MT','https://xskt.com.vn/rss-feed/dac-nong-xsdno.rss',N'Đăk Nông'),
		   ('DTp',N'Công ty TNHH MTV Xổ số kiến thiết Đồng Tháp','MN','https://xskt.com.vn/rss-feed/dong-thap-xsdt.rss',N'Đồng Tháp'),
		   ('GL',N'Công ty TNHH MTV Xổ số kiến thiết Gia Lai','MT','https://xskt.com.vn/rss-feed/gia-lai-xsgl.rss',N'Gia Lai'),
		   ('HCM',N'Công ty TNHH MTV Xổ số kiến thiết Thành phố Hồ Chí Minh','MN','https://xskt.com.vn/rss-feed/tp-hcm-xshcm.rss',N'TP.Hồ Chí Minh'),
		   ('HG',N'Công ty TNHH MTV Xổ số kiến thiết Hậu Giang','MN','https://xskt.com.vn/rss-feed/hau-giang-xshg.rss',N'Hậu Giang'),
		   ('KG',N'Công ty TNHH MTV Xổ số kiến thiết Kiên Giang','MN','https://xskt.com.vn/rss-feed/kien-giang-xskg.rss',N'Kiên Giang'),
		   ('KH',N'Công ty TNHH MTV Xổ số kiến thiết Khánh Hòa','MT','https://xskt.com.vn/rss-feed/khanh-hoa-xskh.rss',N'Khánh Hòa'),
		   ('KT',N'Công ty TNHH MTV Xổ số kiến thiết Kon Tum','MT','https://xskt.com.vn/rss-feed/kon-tum-xskt.rss',N'Kom Tum'),
		   ('LA',N'Công ty TNHH MTV Xổ số kiến thiết Long An','MN','https://xskt.com.vn/rss-feed/long-an-xsla.rss',N'Long An'),
		   ('LD',N'Công ty TNHH MTV Xổ số kiến thiết Lâm Đồng','MT','https://xskt.com.vn/rss-feed/lam-dong-xsld.rss',N'Lâm Đồng'),
		   ('NT',N'Công ty TNHH MTV Xổ số kiến thiết Ninh Thuận','MT','https://xskt.com.vn/rss-feed/ninh-thuan-xsnt.rss',N'Bình Thuận'),
		   ('PY',N'Công ty TNHH MTV Xổ số kiến thiết Phú Yên','MT','https://xskt.com.vn/rss-feed/phu-yen-xspy.rss',N'Phú Yên'),
		   ('QB',N'Công ty TNHH MTV Xổ số kiến thiết Quảng Bình','MT','https://xskt.com.vn/rss-feed/quang-binh-xsqb.rss',N'Quảng Bình'),
		   ('QNg',N'Công ty TNHH MTV Xổ số kiến thiết Quảng Ngãi','MT','https://xskt.com.vn/rss-feed/quang-ngai-xsqng.rss',N'Quảng Ngãi'),
		   ('QNam',N'Công ty TNHH MTV Xổ số kiến thiết Quảng Nam','MT','https://xskt.com.vn/rss-feed/quang-nam-xsqnm.rss',N'Quảng Nam'),
		   ('QT',N'Công ty TNHH MTV Xổ số kiến thiết Quảng Trị','MT','https://xskt.com.vn/rss-feed/quang-tri-xsqt.rss',N'Quảng Trị'),
		   ('ST',N'Công ty TNHH MTV Xổ số kiến thiết Sóc Trăng','MN','https://xskt.com.vn/rss-feed/soc-trang-xsst.rss',N'Sóc Trăng'),
		   ('TG',N'Công ty TNHH MTV Xổ số kiến thiết Tiền Giang','MN','https://xskt.com.vn/rss-feed/tien-giang-xstg.rss',N'Tiền Giang'),
		   ('TN',N'Công ty TNHH MTV Xổ số kiến thiết Tây Ninh','MN','https://xskt.com.vn/rss-feed/tay-ninh-xstn.rss',N'Tây Ninh'),
		   ('HUE',N'Công ty TNHH MTV Xổ số kiến thiết Thừa Thiên Huế','MT','https://xskt.com.vn/rss-feed/thua-thien-hue-xstth.rss',N'Thừa Thiên Huế'),
		   ('TV',N'Công ty TNHH MTV Xổ số kiến thiết Trà Vinh','MN','https://xskt.com.vn/rss-feed/tra-vinh-xstv.rss',N'Trà Vinh'),
		   ('VL',N'Công ty TNHH MTV Xổ số kiến thiết Vĩnh Long','MN','https://xskt.com.vn/rss-feed/vinh-long-xsvl.rss',N'Vĩnh Long'),
		   ('VT',N'Công ty TNHH MTV Xổ số kiến thiết Vũng Tàu','MN','https://xskt.com.vn/rss-feed/vung-tau-xsvt.rss',N'Vũng Tàu')
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
           ('AG','2021-04-20', '266191','015273','85249', '09403 - 75219',' 91149 - 09481 - 04304 - 22854 - 50339 - 07476 - 12474','6867', '0157 - 1849 - 7020', '520', '08'),
		   ('BDg','2021-04-23', '570117','149635','07876', '02433 - 27272','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3071 - 4738 - 8741', '711', '41'),
		   ('BDh','2021-04-23', '100157','844555','07876', '15571 - 24782','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '9900 - 4209 - 7764', '840', '76'),
		   ('BL','2021-04-23', '522963','71025','07876', '15048 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7527 - 5757 - 6464', '180', '65'),
		   ('BPh','2021-04-23', '843157','002234','07876', '33665 - 27892','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1124 - 4730 - 0464', '108', '02'),
		   ('BTr','2021-04-23', '630157','862501','07876', '99663 - 24102','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '0088 - 4889 - 0324', '300', '07'),
		   ('BTh','2021-04-23', '500157','741025','07876', '88777 - 22582','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '2002 - 4739 - 1764', '999', '74'),
		   ('CM','2021-04-23', '999157','859677','07876', '55963 - 01236','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3077 - 4778 - 7841', '555', '14'),
		   ('CTh','2021-04-23', '570307','751425','07876', '78451 - 12587','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3147 - 2222 - 3663', '704', '32'),
		   ('DLK','2021-04-23', '111444','010588','07876', '17878 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3888 - 8888 - 9999', '303', '99'),
		   ('DNai','2021-04-23', '742016','400222','07876', '52144 - 22401','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7522 - 7569 - 2264', '010', '88'),
		   ('DNg','2021-04-23', '572111','010203','07876', '14253 - 27401','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '4372 - 7439 - 1864', '741', '47'),
		   ('DNong','2021-04-23', '578627','852401','07876', '36958 - 24178','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3202 - 4739 - 1564', '804', '48'),
		   ('DTp','2021-04-23', '993157','343536','07876', '14471 - 96354','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3899 - 8539 - 9702', '751', '49'),
		   ('GL','2021-04-23', '731587','142536','07876', '15111 - 58254','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3089 - 9654 - 1864', '357', '25'),
		   ('HCM','2021-04-23', '247257','758596','07876', '45456 - 74125','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '8899 - 4544 - 6699', '963', '23'),
		   ('HG','2021-04-23', '001157','863145','07876', '18596 - 33554','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3112 - 8839 - 3364', '632', '20'),
		   ('KG','2021-04-23', '572974','897468','78614', '47581 - 22224','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1751 - 2047 - 8005', '701', '11'),
		   ('KH','2021-04-23', '554157','102530','07876', '02021 - 44444','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '9972 - 4777 - 1764', '348', '91'),
		   ('KT','2021-04-23', '788157','759632','78931', '80808 - 77758','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '2329 - 6203 - 8881', '851', '41'),
		   ('LA','2021-04-23', '965157','747414','12345', '74186 - 24347','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '0157 - 1849 - 7020', '369', '71'),
		   ('LD','2021-04-23', '547138','689632','98765', '03645 - 24444','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '5026 - 4135 - 9441', '147', '22'),
		   ('NT','2021-04-23', '756435','576824','02022', '14714 - 20002','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '7283 - 3056 - 7342', '123', '30'),
		   ('PY','2021-04-23', '78648','865342','30303', '14538 - 20142','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '753', '39'),
		   ('QB','2021-04-23', '001334','552233','82475', '17523 - 27232','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '5878 - 1199 - 0536', '176', '35'),
		   ('QNg','2021-04-23', '010140','774411','86952', '15177 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '762', '66'),
		   ('QNam','2021-04-23', '859674','852369','53417', '18965 - 24372','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3002 - 4739 - 1764', '435', '69'),
		   ('QT','2021-04-23', '574125','365289','77889', '14533 - 22572','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '1002 - 4438 - 1733', '032', '68'),
		   ('ST','2021-04-23', '574157','781245','55555', '15453 - 24272','28514 - 57147 - 16507 - 06199 - 75483 - 85593 - 54779','6654', '3882 - 4739 - 1764', '002', '70'),
		   ('TG','2021-04-23', '778995','423698','43967', '17123 - 20272','01014 - 54545 - 16507 - 06789 - 75483 - 85593 - 54779','6654', '3072 - 4009 - 1741', '782', '73'),
		   ('TN','2021-04-23', '572444','000222','42589', '85133 - 24963','75357 - 56987 - 75417 - 07539 - 75483 - 85593 - 54779','6654', '1132 - 8250 - 8223', '875', '15'),
		   ('HUE','2021-04-23', '796012','759302','14789', '98133 - 24014','97524 - 25012 - 16300 - 00099 - 00483 - 88893 - 54333','6654', '0369 - 2128 - 2895', '789', '01'),
		   ('TV','2021-04-23', '203654','753159','98736', '57133 - 2204','28514 - 57303 - 16101 - 06189 - 77883 - 85412 - 54229','6654', '3078 - 4259 - 1064', '699', '89'),
		   ('VL','2021-04-23', '666999','756951','25749', '00133 - 24023','28514 - 57258 - 16369 - 25899 - 78983 - 85013 - 54773','6654', '2209 - 1464 - 5491', '889', '98'),
		   ('VT','2021-04-23', '786349','857534','36985', '10033 - 27472','78544 - 57425 - 16552 - 00101 - 75441 - 87783 - 57749','6654', '6379 - 9679 - 2502', '463', '35')
GO

