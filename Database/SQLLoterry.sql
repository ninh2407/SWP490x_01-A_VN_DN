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
	special_prize varchar(100),
	first_prize varchar(100),
	second_prize varchar(100),
	third_prize varchar(100),
	fourth_prize varchar(100),
	fifth_prize varchar(100),
	sixth_prize varchar(100),
	seventh_prize varchar(100),
	eighth_prize varchar(100)
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
