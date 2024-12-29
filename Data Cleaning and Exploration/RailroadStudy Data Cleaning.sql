-- Used Microsoft SQL Server, using MySQL will lead to missing rows when importing dataset in csv format

use RailroadStudy;

select *
from dbo.RailroadData;

-- duplicate copy of RailroadData:
--select *
--into dbo.RailroadData1
--from dbo.RailroadData;

select *
from dbo.RailroadData1;

select *
from dbo.Variables;


/* -----------------------------------------------------------------------------------------------------
CONVERSIONS FROM VARIABLES TABLE:
Age_Group: 1=20-29, 2=30-39, 3=40-49, 4=50-59, 5=60+
Sex: 1=Male, 2=Female
Job_type: 1=trick, 2=asst chief
Marital_Status: 1=Not married, 2=married
Caff_Beverages: 1=yes, 2=no
Health_status: 1=poor, 2=fair, 3=good, 4=excellent
Older_Younger_or_Same: 1=older, -1=younger, 0=same
Diagnosed_Sleep_disorder: 1=yes, 2=no
Sleep_Apnea: 1=yes, 2=no
Medical_treatment: 1=yes, 2=no, all blanks are N/A
job_schedule: 1=1st, 2=2nd, 3=3rd, 4=relief, 5=extraboard
**Relief_schedule: e.g., 11223 = 1st shift, 1st shift, 2nd shift, 2nd shift, 3rd shift
FRA_report: 1=yes, 2=no

Alert_at_Work, Mentally_Drained, Phys_Drained: 1=never, 2=occasionally, 3=frequently, 4=always

Emergencies, Lack_of_control, Sleep_loss, Coord_other_depts, Job_pressure, 
Scanty_Rules, Mgmt_policies, Job_Security, Surges_in_work, Communication
Inadeq_Staff, Resp_for_others_safety, Break_time, Time_off:
1=no stress, 2=a little stress, 3=stressful, 4=very stressful
*/------------------------------------------------------------------------------------------------------

/*
-- Convert Childrendependents column into Children_dependents
exec sp_rename 'RailroadData1.Childrendependents', 'Children_dependents', 'column';

-- Convert job_schedule into Job_schedule
exec sp_rename 'RailroadData1.job_schedule', 'Job_schedule', 'column';

-- Convert BreakTime into Break_time
exec sp_rename 'RailroadData1.BreakTime', 'Break_time', 'column';

-- Convert TimeOff into Time_off
exec sp_rename 'RailroadData1.TimeOff', 'Time_off', 'column';
*/

--View data type of all columns
SELECT Column_Name, Data_Type
FROM INFORMATION_SCHEMA.COLUMNS
Where table_name = 'RailroadData1';


--update 'CONVERSIONS FROM VARIABLES TABLE' column names to be compatible w/ string format for conversions below
alter table RailroadData1
alter column Age_Group nvarchar(255);

alter table RailroadData1
alter column Sex nvarchar(255);

alter table RailroadData1
alter column Job_type nvarchar(255);

alter table RailroadData1
alter column Marital_Status nvarchar(255);

alter table RailroadData1
alter column Caff_Beverages nvarchar(255);

alter table RailroadData1
alter column Health_status nvarchar(255);

alter table RailroadData1
alter column Older_Younger_or_Same nvarchar(255);

alter table RailroadData1
alter column Diagnosed_Sleep_disorder nvarchar(255);

alter table RailroadData1
alter column Sleep_Apnea nvarchar(255);

alter table RailroadData1
alter column Medical_treatment nvarchar(255);

alter table RailroadData1
alter column Job_schedule nvarchar(255);

alter table RailroadData1
alter column FRA_report nvarchar(255);

alter table RailroadData1
alter column Alert_at_Work nvarchar(255);

alter table RailroadData1
alter column Mentally_Drained nvarchar(255);

alter table RailroadData1
alter column Phys_Drained nvarchar(255);

alter table RailroadData1
alter column Emergencies nvarchar(255);

alter table RailroadData1
alter column Lack_of_control nvarchar(255);

alter table RailroadData1
alter column Sleep_loss nvarchar(255);

alter table RailroadData1
alter column Coord_other_depts nvarchar(255);

alter table RailroadData1
alter column Job_pressure nvarchar(255);

alter table RailroadData1
alter column Scanty_Rules nvarchar(255);

alter table RailroadData1
alter column Mgmt_policies nvarchar(255);

alter table RailroadData1
alter column Job_Security nvarchar(255);

alter table RailroadData1
alter column Surges_in_work nvarchar(255);

alter table RailroadData1
alter column Communication nvarchar(255);

alter table RailroadData1
alter column Inadeq_Staff nvarchar(255);

alter table RailroadData1
alter column Resp_for_others_safety nvarchar(255);

alter table RailroadData1
alter column Break_time nvarchar(255);

alter table RailroadData1
alter column Time_off nvarchar(255);


------------------------
select *
from dbo.RailroadData1;
------------------------



--                 *****              where try_cast('column name' as int) is not null                *****
-- this was added to the end of each query to skip past all NULL values when applying changes to each cell for each column
-- without this condition, an error occurs because NULL cannot be converted to an integer, leading to a data type mismatch
-- other option would be to convert all NULL values to something like 'Not available' as a string



--Age_Group: 1=20-29, 2=30-39, 3=40-49, 4=50-59, 5=60+
select Age_Group
from dbo.RailroadData1;

select age_group,
case
when age_group = 1 then '20-29'
when age_group = 2 then '30-39'
when age_group = 3 then '40-49'
when age_group = 4 then '50-59'
when age_group = 5 then '60+'
end
from dbo.RailroadData1
where try_cast(age_group as int) is not null;


update RailroadData1
set age_group = 
case
when age_group = 1 then '20-29'
when age_group = 2 then '30-39'
when age_group = 3 then '40-49'
when age_group = 4 then '50-59'
when age_group = 5 then '60+'
end
where try_cast(age_group as int) is not null;



--Sex: 1=Male, 2=Female
select Sex
from dbo.RailroadData1;

select sex,
case
when sex = 1 then 'Male'
when sex = 2 then 'Female'
end
from dbo.RailroadData1
where try_cast(sex as int) is not null;

update RailroadData1
set sex = 
case
when sex = 1 then 'Male'
when sex = 2 then 'Female'
end
where try_cast(sex as int) is not null;



--Job_type: 1=trick, 2=asst chief
select Job_type
from dbo.RailroadData1;

select job_type,
case
when job_type = 1 then 'Trick Dispatcher'
when job_type = 2 then 'Assistant Chief'
end
from dbo.RailroadData1
where try_cast(job_type as int) is not null;

update RailroadData1
set Job_type = 
case
when job_type = 1 then 'Trick Dispatcher'
when job_type = 2 then 'Assistant Chief'
end
where try_cast(job_type as int) is not null;



--Marital_Status: 1=Not married, 2=married
select Marital_Status
from dbo.RailroadData1;

select marital_status,
case
when marital_status = 1 then 'Not married'
when marital_status = 2 then 'Married'
end
from dbo.RailroadData1
where try_cast(marital_status as int) is not null;

update RailroadData1
set Marital_Status = 
case
when marital_status = 1 then 'Not married'
when marital_status = 2 then 'Married'
end
where try_cast(marital_status as int) is not null;



--Caff_Beverages: 1=yes, 2=no
select Caff_Beverages
from dbo.RailroadData1;

select caff_beverages,
case
when caff_beverages = 1 then 'Yes'
when caff_beverages = 2 then 'No'
end
from dbo.RailroadData1
where try_cast(caff_beverages as int) is not null;

update RailroadData1
set Caff_Beverages= 
case
when caff_beverages = 1 then 'Yes'
when caff_beverages = 2 then 'No'
end
where try_cast(caff_beverages as int) is not null;



--Health_status: 1=poor, 2=fair, 3=good, 4=excellent
select Health_status
from dbo.RailroadData1;

select health_status,
case
when health_status = 1 then 'Poor'
when health_status = 2 then 'Fair'
when health_status = 3 then 'Good'
when health_status = 4 then 'Excellent'
end
from dbo.RailroadData1
where try_cast(health_status as int) is not null;

update RailroadData1
set Health_status= 
case
when health_status = 1 then 'Poor'
when health_status = 2 then 'Fair'
when health_status = 3 then 'Good'
when health_status = 4 then 'Excellent'
end
where try_cast(health_status as int) is not null;



--Older_Younger_or_Same: 1=older, -1=younger, 0=same
select Older_Younger_or_Same
from dbo.RailroadData1;

select older_younger_or_same,
case
when older_younger_or_same = 1 then 'Older'
when older_younger_or_same = -1 then 'Younger'
when older_younger_or_same = 0 then 'Same'
end
from dbo.RailroadData1
where try_cast(older_younger_or_same as int) is not null;

update RailroadData1
set Older_Younger_or_Same= 
case
when older_younger_or_same = 1 then 'Older'
when older_younger_or_same = -1 then 'Younger'
when older_younger_or_same = 0 then 'Same'
end
where try_cast(older_younger_or_same as int) is not null;



--Diagnosed_Sleep_disorder: 1=yes, 2=no
select Diagnosed_Sleep_disorder
from dbo.RailroadData1;

select diagnosed_sleep_disorder,
case
when diagnosed_sleep_disorder = 1 then 'Yes'
when diagnosed_sleep_disorder = 2 then 'No'
end
from dbo.RailroadData1
where try_cast(diagnosed_sleep_disorder as int) is not null;

update RailroadData1
set Diagnosed_Sleep_disorder=
case
when diagnosed_sleep_disorder = 1 then 'Yes'
when diagnosed_sleep_disorder = 2 then 'No'
end
where try_cast(diagnosed_sleep_disorder as int) is not null;



--Sleep_Apnea: 1=yes, 2=no
select Sleep_Apnea
from dbo.RailroadData1;

select sleep_apnea,
case
when sleep_apnea = 1 then 'Yes'
when sleep_apnea = 2 then 'No'
end
from dbo.RailroadData1
where try_cast(sleep_apnea as int) is not null;

update RailroadData1
set Sleep_Apnea= 
case
when sleep_apnea = 1 then 'Yes'
when sleep_apnea = 2 then 'No'
end
where try_cast(sleep_apnea as int) is not null;



--Medical_treatment: 1=yes, 2=no, all blanks are N/A
select Medical_treatment
from dbo.RailroadData1;

select medical_treatment,
case
when medical_treatment = 1 then 'Yes'
when medical_treatment = 2 then 'No'
end
from dbo.RailroadData1
where try_cast(medical_treatment as int) is not null;


update RailroadData1
set Medical_treatment= 
case
when medical_treatment = 1 then 'Yes'
when medical_treatment = 2 then 'No'
end
where try_cast(medical_treatment as int) is not null;



--job_schedule: 1=1st, 2=2nd, 3=3rd, 4=relief, 5=extraboard
select job_schedule
from dbo.RailroadData1;

select job_schedule,
case
when job_schedule = 1 then '1st'
when job_schedule = 2 then '2nd'
when job_schedule = 3 then '3rd'
when job_schedule = 4 then 'Relief'
when job_schedule = 5 then 'Extraboard'
end
from dbo.RailroadData1
where try_cast(job_schedule as int) is not null;

update RailroadData1
set job_schedule= 
case
when job_schedule = 1 then '1st'
when job_schedule = 2 then '2nd'
when job_schedule = 3 then '3rd'
when job_schedule = 4 then 'Relief'
when job_schedule = 5 then 'Extraboard'
end
where try_cast(job_schedule as int) is not null;



--**Relief_schedule: e.g., 11223 = 1st shift, 1st shift, 2nd shift, 2nd shift, 3rd shift
update RailroadData1
set Relief_schedule = 
case
when Relief_schedule = '11223' then '1st, 1st, 2nd, 2nd, 3rd'
when Relief_schedule = '11222' then '1st, 1st, 2nd, 2nd, 2nd'
when Relief_schedule = '12233' then '1st, 2nd, 2nd, 3rd, 3rd'
when Relief_schedule = '22223' then '2nd, 2nd, 2nd, 2nd, 3rd'
when Relief_schedule = 'E3333' then 'Emergency, 3rd, 3rd, 3rd, 3rd'
when Relief_schedule = '12222' then '1st, 2nd, 2nd, 2nd, 2nd'
when Relief_schedule = '11112' then '1st, 1st, 1st, 1st, 2nd'
when Relief_schedule = 'other' then 'Other'
when Relief_schedule = '11233' then '1st, 1st, 2nd, 3rd, 3rd'
when Relief_schedule = '11333' then '1st, 1st, 3rd, 3rd, 3rd'
when Relief_schedule = '23333' then '2nd, 3rd, 3rd, 3rd, 3rd'
when Relief_schedule = '111222' then '1st, 1st, 1st, 2nd, 2nd, 2nd'
when Relief_schedule = '22233' then '2nd, 2nd, 2nd, 3rd, 3rd'
when Relief_schedule = '333EE' then '3rd, 3rd, 3rd, Emergency, Emergency'
when Relief_schedule = '11122' then '1st, 1st, 1st, 2nd, 2nd'
when Relief_schedule = '33222' then '3rd, 3rd, 2nd, 2nd, 2nd'
end
where Relief_schedule is not null;



--FRA_report: 1=yes, 2=no
select FRA_report
from dbo.RailroadData1;

select fra_report,
case
when fra_report = 1 then 'Yes'
when fra_report = 2 then 'No'
end
from dbo.RailroadData1
where try_cast(fra_report as int) is not null;

update RailroadData1
set FRA_report= 
case
when fra_report = 1 then 'Yes'
when fra_report = 2 then 'No'
end
where try_cast(fra_report as int) is not null;



--Alert_at_Work, Mentally_Drained, Phys_Drained: 1=never, 2=occasionally, 3=frequently, 4=always
update RailroadData1
set 
alert_at_work = case
when alert_at_work = 1 then 'Never'
when alert_at_work = 2 then 'Occasionally'
when alert_at_work = 3 then 'Frequently'
when alert_at_work = 4 then 'Always'
end,
mentally_drained = case
when mentally_drained = 1 then 'Never'
when mentally_drained = 2 then 'Occasionally'
when mentally_drained = 3 then 'Frequently'
when mentally_drained = 4 then 'Always'
end,
phys_drained = case
when phys_drained = 1 then 'Never'
when phys_drained = 2 then 'Occasionally'
when phys_drained = 3 then 'Frequently'
when phys_drained = 4 then 'Always'
end
where 
try_cast(alert_at_work as int) is not null and 
try_cast(mentally_drained as int) is not null and 
try_cast(phys_drained as int) is not null;



/*
Emergencies, Lack_of_control, Sleep_loss, Coord_other_depts, Job_pressure, 
Scanty_Rules, Mgmt_policies, Job_Security, Surges_in_work, Communication
Inadeq_Staff, Resp_for_others_safety, Break_time, Time_off:
1=no stress, 2=a little stress, 3=stressful, 4=very stressful
*/
update RailroadData1
set 
emergencies = case
when emergencies = 1 then 'No stress'
when emergencies = 2 then 'A little stress'
when emergencies = 3 then 'Stressful'
when emergencies = 4 then 'Very stressful'
end,
lack_of_control = case
when lack_of_control = 1 then 'No stress'
when lack_of_control = 2 then 'A little stress'
when lack_of_control = 3 then 'Stressful'
when lack_of_control = 4 then 'Very stressful'
end,
sleep_loss = case
when sleep_loss = 1 then 'No stress'
when sleep_loss = 2 then 'A little stress'
when sleep_loss = 3 then 'Stressful'
when sleep_loss = 4 then 'Very stressful'
end,
coord_other_depts = case
when coord_other_depts = 1 then 'No stress'
when coord_other_depts = 2 then 'A little stress'
when coord_other_depts = 3 then 'Stressful'
when coord_other_depts = 4 then 'Very stressful'
end,
job_pressure = case
when job_pressure = 1 then 'No stress'
when job_pressure = 2 then 'A little stress'
when job_pressure = 3 then 'Stressful'
when job_pressure = 4 then 'Very stressful'
end,
scanty_rules = case
when scanty_rules = 1 then 'No stress'
when scanty_rules = 2 then 'A little stress'
when scanty_rules = 3 then 'Stressful'
when scanty_rules = 4 then 'Very stressful'
end,
mgmt_policies = case
when mgmt_policies = 1 then 'No stress'
when mgmt_policies = 2 then 'A little stress'
when mgmt_policies = 3 then 'Stressful'
when mgmt_policies = 4 then 'Very stressful'
end,
job_security = case
when job_security = 1 then 'No stress'
when job_security = 2 then 'A little stress'
when job_security = 3 then 'Stressful'
when job_security = 4 then 'Very stressful'
end,
surges_in_work = case
when surges_in_work = 1 then 'No stress'
when surges_in_work = 2 then 'A little stress'
when surges_in_work = 3 then 'Stressful'
when surges_in_work = 4 then 'Very stressful'
end,
communication = case
when communication = 1 then 'No stress'
when communication = 2 then 'A little stress'
when communication = 3 then 'Stressful'
when communication = 4 then 'Very stressful'
end,
inadeq_staff = case
when inadeq_staff = 1 then 'No stress'
when inadeq_staff = 2 then 'A little stress'
when inadeq_staff = 3 then 'Stressful'
when inadeq_staff = 4 then 'Very stressful'
end,
resp_for_others_safety = case
when resp_for_others_safety = 1 then 'No stress'
when resp_for_others_safety = 2 then 'A little stress'
when resp_for_others_safety = 3 then 'Stressful'
when resp_for_others_safety = 4 then 'Very stressful'
end,
Break_time = case
when Break_time = 1 then 'No stress'
when Break_time = 2 then 'A little stress'
when Break_time = 3 then 'Stressful'
when Break_time = 4 then 'Very stressful'
end,
Time_off = case
when Time_off = 1 then 'No stress'
when Time_off = 2 then 'A little stress'
when Time_off = 3 then 'Stressful'
when Time_off = 4 then 'Very stressful'
end
where 
try_cast(emergencies as int) is not null and 
try_cast(lack_of_control as int) is not null and 
try_cast(sleep_loss as int) is not null and 
try_cast(coord_other_depts as int) is not null and 
try_cast(job_pressure as int) is not null and 
try_cast(scanty_rules as int) is not null and 
try_cast(mgmt_policies as int) is not null and 
try_cast(job_security as int) is not null and 
try_cast(surges_in_work as int) is not null and 
try_cast(communication as int) is not null and 
try_cast(inadeq_staff as int) is not null and 
try_cast(resp_for_others_safety as int) is not null and 
try_cast(Break_time as int) is not null and 
try_cast(Time_off as int) is not null;


--total_years_dispatcher_filtered (new column)
--total_years_dispatcher but filtered into year groups (1-5, 6-10, etc.)
select *,
case
when total_years_dispatcher <= 5 then '0 - 5 years'
when total_years_dispatcher <= 10 then '6 - 10 years'
when total_years_dispatcher <= 20 then '11 - 20 years'
when total_years_dispatcher <= 30 then '21 - 30 years'
else '31+ years'
end as total_years_dispatcher_filtered,
case
when total_years_present_job <= 5 then '0 - 5 years'
when total_years_present_job <= 10 then '6 - 10 years'
when total_years_present_job <= 20 then '11 - 20 years'
when total_years_present_job <= 30 then '21 - 30 years'
else '31+ years'
end as total_years_present_job_filtered
from dbo.RailroadData1;

alter table RailroadData1
add total_years_dispatcher_filtered varchar(15);

alter table RailroadData1
add total_years_present_job_filtered varchar(15);

update RailroadData1
set total_years_dispatcher_filtered = case
when total_years_dispatcher <= 5 then '0 - 5 years'
when total_years_dispatcher <= 10 then '6 - 10 years'
when total_years_dispatcher <= 20 then '11 - 20 years'
when total_years_dispatcher <= 30 then '21 - 30 years'
else '31+ years'
end,
total_years_present_job_filtered = case
when total_years_present_job <= 5 then '0 - 5 years'
when total_years_present_job <= 10 then '6 - 10 years'
when total_years_present_job <= 20 then '11 - 20 years'
when total_years_present_job <= 30 then '21 - 30 years'
else '31+ years'
end;



----cleaned RailroadData1 pre-join----
select *
from dbo.RailroadData1;
------------------------------------



-- created an independant table (RailroadStressRatings) containing only all of the stress related columns from the original dataset and excluding everything else
-- RailroadStressRatings shows the stress ratings in numeric (1 - 4) values instead of 'No stress', 'A little stress', 'Stressful', and 'Very stressful'. Added '_Rating' to the end of each stress related column name. EX: Job_pressure > Job_pressure_Rating
-- needed these numeric values to create certain visualizations via tableau
select *
from dbo.RailroadStressRatings;



-- joining RailroadStressRatings to RailRoadData1 via common key of ID
-- this is the finalized dataset
select *
from dbo.RailroadData1
inner join dbo.RailroadStressRatings
on dbo.RailroadData1.ID = dbo.RailroadStressRatings.ID;
