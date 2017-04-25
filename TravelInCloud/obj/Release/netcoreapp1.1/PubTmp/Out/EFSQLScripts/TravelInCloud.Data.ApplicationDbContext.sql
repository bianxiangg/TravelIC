IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [ConcurrencyStamp] nvarchar(max),
        [Name] nvarchar(256),
        [NormalizedName] nvarchar(256),
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max),
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [AccessFailedCount] int NOT NULL,
        [ConcurrencyStamp] nvarchar(max),
        [Discriminator] nvarchar(max) NOT NULL,
        [Email] nvarchar(256),
        [EmailConfirmed] bit NOT NULL,
        [IconAddress] nvarchar(max),
        [LockoutEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset,
        [NickName] nvarchar(max),
        [NormalizedEmail] nvarchar(256),
        [NormalizedUserName] nvarchar(256),
        [PasswordHash] nvarchar(max),
        [PhoneNumber] nvarchar(max),
        [PhoneNumberConfirmed] bit NOT NULL,
        [SecurityStamp] nvarchar(max),
        [TwoFactorEnabled] bit NOT NULL,
        [UserName] nvarchar(256),
        [openid] nvarchar(max),
        [StoreId] int IDENTITY,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [ClaimType] nvarchar(max),
        [ClaimValue] nvarchar(max),
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [ClaimType] nvarchar(max),
        [ClaimValue] nvarchar(max),
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max),
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE TABLE [Products] (
        [ProductId] int NOT NULL IDENTITY,
        [OwnerId] nvarchar(450),
        CONSTRAINT [PK_Products] PRIMARY KEY ([ProductId]),
        CONSTRAINT [FK_Products_AspNetUsers_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_UserId] ON [AspNetUserRoles] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    CREATE INDEX [IX_Products_OwnerId] ON [Products] ([OwnerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172655_createproduct')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005172655_createproduct', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172737_createproductType')
BEGIN
    CREATE TABLE [ProductType] (
        [ProductTypeId] int NOT NULL IDENTITY,
        [BelongingProductId] int NOT NULL,
        CONSTRAINT [PK_ProductType] PRIMARY KEY ([ProductTypeId]),
        CONSTRAINT [FK_ProductType_Products_BelongingProductId] FOREIGN KEY ([BelongingProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172737_createproductType')
BEGIN
    CREATE INDEX [IX_ProductType_BelongingProductId] ON [ProductType] ([BelongingProductId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172737_createproductType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005172737_createproductType', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172921_createOrder')
BEGIN
    CREATE TABLE [Order] (
        [OrderId] int NOT NULL IDENTITY,
        [OwnerId] nvarchar(450),
        CONSTRAINT [PK_Order] PRIMARY KEY ([OrderId]),
        CONSTRAINT [FK_Order_AspNetUsers_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172921_createOrder')
BEGIN
    CREATE INDEX [IX_Order_OwnerId] ON [Order] ([OwnerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005172921_createOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005172921_createOrder', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173011_createPtinOrder')
BEGIN
    CREATE TABLE [ProductInOrder] (
        [ProductInOrderId] int NOT NULL IDENTITY,
        [OrderId] int NOT NULL,
        [ProductTypeId] int NOT NULL,
        CONSTRAINT [PK_ProductInOrder] PRIMARY KEY ([ProductInOrderId]),
        CONSTRAINT [FK_ProductInOrder_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([OrderId]) ON DELETE CASCADE,
        CONSTRAINT [FK_ProductInOrder_ProductType_ProductTypeId] FOREIGN KEY ([ProductTypeId]) REFERENCES [ProductType] ([ProductTypeId]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173011_createPtinOrder')
BEGIN
    CREATE INDEX [IX_ProductInOrder_OrderId] ON [ProductInOrder] ([OrderId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173011_createPtinOrder')
BEGIN
    CREATE INDEX [IX_ProductInOrder_ProductTypeId] ON [ProductInOrder] ([ProductTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173011_createPtinOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005173011_createPtinOrder', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173308_nothing')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005173308_nothing', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [FK_Order_AspNetUsers_OwnerId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] DROP CONSTRAINT [FK_ProductInOrder_Order_OrderId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] DROP CONSTRAINT [FK_ProductInOrder_ProductType_ProductTypeId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductType] DROP CONSTRAINT [FK_ProductType_Products_BelongingProductId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductType] DROP CONSTRAINT [PK_ProductType];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] DROP CONSTRAINT [PK_ProductInOrder];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [PK_Order];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductType] ADD CONSTRAINT [PK_ProductTypes] PRIMARY KEY ([ProductTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] ADD CONSTRAINT [PK_ProductInOrders] PRIMARY KEY ([ProductInOrderId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [Order] ADD CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [Order] ADD CONSTRAINT [FK_Orders_AspNetUsers_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] ADD CONSTRAINT [FK_ProductInOrders_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([OrderId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductInOrder] ADD CONSTRAINT [FK_ProductInOrders_ProductTypes_ProductTypeId] FOREIGN KEY ([ProductTypeId]) REFERENCES [ProductType] ([ProductTypeId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    ALTER TABLE [ProductType] ADD CONSTRAINT [FK_ProductTypes_Products_BelongingProductId] FOREIGN KEY ([BelongingProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'ProductType.IX_ProductType_BelongingProductId', N'IX_ProductTypes_BelongingProductId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'ProductInOrder.IX_ProductInOrder_ProductTypeId', N'IX_ProductInOrders_ProductTypeId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'ProductInOrder.IX_ProductInOrder_OrderId', N'IX_ProductInOrders_OrderId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'Order.IX_Order_OwnerId', N'IX_Orders_OwnerId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'ProductType', N'ProductTypes';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'ProductInOrder', N'ProductInOrders';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    EXEC sp_rename N'Order', N'Orders';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161005173614_nothingagain')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161005173614_nothingagain', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [RegisterTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StartStoreTime] datetime2;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreDescription] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreLocation] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreName] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063055_CreateTimeAndStoreInformation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161008063055_CreateTimeAndStoreInformation', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063821_createStoreType')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreType] int;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161008063821_createStoreType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161008063821_createStoreType', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161011122420_ChangeModel')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreOwnerCode] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161011122420_ChangeModel')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [StoreOwnerName] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161011122420_ChangeModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161011122420_ChangeModel', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    CREATE TABLE [ImageOfProduct] (
        [ImageOfProductId] int NOT NULL IDENTITY,
        [ImageDescription] nvarchar(max),
        [ImageSrc] nvarchar(max),
        [ProductId] int NOT NULL,
        CONSTRAINT [PK_ImageOfProduct] PRIMARY KEY ([ImageOfProductId]),
        CONSTRAINT [FK_ImageOfProduct_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [ProductTypes] ADD [OldPrice] decimal(18, 2) NOT NULL DEFAULT 0.0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [ProductTypes] ADD [Price] decimal(18, 2) NOT NULL DEFAULT 0.0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [ProductTypes] ADD [ProductTypeDetails] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [ProductTypes] ADD [ProductTypeName] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [Products] ADD [ProductDetails] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [Products] ADD [ProductInfo] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [Products] ADD [ProductName] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    ALTER TABLE [Products] ADD [ProductWarnning] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    CREATE INDEX [IX_ImageOfProduct_ProductId] ON [ImageOfProduct] ([ProductId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015135005_ImplementedProductModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161015135005_ImplementedProductModel', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015141023_createTimes')
BEGIN
    ALTER TABLE [Products] ADD [BuyTimes] int NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161015141023_createTimes')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161015141023_createTimes', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161017081032_whathappened')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'AspNetUsers') AND [c].[name] = N'StoreId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUsers] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [AspNetUsers] DROP COLUMN [StoreId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161017081032_whathappened')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161017081032_whathappened', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161020073137_CreateTwoInfoForUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [IDCode] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161020073137_CreateTwoInfoForUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Name] nvarchar(max);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161020073137_CreateTwoInfoForUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161020073137_CreateTwoInfoForUser', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161023100819_CreateViewTimes')
BEGIN
    ALTER TABLE [Products] ADD [ViewTimes] int NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161023100819_CreateViewTimes')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161023100819_CreateViewTimes', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    DROP TABLE [ProductInOrders];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    ALTER TABLE [Orders] ADD [CreateTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    ALTER TABLE [Orders] ADD [Paid] bit NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    ALTER TABLE [Orders] ADD [ProductTypeId] int NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    CREATE INDEX [IX_Orders_ProductTypeId] ON [Orders] ([ProductTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_ProductTypes_ProductTypeId] FOREIGN KEY ([ProductTypeId]) REFERENCES [ProductTypes] ([ProductTypeId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161101074000_ChangeOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161101074000_ChangeOrder', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161102083938_CreateUseTime')
BEGIN
    ALTER TABLE [Orders] ADD [UseTime] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161102083938_CreateUseTime')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161102083938_CreateUseTime', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104144931_AddUsedProperty')
BEGIN
    ALTER TABLE [Orders] ADD [Used] bit NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104144931_AddUsedProperty')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161104144931_AddUsedProperty', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104150702_CreateNewOrderStatus')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'Orders') AND [c].[name] = N'Paid');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Orders] DROP COLUMN [Paid];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104150702_CreateNewOrderStatus')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'Orders') AND [c].[name] = N'Used');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Orders] DROP COLUMN [Used];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104150702_CreateNewOrderStatus')
BEGIN
    ALTER TABLE [Orders] ADD [OrderStatus] smallint NOT NULL DEFAULT 0;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161104150702_CreateNewOrderStatus')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161104150702_CreateNewOrderStatus', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161106155604_CreateLocationSheet')
BEGIN
    CREATE TABLE [Location] (
        [LocationId] int NOT NULL IDENTITY,
        [LocationName] nvarchar(max),
        CONSTRAINT [PK_Location] PRIMARY KEY ([LocationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161106155604_CreateLocationSheet')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [LocationId] int;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161106155604_CreateLocationSheet')
BEGIN
    CREATE INDEX [IX_AspNetUsers_LocationId] ON [AspNetUsers] ([LocationId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161106155604_CreateLocationSheet')
BEGIN
    ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_Location_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Location] ([LocationId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161106155604_CreateLocationSheet')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161106155604_CreateLocationSheet', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    ALTER TABLE [AspNetUsers] DROP CONSTRAINT [FK_AspNetUsers_Location_LocationId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    ALTER TABLE [Location] DROP CONSTRAINT [PK_Location];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    ALTER TABLE [Location] ADD CONSTRAINT [PK_Locations] PRIMARY KEY ([LocationId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    ALTER TABLE [AspNetUsers] ADD CONSTRAINT [FK_AspNetUsers_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Location] ([LocationId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    EXEC sp_rename N'Location', N'Locations';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108085756_RenameLocationTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161108085756_RenameLocationTable', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130527_CreateComment')
BEGIN
    CREATE TABLE [Comment] (
        [CommentId] int NOT NULL IDENTITY,
        [Content] nvarchar(max),
        [ProductId] int NOT NULL,
        [PublishTime] datetime2 NOT NULL,
        [UserId] nvarchar(450),
        CONSTRAINT [PK_Comment] PRIMARY KEY ([CommentId]),
        CONSTRAINT [FK_Comment_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE,
        CONSTRAINT [FK_Comment_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130527_CreateComment')
BEGIN
    CREATE INDEX [IX_Comment_ProductId] ON [Comment] ([ProductId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130527_CreateComment')
BEGIN
    CREATE INDEX [IX_Comment_UserId] ON [Comment] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130527_CreateComment')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161108130527_CreateComment', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] DROP CONSTRAINT [FK_Comment_Products_ProductId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] DROP CONSTRAINT [FK_Comment_AspNetUsers_UserId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] DROP CONSTRAINT [PK_Comment];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] ADD CONSTRAINT [PK_Comments] PRIMARY KEY ([CommentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comments_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    ALTER TABLE [Comment] ADD CONSTRAINT [FK_Comments_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    EXEC sp_rename N'Comment.IX_Comment_UserId', N'IX_Comments_UserId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    EXEC sp_rename N'Comment.IX_Comment_ProductId', N'IX_Comments_ProductId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    EXEC sp_rename N'Comment', N'Comments';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20161108130907_RenameComments')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20161108130907_RenameComments', N'1.1.1');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170420033636_gitclonestart')
BEGIN
    DROP INDEX [IX_AspNetUserRoles_UserId] ON [AspNetUserRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170420033636_gitclonestart')
BEGIN
    DROP INDEX [RoleNameIndex] ON [AspNetRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170420033636_gitclonestart')
BEGIN
    CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170420033636_gitclonestart')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20170420033636_gitclonestart', N'1.1.1');
END;

GO

