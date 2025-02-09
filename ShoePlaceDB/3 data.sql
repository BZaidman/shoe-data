use ShoePlaceDB
go

delete Sales
go 

insert Sales(CustomerName, Age, PhoneNumber, DateBought, DateSold, CostPrice, SoldPrice, CompanyName, Returned)
select 
concat(i.InventorLastName, ', ', InventorFirstName), 
i.YearInvented - i.YearBorn,
concat('(', i.YearInvented - 1000, ')', substring(reverse(i.YearDied),1,3),'-', i.YearBorn),
datefromparts(concat(20, left(i.YearBorn, 2)),01, 01),
datefromparts(concat(20, left(i.YearDied,2)),
            case
                 when left(i.InventionName, 1) like '[a-d]' then 02
                 when left(i.InventionName, 1) like '[e-h]' then 04
                 when left(i.InventionName, 1) like '[i-l]' then 06
                 when left(i.InventionName, 1) like '[m-p]' then 08
                 when left(i.InventionName, 1) like '[q-u]' then 10
                 when left(i.InventionName, 1) like '[v-z]' then 12 
              end,
              concat(1, right(i.YearDied,1))),
left(i.YearBorn, 3),
(i.YearInvented - i.YearBorn) + left(i.YearDied, 3),
case i.Country when 'England' then 'SAS'
               when 'France' then 'Nike'
               when 'Germany' then 'Adidas'
               when 'Gerrmany' then 'Florsheim'
               when 'Great Britain' then 'Puma'
               when 'Holland' then 'New Balance'
               when 'Romania' then 'Rockport' 
               when 'Sweden' then 'Reebok'
               when 'USA' then 'Cole Haan'
end, 
case when i.YearInvented - i.YearBorn in (29, 31,40) then 1 else 0 end
from RecordKeeperDB.dbo.Invention i
select * from sales
