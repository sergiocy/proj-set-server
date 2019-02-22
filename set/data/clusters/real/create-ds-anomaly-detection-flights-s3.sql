!echo "--->CREATING DATABASE revenue IF NOT EXISTS<---";
CREATE DATABASE IF NOT EXISTS revenue;

!echo "--->CREATING TABLE REVENUE.DS_ANOMALY_DETECTION_FLIGHT<---";
DROP TABLE IF EXISTS  revenue.ds_anomaly_detection_flight;
CREATE EXTERNAL TABLE  revenue.ds_anomaly_detection_flight(
cd_flight_number INTEGER,
cd_airport_pair varchar(6),
dt_flight_date_local_zone date,
id_flight integer, --int
cum_lf_090 decimal (18,3),
cum_rask_090 decimal (18,3),
cum_lf_060 decimal (18,3),
cum_rask_060 decimal (18,3),
cum_lf_040 decimal (18,3),
cum_rask_040 decimal (18,3),
cum_lf_030 decimal (18,3),
cum_rask_030 decimal (18,3),
cum_lf_020 decimal (18,3),
cum_rask_020 decimal (18,3),
cum_lf_013 decimal (18,3),
cum_rask_013 decimal (18,3),
cum_lf_006 decimal (18,3),
cum_rask_006 decimal (18,3),
cum_lf_003 decimal (18,3),
cum_rask_003 decimal (18,3),
cum_lf_000 decimal (18,3),
cum_rask_000 decimal (18,3)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
LOCATION 's3://vueling-data-lake/3-analytics/model-inputs/commercial/revenue/ds-anomaly-detection-flight/'
;