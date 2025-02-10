/*
ShoePlaceDB
Sales
FirstName varchar(30) not null not blank
LastName varchar(30) not null not blank
PhoneNumber char(10) not null all must be numeric
DateBought date not null before the current date
DateSold date not null before the current date
CostPrice decimal (5,2) not null greater than zero
SoldPrice decimal(5,2) not null greater than zero
CompanyName varchar(30) not null not blank
DateBought before DateSold
CostPrice less than SoldPrice
*/