Use amishadb;
Create table Climate_logs (
log_id int auto_increment Primary key,
city varchar(50) Not null,
recorded_at datetime Not null,
temperature_C decimal (5,2),
Windspeed_kmh decimal (5,2),
weather_code int,
is_alert tinyint (1) default(0),
unique key unique_City_time (city, recorded_at)
);
use amishadb;
select * from Climate_log;
Rename table Climate_log to Climate_logs;
Alter table Climate_logs Change  column temprature_C temperature_C decimal(5,2);
use amishadb;
select * from Climate_logs;
