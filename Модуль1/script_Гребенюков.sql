USE [examNewTestBdGrebenukov]
GO
/****** Object:  Table [dbo].[Material_type_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type_import](
	[material_type_id] [int] NOT NULL,
	[material_type] [nvarchar](100) NOT NULL,
	[percentage_of_defects] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Material_type_import] PRIMARY KEY CLUSTERED 
(
	[material_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_import](
	[partner_id] [int] NOT NULL,
	[partner_type_id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[director] [nvarchar](100) NOT NULL,
	[email_partner] [nvarchar](100) NOT NULL,
	[phone_partner] [nvarchar](100) NOT NULL,
	[address_partner] [nvarchar](100) NOT NULL,
	[inn] [bigint] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Product_type_import] PRIMARY KEY CLUSTERED 
(
	[partner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_products_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_products_import](
	[sales_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[partner_id] [int] NOT NULL,
	[count] [int] NOT NULL,
	[data_sales] [date] NOT NULL,
 CONSTRAINT [PK_Partner_products_import] PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partner_type_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partner_type_import](
	[partner_type_id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_partner_type_import] PRIMARY KEY CLUSTERED 
(
	[partner_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type_import](
	[type_product_id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[coef_type_product] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Product_type_import_1] PRIMARY KEY CLUSTERED 
(
	[type_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_import]    Script Date: 2025-04-29 10:55:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_import](
	[product_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[article] [int] NOT NULL,
	[min_cost_for_partner] [numeric](18, 2) NOT NULL,
	[material_id] [int] NOT NULL,
 CONSTRAINT [PK_Products_import] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partner_import]  WITH CHECK ADD  CONSTRAINT [FK_Partner_import_partner_type_import] FOREIGN KEY([partner_type_id])
REFERENCES [dbo].[partner_type_import] ([partner_type_id])
GO
ALTER TABLE [dbo].[Partner_import] CHECK CONSTRAINT [FK_Partner_import_partner_type_import]
GO
ALTER TABLE [dbo].[Partner_products_import]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_import_Partner_import] FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partner_import] ([partner_id])
GO
ALTER TABLE [dbo].[Partner_products_import] CHECK CONSTRAINT [FK_Partner_products_import_Partner_import]
GO
ALTER TABLE [dbo].[Partner_products_import]  WITH CHECK ADD  CONSTRAINT [FK_Partner_products_import_Products_import] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_import] ([product_id])
GO
ALTER TABLE [dbo].[Partner_products_import] CHECK CONSTRAINT [FK_Partner_products_import_Products_import]
GO
ALTER TABLE [dbo].[Products_import]  WITH CHECK ADD  CONSTRAINT [FK_Products_import_Material_type_import] FOREIGN KEY([material_id])
REFERENCES [dbo].[Material_type_import] ([material_type_id])
GO
ALTER TABLE [dbo].[Products_import] CHECK CONSTRAINT [FK_Products_import_Material_type_import]
GO
ALTER TABLE [dbo].[Products_import]  WITH CHECK ADD  CONSTRAINT [FK_Products_import_Product_type_import] FOREIGN KEY([type_id])
REFERENCES [dbo].[Product_type_import] ([type_product_id])
GO
ALTER TABLE [dbo].[Products_import] CHECK CONSTRAINT [FK_Products_import_Product_type_import]
GO
