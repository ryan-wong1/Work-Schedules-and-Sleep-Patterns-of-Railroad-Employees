use RailroadStudy;

select *
from dbo.RailroadData1;



/* what is the distribution of employees by Age_Group, Sex, Marital_Status, Children_dependents, etc.
and how are the different levels of stress distributed between each group? (testing w/ just 'job_security' below) */
select age_group, count(*) as count
from dbo.RailroadData1
group by age_group
order by count(*) desc;

select sex, count(*) as count
from dbo.RailroadData1
group by sex
order by count(*) desc;

select marital_status, count(*) as count
from dbo.RailroadData1
group by marital_status
order by count(*) desc;

select children_dependents, count(*) as count
from dbo.RailroadData1
group by children_dependents
order by count(*) desc;

select age_group, job_security, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by age_group)) as age_group_percentage
from dbo.RailroadData1
group by age_group, job_security
order by age_group, count(*) desc;

select sex, job_security, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by sex)) as sex_percentage
from dbo.RailroadData1
group by sex, job_security
order by sex, count(*) desc;

select marital_status, job_security, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by marital_status)) as marital_status_percentage
from dbo.RailroadData1
group by marital_status, job_security
order by marital_status, count(*) desc;

select children_dependents, job_security, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by children_dependents)) as children_dependents_percentage
from dbo.RailroadData1
group by children_dependents, job_security
order by children_dependents, count(*) desc;



--what is the most common role and what is the difference between reported stress levels between the two?
--relevant stress columns to be measured: job_pressure, job_security, surges_in_work
select job_type, job_security, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by job_type)) as job_type_percentage
from dbo.RailroadData1
group by job_type, job_security
order by count(*) desc;

select job_type, job_pressure, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by job_type)) as job_type_percentage
from dbo.RailroadData1
group by job_type, job_pressure
order by count(*) desc;

select job_type, surges_in_work, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by job_type)) as job_type_percentage
from dbo.RailroadData1
group by job_type, surges_in_work
order by count(*) desc;



--do users who drink caffeinated beverages report higher or lower levels of stress?
--is there a certain number of caffeinated beverages drinked daily that equates to the lowest stress levels? column: if_yes_how_many_daily
--relevant stress columns to be measured: surges_in_work, emergencies, job_pressure
select caff_beverages, count(*) as count
from dbo.RailroadData1
group by caff_beverages
order by count(*) desc;

select if_yes_how_many_daily as cups_daily, surges_in_work, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by if_yes_how_many_daily)) as cups_daily_percentage
from dbo.RailroadData1
where surges_in_work = 'No stress' 
or surges_in_work = 'A little stress'
--where surges_in_work = 'Stressful'
--or surges_in_work = 'Very stressful'
and caff_beverages = 'Yes'
group by if_yes_how_many_daily, surges_in_work
order by if_yes_how_many_daily, count_percentage desc;

select if_yes_how_many_daily as cups_daily, emergencies, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by if_yes_how_many_daily)) as cups_daily_percentage
from dbo.RailroadData1
where emergencies = 'No stress' 
or emergencies = 'A little stress'
--where emergencies = 'Stressful'
--or emergencies = 'Very stressful'
and caff_beverages = 'Yes'
group by if_yes_how_many_daily, emergencies
order by if_yes_how_many_daily, count_percentage desc;

select if_yes_how_many_daily as cups_daily, job_pressure, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by if_yes_how_many_daily)) as cups_daily_percentage
from dbo.RailroadData1
where job_pressure = 'No stress' 
or job_pressure = 'A little stress'
--where job_pressure = 'Stressful'
--or job_pressure = 'Very stressful'
and caff_beverages = 'Yes'
group by if_yes_how_many_daily, job_pressure
order by if_yes_how_many_daily, count_percentage desc;

select caff_beverages, if_yes_how_many_daily, count(*) as count
from dbo.RailroadData1
group by caff_beverages, if_yes_how_many_daily
order by count(*) desc;



/* what is the most commonly reported stress level? How is this data distributed?
Measurements: Emergencies, Lack_of_Control, Sleep_loss, Coord_other_depts, Job_pressure, Scanty_Rules,
Mgmt_policies, Job_Security, Surges_in_work, Communication, Inadeq_Staff, Resp_for_others_safety, Break_time, Time_off */
select Job_pressure, count(*)
from dbo.RailroadData1
group by job_pressure
order by count(*) desc;



--what is the correlation between number of hours worked per week to levels of stress reported?
--relevant stress columns to be measured: sleep loss, break time, time off
select avg_work_hrs_week, sleep_loss, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by avg_work_hrs_week)) as avg_work_hrs_week_percentage
from dbo.RailroadData1
group by avg_work_hrs_week, sleep_loss
order by count(*) desc;



--do people who take more sick days per year report lower levels of stress?
--relevant stress columns to be measured: time_off, job_pressure
select sick_days_in_last_year, time_off, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by sick_days_in_last_year)) as sick_days_in_last_year_percentage
from dbo.RailroadData1
--where time_off = 'No stress' 
--or time_off = 'A little stress'
--where time_off = 'Stressful'
--or time_off = 'Very stressful'
group by sick_days_in_last_year, time_off
order by sick_days_in_last_year, count(*) desc;

select sick_days_in_last_year, job_pressure, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by sick_days_in_last_year)) as sick_days_in_last_year_percentage 
from dbo.RailroadData1
--where job_pressure = 'No stress' 
--or job_pressure = 'A little stress'
--where job_pressure = 'Stressful'
--or job_pressure = 'Very stressful'
group by sick_days_in_last_year, job_pressure
order by sick_days_in_last_year, count(*) desc;



--do people with less years of experience on the job report higher levels of stress?
--relevant stress columns to be measured: lack_of_control, job_pressure, job_security, surges_in_work, inadeq_staff
-- possibly create new column filtering out these values into groups of age ranges (20-29, etc) during visualization process. Current values too unorganized.
select total_years_dispatcher, job_pressure, count(*)
from dbo.RailroadData1
group by total_years_dispatcher, job_pressure
order by job_pressure, count(*) desc;

select total_years_present_job, job_pressure, count(*)
from dbo.RailroadData1
group by total_years_present_job, job_pressure
order by job_pressure, count(*) desc;



-- what job schedule equates to the highest stress levels?
--relevant stress columns to be measured: surges_in_work, job_pressure, coord_other_depts, emergencies
select job_schedule, surges_in_work, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by surges_in_work)) as surges_in_work_percentage
from dbo.RailroadData1
--where surges_in_work = 'No stress' 
--or surges_in_work = 'A little stress'
where surges_in_work = 'Stressful'
or surges_in_work = 'Very stressful'
group by job_schedule, surges_in_work
order by count(*) desc;

select job_schedule, job_pressure, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by job_pressure)) as job_pressure_percentage
from dbo.RailroadData1
--where job_pressure = 'No stress' 
--or job_pressure = 'A little stress'
where job_pressure = 'Stressful'
or job_pressure = 'Very stressful'
group by job_schedule, job_pressure
order by count(*) desc;

select job_schedule, coord_other_depts, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by coord_other_depts)) as coord_other_depts_percentage
from dbo.RailroadData1
--where coord_other_depts = 'No stress' 
--or coord_other_depts = 'A little stress'
where coord_other_depts = 'Stressful'
or coord_other_depts = 'Very stressful'
group by job_schedule, coord_other_depts
order by count(*) desc;

select job_schedule, emergencies, count(*) as count, (count(*) * 100 / sum(count(*)) over (partition by emergencies)) as emergencies_percentage
from dbo.RailroadData1
--where emergencies = 'No stress' 
--or emergencies = 'A little stress'
where emergencies = 'Stressful'
or emergencies = 'Very stressful'
group by job_schedule, emergencies
order by count(*) desc;


------
select *
from dbo.RailroadData1;



