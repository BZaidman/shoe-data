--1) Per season which shoes sold the least, most and average
 --   Seasons divided as follows: Mar - May = Spring, Jun - Aug = Summer, Sep - Nov = Fall, Dec - Feb = Winter
--AS You can't do the average on a varchar column.
select MinSold = min(s.CompanyName), MaxSold = max(s.CompanyName), 
Season = case when datepart(month,s.DateSold) in (3,4,5) then 'Spring' 
              when datepart(month,s.DateSold) in (6,7,8) then 'Summer'
              when datepart(month,s.DateSold) in (9,10,11) then 'Fall'
              when datepart(month,s.DateSold) in (1,2,12) then 'Winter'
        end
from sales s 
--AS You can't use the column name created in the group by, that's why it has to be repeated.
group by case when datepart(month,s.DateSold) in (3,4,5) then 'Spring' 
              when datepart(month,s.DateSold) in (6,7,8) then 'Summer'
              when datepart(month,s.DateSold) in (9,10,11) then 'Fall'
              when datepart(month,s.DateSold) in (1,2,12) then 'Winter'
        end
--2) for marketing information, which age group (divided by tens 1-10, 11-20 etc.) brought in the most profit
select top 1 AgeGroup = case when s.Age between 1 and 10 then '1-10' 
                       when s.Age between 11 and 20 then '11-20' 
                       when s.Age between 21 and 30 then '21-30'  
                       when s.Age between 31 and 40 then '31-40' 
                       when s.Age between 41 and 50 then '41-50' end,
       TotalProfit = sum(s.SoldPrice - s.CostPrice)
from sales s
group by case when s.Age between 1 and 10 then '1-10' 
                       when s.Age between 11 and 20 then '11-20' 
                       when s.Age between 21 and 30 then '21-30'  
                       when s.Age between 31 and 40 then '31-40' 
                       when s.Age between 41 and 50 then '41-50' end
order by TotalProfit desc
--3) To get the financial status, I will need a list of the annual total number of sales, and the total income
select NumSales = count(*), TotalIncome = sum(s.SoldPrice - s.CostPrice), Year = datepart(year,s.DateSold)
from Sales s 
group by datepart(year,s.DateSold)
order by Year
--4) What is the average time we had the shoes in stock based on the company  
select MonthsInStock = avg(datediff(month, s.DateBought, s.DateSold)), s.CompanyName
from Sales s 
group by s.CompanyName