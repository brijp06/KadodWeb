CREATE TABLE SubCenterDetails (
    SubCenterDetailsId int PRIMARY KEY IDENTITY,
    PHCId int NOT NULL,
    UserId int NOT NULL,
    SubCenterName nvarchar(max),
    CreatedBy int NOT NULL,
    CreatedAt datetime NOT NULL,
    UpdatedBy int NULL,
    UpdatedAt datetime NULL,
    IsActive bit NOT NULL
);