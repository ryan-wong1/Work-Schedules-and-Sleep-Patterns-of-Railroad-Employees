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

/*
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
*/

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
from dbo.RailroadData1;


--Sex: 1=Male, 2=Female
select Sex
from dbo.RailroadData1;

select sex,
case
when sex = 1 then 'Male'
when sex = 2 then 'Female'
end
from dbo.RailroadData1;


--Job_type: 1=trick, 2=asst chief
select Job_type
from dbo.RailroadData1;

select job_type,
case
when job_type = 1 then 'Trick Dispatcher'
when job_type = 2 then 'Assistant Chief'
end
from dbo.RailroadData1;


--Marital_Status: 1=Not married, 2=married
select Marital_Status
from dbo.RailroadData1;

select marital_status,
case
when marital_status = 1 then 'Not married'
when marital_status = 2 then 'Married'
end
from dbo.RailroadData1;


--Caff_Beverages: 1=yes, 2=no
select Caff_Beverages
from dbo.RailroadData1;

select caff_beverages,
case
when caff_beverages = 1 then 'Yes'
when caff_beverages = 2 then 'No'
end
from dbo.RailroadData1;


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
from dbo.RailroadData1;


--Older_Younger_or_Same: 1=older, -1=younger, 0=same
select Older_Younger_or_Same
from dbo.RailroadData1;

select older_younger_or_same,
case
when older_younger_or_same = 1 then 'Older'
when older_younger_or_same = -1 then 'Younger'
when older_younger_or_same = 0 then 'Same'
end
from dbo.RailroadData1;


--Diagnosed_Sleep_disorder: 1=yes, 2=no
select Diagnosed_Sleep_disorder
from dbo.RailroadData1;

select diagnosed_sleep_disorder,
case
when diagnosed_sleep_disorder = 1 then 'Yes'
when diagnosed_sleep_disorder = 2 then 'No'
end
from dbo.RailroadData1;


--Sleep_Apnea: 1=yes, 2=no
select Sleep_Apnea
from dbo.RailroadData1;

select sleep_apnea,
case
when sleep_apnea = 1 then 'Yes'
when sleep_apnea = 2 then 'No'
end
from dbo.RailroadData1;


--Medical_treatment: 1=yes, 2=no, all blanks are N/A
select Medical_treatment
from dbo.RailroadData1;

select medical_treatment,
case
when medical_treatment = 1 then 'Yes'
when medical_treatment = 2 then 'No'
end
from dbo.RailroadData1;


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
from dbo.RailroadData1;


--**Relief_schedule: e.g., 11223 = 1st shift, 1st shift, 2nd shift, 2nd shift, 3rd shift
select Relief_schedule
from dbo.RailroadData1;

select relief_schedule,
case
when relief_schedule = 1 then ''
when relief_schedule = 1 then ''
end
from dbo.RailroadData1;


--FRA_report: 1=yes, 2=no
select FRA_report
from dbo.RailroadData1;

select fra_report,
case
when fra_report = 1 then 'Yes'
when fra_report = 2 then 'No'
end
from dbo.RailroadData1;



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
