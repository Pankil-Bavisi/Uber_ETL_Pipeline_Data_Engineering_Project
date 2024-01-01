CREATE OR REPLACE TABLE uber-data-analyst-17.uber_data_engineering.tbl_analytics AS (
SELECT 
f.trip_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
rate.rate_code_name,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

FROM 

uber-data-analyst-17.uber_data_engineering.fact_table f
JOIN uber-data-analyst-17.uber_data_engineering.datetime_dim d ON f.datetime_id = d.datetime_id
JOIN uber-data-analyst-17.uber_data_engineering.passenger_count_dim p ON f.passenger_count_id = p.passenger_count_id
JOIN uber-data-analyst-17.uber_data_engineering.trip_distance_dim t ON f.trip_distance_id = t.trip_distance_id
JOIN uber-data-analyst-17.uber_data_engineering.pickup_location_dim pick ON f.pickup_location_id = pick.pickup_location_id
JOIN uber-data-analyst-17.uber_data_engineering.dropoff_location_dim drop ON f.dropoff_location_id = drop.dropoff_location_id
JOIN uber-data-analyst-17.uber_data_engineering.rate_code_dim rate ON f.rate_code_id = rate.rate_code_id
JOIN uber-data-analyst-17.uber_data_engineering.payment_type_dim pay ON f.payment_type_id = pay.payment_type_id
);