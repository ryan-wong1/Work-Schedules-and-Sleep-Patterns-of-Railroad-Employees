-- Used Microsoft SQL Server, using MySQL will lead to missing rows when importing dataset in csv format

use RailroadStudy;

select *
from dbo.RailroadData;

-- create duplicate railroaddata table

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
from dbo.RailroadData;

select age_group,
case
when Age_Group = 1 then '20-29'
when Age_Group = 2 then '30-39'
when Age_Group = 3 then '40-49'
when Age_Group = 4 then '50-59'
when Age_Group = 5 then '60+'
end
from dbo.RailroadData;

--Sex: 1=Male, 2=Female
select Sex
from dbo.RailroadData;


--Job_type: 1=trick, 2=asst chief
select Job_type
from dbo.RailroadData;


--Marital_Status: 1=Not married, 2=married
select Marital_Status
from dbo.RailroadData;


--Caff_Beverages: 1=yes, 2=no
select Caff_Beverages
from dbo.RailroadData;


--Health_status: 1=poor, 2=fair, 3=good, 4=excellent
select Health_status
from dbo.RailroadData;


--Older_Younger_or_Same: 1=older, -1=younger, 0=same
select Older_Younger_or_Same
from dbo.RailroadData;


--Diagnosed_Sleep_disorder: 1=yes, 2=no
select Diagnosed_Sleep_disorder
from dbo.RailroadData;


--Sleep_Apnea: 1=yes, 2=no
select Sleep_Apnea
from dbo.RailroadData;


--Medical_treatment: 1=yes, 2=no, all blanks are N/A
select Medical_treatment
from dbo.RailroadData;


--job_schedule: 1=1st, 2=2nd, 3=3rd, 4=relief, 5=extraboard
select job_schedule
from dbo.RailroadData;


--**Relief_schedule: e.g., 11223 = 1st shift, 1st shift, 2nd shift, 2nd shift, 3rd shift
select Relief_schedule
from dbo.RailroadData;


--FRA_report: 1=yes, 2=no
select FRA_report
from dbo.RailroadData;




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