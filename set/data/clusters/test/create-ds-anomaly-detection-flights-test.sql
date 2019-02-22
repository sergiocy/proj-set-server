
CREATE DATABASE IF NOT EXISTS clusters;

DROP TABLE IF EXISTS  clusters.ds_clusters_test;
CREATE EXTERNAL TABLE  clusters.ds_clusters_test(
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
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
--hdfs location
LOCATION '/clusters/test/'
;
