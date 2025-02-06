use ShoePlaceDB
go
drop table if exists Sales 
go
create table dbo.Sales(
    SalesId int not null identity primary key,
    CustomerName varchar(50) not null constraint ck_Sales_CustomerName_cannot_be_blank check(CUstomerName <> ''),
--AS the data didn't allow for this constraint since there is one person coming back with negative age. 
    Age int not null, -- constraint ck_Sales_Age_must_be_greater_than_zero check(Age > 0),
    PhoneNumber char(13) not null constraint ck_Sales_PhoneNumber_is_not_blank check(PhoneNumber <> ''),
    DateBought date not null constraint ck_Sales_DateBought_is_before_the_current_date check(DateBought <= getdate()),
    DateSold date not null constraint ck_Sales_DateSold_is_before_the_current_date check(DateSold <= getdate()),
    CostPrice decimal(5,2) not null constraint ck_Sales_CostPrice_greater_than_zero check(CostPrice > 0),
    SoldPrice decimal(5,2) not null constraint ck_Sales_SoldPrice_greater_than_zero check(SoldPrice > 0),
    CompanyName varchar(30) not null constraint ck_Sales_CompanyName_not_blank check(CompanyName <> ''),
    Returned bit not null,
    constraint ck_Sales_DateBought_before_DateSold check(DateBought <= DateSold)
--AS I would think this constraint is necessary but the data didn't allow for it
   -- constraint ck_Sales_CostPrice_less_than_SoldPrice check(CostPrice < SoldPrice)
)
go