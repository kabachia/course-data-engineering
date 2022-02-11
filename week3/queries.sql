QN 1:
------
SELECT COUNT(1) FROM `zoomcamp-339208.nytaxi.external_fhv_tripdata` WHERE EXTRACT(YEAR FROM pickup_datetime)=2019;

QN 2:
------
SELECT COUNT(DISTINCT(dispatching_base_num )) FROM `zoomcamp-339208.nytaxi.external_fhv_tripdata` WHERE EXTRACT(YEAR FROM pickup_datetime)=2019;

QN 4:
------
SELECT COUNT(1) FROM `zoomcamp-339208.nytaxi.fhv_tripdata_partitoned_clustered` 
WHERE DATE(pickup_datetime) BETWEEN  '2019-01-01' AND '2019-03-31'
AND dispatching_base_num IN ('B00987', 'B02060', 'B02279');

