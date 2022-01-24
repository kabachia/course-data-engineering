---
3
---
select count(1) from yellow_taxi_trips where
date(tpep_pickup_datetime)='2021-01-15';

---
4
---
select date(tpep_pickup_datetime) from yellow_taxi_trips
where date_part('month',tpep_pickup_datetime)=1
order by tip_amount desc limit 1;

---
5
---
select PUZone,DoZone,count(DoZone) num_of_trips from
(select a."tpep_pickup_datetime",
PUZones."Borough" PUBorough,PUZones."Zone" PUZOne,
DOZones."Borough" DOBorough,DOZones."Zone" DOZone
from yellow_taxi_trips a
left join zones PUZOnes on a."PULocationID"=PUZOnes."LocationID"
left join zones DOZOnes on a."DOLocationID"=DOZOnes."LocationID") tbl_named_zones
where lower(PUZone)='central park' and date(tpep_pickup_datetime)='2021-01-14'
group by PUZone,DoZone order by num_of_trips desc limit 10;

---
6
---
select route,sum(total_amount)/count(route) average_trip_cost from
(select a."total_amount",
concat(
	case when PUZones."Zone" is null then 'UNKNOWN' else PUZones."Zone" end,
	'/',
	case when DOZones."Zone" is null then 'UNKNOWN' else DOZones."Zone" end) route
from yellow_taxi_trips a
left join zones PUZOnes on a."PULocationID"=PUZOnes."LocationID"
left join zones DOZOnes on a."DOLocationID"=DOZOnes."LocationID") tbl_named_zones
group by route order by average_trip_cost desc limit 10;
