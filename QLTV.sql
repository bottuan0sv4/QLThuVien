USE [QuanLiThuVien]
GO
/****** Object:  Table [dbo].[MuonTra]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTra](
	[MuontraID] [int] IDENTITY(1,1) NOT NULL,
	[NhanvienmuonID] [int] NULL,
	[NhanvientraID] [int] NULL,
	[Ngaymuon] [date] NULL,
	[Ngaytra] [date] NULL,
	[ThethuvienID] [int] NULL,
	[SachID] [int] NULL,
	[Ghichu] [nvarchar](50) NULL,
	[Datra] [bit] NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK_MuonTra] PRIMARY KEY CLUSTERED 
(
	[MuontraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[SachID] [int] IDENTITY(1,1) NOT NULL,
	[Tensach] [nvarchar](50) NULL,
	[ImgLink] [varchar](100) NULL,
	[TacgiaID] [int] NULL,
	[TheloaiID] [int] NULL,
	[NhaxuatbanID] [int] NULL,
	[Namxuatban] [date] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[SachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[TacgiaID] [int] IDENTITY(1,1) NOT NULL,
	[Tentacgia] [nvarchar](50) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[TacgiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheThuVien]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheThuVien](
	[ThethuvienID] [int] IDENTITY(1,1) NOT NULL,
	[NhanvienID] [int] NULL,
	[Ngaytaothe] [date] NULL,
	[Ngayhethan] [date] NULL,
	[Solangiahan] [int] NULL,
	[Trangthai] [bit] NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[tentk] [nvarchar](50) NULL,
	[sdt] [char](12) NULL,
	[mail] [varchar](50) NULL,
	[diachi] [nvarchar](200) NULL,
 CONSTRAINT [PK_TheThuVien] PRIMARY KEY CLUSTERED 
(
	[ThethuvienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SLsachMuonTG]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SLsachMuonTG]
as 
select COUNT(Sach.SachID) as SL
from MuonTra,TheThuVien,Sach,TacGia
where MuonTra.SachID = Sach.SachID and MuonTra.ThethuvienID = TheThuVien.ThethuvienID and Sach.TacgiaID = Tacgia.TacgiaID and TacGia.Tentacgia = N'Nguyễn Nhật Ánh'
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[DocgiaID] [int] IDENTITY(1,1) NOT NULL,
	[Tendocgia] [nvarchar](50) NULL,
	[ThethuvienID] [int] NULL,
	[SDT] [varchar](11) NULL,
	[Diachi] [nvarchar](100) NULL,
	[mail] [varchar](50) NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[DocgiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NhanvienID] [int] IDENTITY(1,1) NOT NULL,
	[Tennhanvien] [nvarchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[SDT] [varchar](11) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[NhanvienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien_History]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien_History](
	[ID_Change] [int] IDENTITY(1,1) NOT NULL,
	[IDnhanvien] [int] NOT NULL,
	[Tennhanvien] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](50) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Operation] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Change] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[NhaxuatbanID] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[NhaxuatbanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[TheloaiID] [int] IDENTITY(1,1) NOT NULL,
	[Tentheloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[TheloaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DocGia] ON 

INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (1, N'Lưu Thị Nhật Mai', 2, N'0367558797', N'Hà Nội', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (2, N'Vũ Thanh Hằng', 2, N'0351234569', N'Quảng Ninh', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (3, N'Lương Thị Diễm Quỳnh', 3, N'0987466321', N'Hà Tĩnh', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (4, N'Đào Công Thắng', 6, N'0365489887', N'Hải Phòng', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (5, N'Nguyễn Tuấn Hưng', 7, N'0311226984', N'Hà Nam', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (6, N'Bùi Văn Thịnh', 5, N'0258996411', N'Hải Dương', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (7, N'Trần Anh Đức', 5, N'0361233212', N'Lạng Sơn', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (10, N'Nguyễn Hồng Nhung', 8, N'0354767980', N'Lào Cai', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (12, N'Đoàn Văn Hậu', 9, N'0976243576', N'Thái Bình', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (13, N'Đặng Văn Lâm', 2, N'0352132990', N'Huế', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (14, N'Phan Văn Đức', 5, N'0374839867', N'Nghệ An', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (16, N'Quế Ngọc Hải', 6, N'0334935765', N'Đà Nẵng', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (17, N'Trương Mỹ Linh', 2, N'0987247454', N'Lai Châu', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (19, N'Lê Công vinh', 9, N'0314289677', N'Lâm Đồng', NULL)
INSERT [dbo].[DocGia] ([DocgiaID], [Tendocgia], [ThethuvienID], [SDT], [Diachi], [mail]) VALUES (20, N'Phí Minh Long', 7, N'0987293821', N'Ninh Bình', NULL)
SET IDENTITY_INSERT [dbo].[DocGia] OFF
GO
SET IDENTITY_INSERT [dbo].[MuonTra] ON 

INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (1, 2, 1, CAST(N'2019-05-01' AS Date), CAST(N'2019-12-25' AS Date), 2, 5, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2, 2, 3, CAST(N'2019-05-01' AS Date), CAST(N'2019-10-11' AS Date), 6, 1, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (4, 5, 9, CAST(N'2019-11-02' AS Date), CAST(N'2020-01-10' AS Date), 2, 8, N'', 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (5, 8, 8, CAST(N'2019-02-23' AS Date), CAST(N'2019-08-12' AS Date), 3, 3, N'', 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (6, 1, 2, CAST(N'2018-04-19' AS Date), CAST(N'2019-12-10' AS Date), 9, 2, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (7, 1, 3, CAST(N'2019-04-19' AS Date), CAST(N'2019-10-02' AS Date), 5, 1, N'', 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (8, 4, 2, CAST(N'2019-05-12' AS Date), CAST(N'2020-01-02' AS Date), 8, 6, N'', 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (9, 3, 5, CAST(N'2020-01-01' AS Date), CAST(N'2020-02-10' AS Date), 12, 10, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (10, 10, 11, CAST(N'2020-01-02' AS Date), CAST(N'2020-03-01' AS Date), 11, 2, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (11, 5, 5, CAST(N'2020-02-01' AS Date), CAST(N'2020-03-14' AS Date), 11, 3, N'', 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (12, 12, 11, CAST(N'2020-01-19' AS Date), CAST(N'2020-02-23' AS Date), 10, 12, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (13, 9, 8, CAST(N'2020-02-03' AS Date), CAST(N'2020-03-16' AS Date), 7, 4, N'', 1, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (1006, 3, 4, CAST(N'2020-02-10' AS Date), CAST(N'2020-04-10' AS Date), 3, 5, NULL, 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (1007, 2, 3, CAST(N'2020-02-11' AS Date), CAST(N'2020-03-30' AS Date), 3, 3, NULL, 0, NULL)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (1008, NULL, NULL, CAST(N'2020-06-03' AS Date), CAST(N'2020-08-03' AS Date), 3, 1, NULL, 0, 1)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2008, NULL, NULL, CAST(N'2020-06-10' AS Date), CAST(N'2020-08-10' AS Date), 3, 1, NULL, 0, 2)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2009, NULL, NULL, CAST(N'2020-06-10' AS Date), CAST(N'2020-08-10' AS Date), 3, 12, NULL, 0, 1)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2010, NULL, NULL, CAST(N'2020-11-12' AS Date), CAST(N'2021-01-12' AS Date), 15, 1, NULL, 0, 1)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2011, NULL, NULL, CAST(N'2020-11-12' AS Date), CAST(N'2021-01-12' AS Date), 15, 2, NULL, 0, 1)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2012, NULL, NULL, CAST(N'2020-11-12' AS Date), CAST(N'2021-01-12' AS Date), 15, 4, NULL, 0, 3)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2013, NULL, NULL, CAST(N'2020-11-18' AS Date), CAST(N'2021-01-18' AS Date), 15, 1, NULL, 0, 1)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (2014, NULL, NULL, CAST(N'2020-11-18' AS Date), CAST(N'2021-01-18' AS Date), 15, 3, NULL, 0, 2)
INSERT [dbo].[MuonTra] ([MuontraID], [NhanvienmuonID], [NhanvientraID], [Ngaymuon], [Ngaytra], [ThethuvienID], [SachID], [Ghichu], [Datra], [soluong]) VALUES (3013, NULL, NULL, CAST(N'2021-04-06' AS Date), CAST(N'2021-06-06' AS Date), 15, 1, NULL, 0, 4)
SET IDENTITY_INSERT [dbo].[MuonTra] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (1, N'Nguyễn Tư Tỉnh', N'Quảng Ninh', N'03641254138')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (2, N'Nguyễn Ngọc Trung', N'Hà Nam', N'0956468123')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (3, N'Nguyễn Xuân Dương', N'Hà Nội', N'03123456987')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (4, N'Nguyễn Nhật Nam', N'Thanh Hóa', N'0215463454')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (5, N'Hà Thị Huệ', N'Hà Nội', N'0864521848')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (6, N'Nguyễn Thị Thu Thủy', N'Bắc Ninh', N'03659874521')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (7, N'Nguyễn Ngọc Sơn', N'Yên Bái', N'03985621432')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (8, N'Nguyễn Hương Trà', N'Ninh Bình', N'03154214897')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (9, N'Tạ Huyền Nhung', N'Hải Phòng', N'0132456987')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (10, N'Phạm Thu Hà', N'Hải Dương', N'0987413446')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (11, N'Nguyễn Văn Hải', N'Nghệ An', N'0945236258')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (12, N'Phạm Mỹ Hạnh', N'Đà Nẵng', N'01687943114')
INSERT [dbo].[NhanVien] ([NhanvienID], [Tennhanvien], [Diachi], [SDT]) VALUES (13, N'Phạm Thị Hải Yến', N'Lạng Sơn', N'08412593015')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien_History] ON 

INSERT [dbo].[NhanVien_History] ([ID_Change], [IDnhanvien], [Tennhanvien], [Diachi], [SDT], [Updated_at], [Operation]) VALUES (1, 2014, N'Hoa Tất Thắng', N'Hà Nội', N'945632536 ', CAST(N'2020-04-12T20:52:46.007' AS DateTime), N'INS       ')
INSERT [dbo].[NhanVien_History] ([ID_Change], [IDnhanvien], [Tennhanvien], [Diachi], [SDT], [Updated_at], [Operation]) VALUES (4, 2014, N'Hoa Tất Thắng', N'Hà Nội', N'945632536 ', CAST(N'2020-04-12T20:57:19.220' AS DateTime), N'DEL       ')
INSERT [dbo].[NhanVien_History] ([ID_Change], [IDnhanvien], [Tennhanvien], [Diachi], [SDT], [Updated_at], [Operation]) VALUES (7, 2, N'Nguyễn Ngọc Trung', N'Hà Nam', N'0956468123', CAST(N'2020-04-12T20:59:48.107' AS DateTime), N'After_Up  ')
INSERT [dbo].[NhanVien_History] ([ID_Change], [IDnhanvien], [Tennhanvien], [Diachi], [SDT], [Updated_at], [Operation]) VALUES (8, 2, N'Đoàn Ngọc Tân', N'Hà Nam', N'0956468123', CAST(N'2020-04-12T20:59:48.107' AS DateTime), N'Before_Up ')
SET IDENTITY_INSERT [dbo].[NhanVien_History] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (1, N'Nhà xuất bản Kim Đồng', N'Hà Nội', N'kimdong123@yahoo.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (2, N'Nhà xuất bản Trẻ', N'Hồ Chí Minh', N'trexuatban11@gmail.com')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (3, N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh', N'Hồ Chí Minh', N'tonghopthanhphoHCM@edu.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (4, N'Nhà xuất bản chính trị quốc gia - Sự thật', N'Hà Nội', N'chinhtriquocgia@td.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (5, N'Nhà xuất bản Giáo dục', N'Hà Nội', N'giaoduc@edu.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (6, N'Nhà xuất bản Hội Nhà văn', N'Đà Nẵng', N'hoinhavanvn@gmail.com')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (7, N'Nhà xuất bản Tư pháp', N'Hà Nội', N'tuphapvn@gmail.com')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (8, N'Nhà xuất bản thông tin và truyền thông', N'Hồ Chí Minh', N'thongtinvatruyenthong@.uk.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (9, N'Nhà xuất bản lao động', N'Hà Nội', N'laodongvn@.gmail.com')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (10, N'Nhà xuất bản giao thông vận tải', N'Quảng Ninh', N'giaothongvantai@goo.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (11, N'Nhà xuất bản Đại học Quốc Gia Hà Nội', N'Hà Nội', N'dhqghn@.edu.vn')
INSERT [dbo].[NhaXuatBan] ([NhaxuatbanID], [TenNXB], [Diachi], [Email]) VALUES (12, N'Nhà xuất bản Văn học', N'Hà Nội', N'vanhocvietnam@edu.com')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (1, N'Kafka on the Shore', N'kafkaShore.jpg', 14, 5, 12, CAST(N'2020-06-01' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (2, N'Đắc nhân tâm', N'dacnhantam.jpg', 8, 3, 2, CAST(N'2020-05-30' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (3, N'Đời CallBoy', N'doicallboy.jpg', 1, 9, 12, CAST(N'2020-07-13' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (4, N'Lạc giữa miền đau', N'lacgiuaniemdau.jpg', 1, 7, 6, CAST(N'2016-01-01' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (5, N'Người cũ còn thương', N'nguoicuconthuong.jpg', 1, 7, 6, CAST(N'2015-06-30' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (6, N'Chênh vênh 25', N'chenhvenh25.jpg', 1, 9, 12, CAST(N'2012-03-21' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (7, N'Khóc giữa Sài Gòn', N'khocgiuasaigon.jpg', 1, 9, 2, CAST(N'2014-09-14' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (8, N'Cho tôi xin một vé đi tuổi thơ', N'chotoixinmotvedituoitho.jpg', 2, 5, 6, CAST(N'2009-07-10' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (9, N'Tôi thấy hoa vàng trên cỏ xanh', N'toithayhoavangtrencoxanh.jpg', 2, 5, 2, CAST(N'2010-12-09' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (10, N'Tôi là Bêtô', N'toilabeto.jpg', 2, 8, 2, CAST(N'2011-02-12' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (11, N'Cô gái đến từ hôm qua', N'cogaidentuhomqua.jpg', 2, 9, 2, CAST(N'1989-05-26' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (12, N'Chuyện Về Những Người Cô Đơn', N'chuyenvenhungnguoicodon.jpg', 3, 7, 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (13, N'Chạy Trốn Mặt Trời', N'chaytronmattroi.jpg', 12, 3, 2, CAST(N'2020-08-06' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (14, N'Sóng gió', N'songgio.jpg', 1, 6, 5, CAST(N'1999-12-31' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (15, N'Thiện, ác và SmartPhone', N'thienacvasmartphone.jpg', 5, 3, 2, CAST(N'2020-12-12' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (20, N'Mỹ Nhân', N'mynhan.jpg', 11, 6, 8, CAST(N'2019-11-24' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (21, N'Tôi nói gì khi nói về chạy bộ', N'toinoigikhinoivechaybo.jpg', 14, 4, 4, CAST(N'1997-06-01' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (24, N'George orwell 1984', N'1984.jpg', 15, 7, 10, CAST(N'2015-02-14' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (25, N'Animal Farm', N'animalfarm.jpg', 3, 8, 6, CAST(N'1999-10-20' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (26, N'Nguồn cội', N'nguoncoi.jpg', 1, 8, 3, CAST(N'2007-01-26' AS Date))
INSERT [dbo].[Sach] ([SachID], [Tensach], [ImgLink], [TacgiaID], [TheloaiID], [NhaxuatbanID], [Namxuatban]) VALUES (29, N'Chiếc lá Cuối Cùng', N'chieclacuoicung.jpg', 7, 4, 8, CAST(N'1987-07-27' AS Date))
SET IDENTITY_INSERT [dbo].[Sach] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (1, N'Nguyễn Ngọc Thạch')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (2, N'Nguyễn Nhật Ánh')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (3, N'Hạ Vũ')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (4, N'Tuệ Nhi')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (5, N'Đặng Hoàng Giang')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (6, N'Du Phong')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (7, N'Adam Khoo')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (8, N'Dale Carnegie')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (9, N'Anh Khang')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (10, N'Sơn Paris')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (11, N'Đỗ Nhật Nam')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (12, N'Minh Nhật')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (13, N'Bill Bryson')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (14, N'Haruki Murakami')
INSERT [dbo].[TacGia] ([TacgiaID], [Tentacgia]) VALUES (15, N'George Orwell')
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (1, N'Chính trị – Pháp luật')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (2, N'Khoa học công nghệ – Kinh tế')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (3, N'Văn hóa xã hội – Lịch sử')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (4, N'Văn học nghệ thuật')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (5, N'Truyện, tiểu thuyết')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (6, N'Giáo trình')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (7, N'Tâm lý, tâm linh, tôn giáo')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (8, N'Sách thiếu nhi')
INSERT [dbo].[TheLoai] ([TheloaiID], [Tentheloai]) VALUES (9, N'Đời sống tinh thần')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[TheThuVien] ON 

INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (2, 3, CAST(N'2018-01-01' AS Date), CAST(N'2020-12-31' AS Date), 10, 1, N'admin123', N' 12345678', N'tan', N'0973316682  ', N'ngoctan7d@gmail.com', N'HNi hkabglqb')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (3, 7, CAST(N'2019-01-01' AS Date), CAST(N'2021-12-31' AS Date), 2, 1, N'ngoctan7d', N'12345678', N'Taannn', N'1234567890  ', N'bfka@gmail.com', N'Haf Nooij HCM ')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (4, 9, CAST(N'2019-02-01' AS Date), CAST(N'2021-12-31' AS Date), 1, 1, N'tinh123', N'123456', N'Tinhfff', N'1234441514  ', N'ngoc@gmail.com', N'HaNoinkngaag')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (5, 10, CAST(N'2020-01-01' AS Date), CAST(N'2022-12-31' AS Date), 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (6, 11, CAST(N'2019-03-01' AS Date), CAST(N'2021-12-31' AS Date), 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (7, 2, CAST(N'2019-05-01' AS Date), CAST(N'2021-12-31' AS Date), 4, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (8, 5, CAST(N'2020-02-01' AS Date), CAST(N'2022-12-31' AS Date), 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (9, 6, CAST(N'2018-01-02' AS Date), CAST(N'2020-01-01' AS Date), 7, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (10, 13, CAST(N'2019-01-03' AS Date), CAST(N'2021-12-31' AS Date), 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (11, 8, CAST(N'2020-02-01' AS Date), CAST(N'2022-12-31' AS Date), 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (12, 12, CAST(N'2019-02-02' AS Date), CAST(N'2021-12-31' AS Date), 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (13, 10, CAST(N'2019-03-02' AS Date), CAST(N'2021-12-31' AS Date), 5, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (14, 11, CAST(N'2018-03-01' AS Date), CAST(N'2020-12-31' AS Date), 6, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (15, 5, CAST(N'2018-06-06' AS Date), CAST(N'2020-05-06' AS Date), 2, 1, N'Admin', N'123456', N'Tân', N'0123456789  ', N'ngoctandig@gmail.com', N'Hà Nội khff')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (1015, NULL, NULL, NULL, NULL, NULL, N'admin123456', N'123456', N'ngoctan7d123', N'025625525   ', N'baffaga13@gmail.com', N'Nam Ði?nh Ha` Nô?i                                                                                                                                                                                      ')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (2015, NULL, CAST(N'2020-05-28' AS Date), CAST(N'2022-05-28' AS Date), NULL, 1, N'hoanghiep123', N'123456', N'Nguy?n Hoàng Hi?p', N'0123456898  ', N'hoanghiep@gmail,com', N'HNT  HF V Hà N?i                                                                                                                                                                                        ')
INSERT [dbo].[TheThuVien] ([ThethuvienID], [NhanvienID], [Ngaytaothe], [Ngayhethan], [Solangiahan], [Trangthai], [username], [password], [tentk], [sdt], [mail], [diachi]) VALUES (2016, NULL, CAST(N'2020-05-28' AS Date), CAST(N'2022-05-28' AS Date), NULL, 1, N'tinh123456', N'123456', N'doanngoctan15', N'0123456789  ', N'avava@gmail.com', N'Nam Ði?nh Haf Nooij                                                                                                                                                                                     ')
SET IDENTITY_INSERT [dbo].[TheThuVien] OFF
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD  CONSTRAINT [FK_DocGia_TheThuVien] FOREIGN KEY([ThethuvienID])
REFERENCES [dbo].[TheThuVien] ([ThethuvienID])
GO
ALTER TABLE [dbo].[DocGia] CHECK CONSTRAINT [FK_DocGia_TheThuVien]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_NhanVien] FOREIGN KEY([NhanvienmuonID])
REFERENCES [dbo].[NhanVien] ([NhanvienID])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_NhanVien]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_NhanVien1] FOREIGN KEY([NhanvientraID])
REFERENCES [dbo].[NhanVien] ([NhanvienID])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_NhanVien1]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_Sach] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_Sach]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_TheThuVien] FOREIGN KEY([ThethuvienID])
REFERENCES [dbo].[TheThuVien] ([ThethuvienID])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_TheThuVien]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([NhaxuatbanID])
REFERENCES [dbo].[NhaXuatBan] ([NhaxuatbanID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TacGia] FOREIGN KEY([TacgiaID])
REFERENCES [dbo].[TacGia] ([TacgiaID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TacGia]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TheLoai] FOREIGN KEY([TheloaiID])
REFERENCES [dbo].[TheLoai] ([TheloaiID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TheLoai]
GO
ALTER TABLE [dbo].[TheThuVien]  WITH CHECK ADD  CONSTRAINT [FK_TheThuVien_NhanVien] FOREIGN KEY([NhanvienID])
REFERENCES [dbo].[NhanVien] ([NhanvienID])
GO
ALTER TABLE [dbo].[TheThuVien] CHECK CONSTRAINT [FK_TheThuVien_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien_History]  WITH CHECK ADD CHECK  (([Operation]='INS' OR [Operation]='DEL' OR [Operation]='Before_Up' OR [Operation]='After_Up'))
GO
/****** Object:  StoredProcedure [dbo].[abc]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[abc](@temp nvarchar(100))
as 
select COUNT(Sach.SachID) as SL
from MuonTra,TheThuVien,Sach,TacGia
where MuonTra.SachID = Sach.SachID and MuonTra.ThethuvienID = TheThuVien.ThethuvienID and Sach.TacgiaID = Tacgia.TacgiaID and TacGia.Tentacgia = N'Nguyễn Nhật Ánh'
GO
/****** Object:  StoredProcedure [dbo].[AllBook]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[AllBook]

as
begin
	select *
	from Sach

end
GO
/****** Object:  StoredProcedure [dbo].[DocGiaMuonSachNhieuNhat]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DocGiaMuonSachNhieuNhat]
as
begin
	select top(1) COUNT(dg.DocgiaID) as N'Sô lần mượn', dg.DocgiaID, dg.Tendocgia 
	from TheThuVien ttv 
	inner join DocGia dg on dg.ThethuvienID = ttv.ThethuvienID
	inner join MuonTra mt on mt.ThethuvienID = ttv.ThethuvienID
	group by dg.DocgiaID, dg.Tendocgia
	order by COUNT(dg.DocgiaID) desc
end
GO
/****** Object:  StoredProcedure [dbo].[DocGiaQuaHanMuonSach]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DocGiaQuaHanMuonSach]
as
begin
	select dg.* from TheThuVien ttv 
	inner join DocGia dg on dg.ThethuvienID = ttv.ThethuvienID
	inner join MuonTra mt on mt.ThethuvienID = ttv.ThethuvienID
	where GETDATE() > mt.Ngaytra and mt.Datra = 0
end
GO
/****** Object:  StoredProcedure [dbo].[nhanVienDelete]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[nhanVienDelete]
	@id int
as
begin
	delete nv
	from NhanVien as nv
	
	inner join MuonTra mt on (mt.NhanvienmuonID=nv.NhanvienID or mt.NhanvientraID=nv.NhanvienID)
	inner join TheThuVien ttv on ttv.NhanvienID=nv.NhanvienID
	inner join DocGia dg on dg.ThethuvienID=ttv.ThethuvienID
	where nv.NhanvienID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[nhanVienInsert]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[nhanVienInsert]
	@name nvarchar(50),
	@address nvarchar(50),
	@sdt varchar(11)
as
begin
	insert NhanVien (Tennhanvien, Diachi, SDT)
	values (@name, @address, @sdt)
end

GO
/****** Object:  StoredProcedure [dbo].[nhanVienUpdate]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[nhanVienUpdate]
	@id int,
	@name nvarchar(50),
	@address nvarchar(50),
	@sdt varchar(11)
as
begin
	update NhanVien set Tennhanvien=@name, Diachi=@address, SDT=@sdt
	where NhanvienID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[SachDaMuonTrongThang]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SachDaMuonTrongThang]
	@thang int,
	@nam int
as
begin
	select distinct s.* from MuonTra mt
	inner join Sach s on mt.SachID = s.SachID
	where MONTH(mt.Ngaymuon) = @thang and YEAR(mt.Ngaymuon) = @nam
end
GO
/****** Object:  StoredProcedure [dbo].[SachDuocMuon]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SachDuocMuon]
	@top int
as
begin
	select  distinct top(@top) s.*
	from Sach s, MuonTra mt
	where mt.SachID = s.SachID


end
GO
/****** Object:  StoredProcedure [dbo].[slsach1]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[slsach1](@temp nvarchar(50))
as begin 
select COUNT(Sach.SachID) as SL
from MuonTra,TheThuVien,Sach,TacGia
where MuonTra.SachID = Sach.SachID and MuonTra.ThethuvienID = TheThuVien.ThethuvienID and Sach.TacgiaID = Tacgia.TacgiaID and TacGia.Tentacgia = @temp
end

GO
/****** Object:  StoredProcedure [dbo].[TheThuVienDalete]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TheThuVienDalete]
	@id int
as
begin
	delete DocGia where DocGia.ThethuvienID=@id
	delete MuonTra where MuonTra.ThethuvienID=@id
	delete TheThuVien where ThethuvienID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[TheThuVienInsert]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TheThuVienInsert]
	@nhanVienID int,
	@ngayTaoThe date,
	@ngayHetHan date,
	@soLanGiaHan int,
	@trangThai bit
as
begin
	insert TheThuVien (NhanvienID,Ngaytaothe,Ngayhethan,Solangiahan,Trangthai)
	values (@nhanVienID,@ngayTaoThe,@ngayHetHan,@soLanGiaHan,@trangThai)
end
GO
/****** Object:  StoredProcedure [dbo].[TheThuVienUpdate]    Script Date: 4/6/2021 4:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TheThuVienUpdate]
	@theThuVienID int,
	@nhanVienID int,
	@ngayTaoThe date,
	@ngayHetHan date,
	@soLanGiaHan int,
	@trangThai bit
as
begin
	update TheThuVien set NhanvienID=@nhanVienID,Ngaytaothe=@ngayTaoThe,Ngayhethan=@ngayHetHan,
						Solangiahan=@soLanGiaHan, Trangthai=@trangThai
	where ThethuvienID=@theThuVienID
end
GO
