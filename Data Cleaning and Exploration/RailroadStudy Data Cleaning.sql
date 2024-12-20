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
Inadeq_Staff, Resp_for_others_safety, BreakTime, TimeOff:
1=no stress, 2=a little stress, 3=stressful, 4=very stressful
*/------------------------------------------------------------------------------------------------------

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
alter column job_schedule nvarchar(255);

alter table RailroadData1
alter column FRA_report nvarchar(255);


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


/*
--**Relief_schedule: e.g., 11223 = 1st shift, 1st shift, 2nd shift, 2nd shift, 3rd shift
select Relief_schedule
from dbo.RailroadData1;

select relief_schedule,
case
when relief_schedule = 1 then ''
when relief_schedule = 1 then ''
end
from dbo.RailroadData1;

update RailroadData1
set Relief_schedule= 
case
when relief_schedule = 1 then ''
when relief_schedule = 1 then ''
end;
*/


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




/*
Emergencies, Lack_of_control, Sleep_loss, Coord_other_depts, Job_pressure, 
Scanty_Rules, Mgmt_policies, Job_Security, Surges_in_work, Communication
Inadeq_Staff, Resp_for_others_safety, BreakTime, TimeOff:
1=no stress, 2=a little stress, 3=stressful, 4=very stressful
*/



-- Convert blank values into?

-- Convert Childrendependents column into Children_dependents

-- Convert job_schedule into Job_schedule

-- Convert BreakTime into Break_time

-- Convert TimeOff into Time_off
