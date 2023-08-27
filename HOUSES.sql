select * from houses;

#Q1 How many houses are registered?

select count(*) as Total_count from houses;

#Q2 How many Houses have 2 bedrooms,2 bathrooms and a garden as well?

select id from houses 
where bathrooms=2 and bedrooms=2 and garden=1;

#Q3 Show the average Houses price by each street from Highest price to lowest

select street,avg(price_pounds) as avg_price from houses
group by street
order by avg_price desc;

#Q4 Find range of prices of the houses available

select max(price_pounds) as max_price,min(price_pounds) as min_price from houses;

#Q5 Show houses have prices higher than the average prices of houses near the wimbledon station

select id,nearest_station_name,price_pounds from houses where price_pounds>(select avg(price_pounds) from houses where nearest_station_name="Wimbledon Station");

#Q6 Divide the houses by their location

select
case when nearest_station_miles <= 0.2 then 'Prime Location'
when nearest_station_miles between 0.3 and 0.5 then 'Good Location'
when nearest_station_miles between 0.6 and 1.0 then 'Average Location'
else 'Poor Location'
end as location_type,
count(id) as number_of_houses
from houses
group by location_type;

#Q7 Find the number of houses in every street in London

select distinct(street), count(id) over(partition by street) as number_of_houses from houses 
order by number_of_houses desc;

#Q8  Select the cheapest houses having tenure on leasehold and size_sqft greater than 5000 sqfeet

select id,tenure,size_sqft from houses
where tenure="leasehold" and size_sqft>5000
order by price_pounds asc;

#Q9 Show houses id that have postcode starting from W and are not near the Imperial Wharf Sation

select id ,Postcode,nearest_station_name from houses 
where tenure='freehold' and nearest_station_name != 'Imperial Wharf Station';

#10 Select the Average bedrooms and Average Bathroom  for the street 'Moxon Street, London, W1U' 

select street,avg(bedrooms) as avg_bedrooms,avg(Bathrooms) as avg_Bathrooms from houses
where street ='Moxon Street, London, W1U';

#Q11 show most Big houses for postcode ordered by max to min price
 
 select id,max(size_sqft) over(partition by postcode) as max_house_size ,postcode,price_pounds from houses
 order by price_pounds desc ;









