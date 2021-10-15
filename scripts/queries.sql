-- Pivot on Meat and Diary Overconsumption

select * 
from crosstab(
	$$
		select cp.city, cr."row_number", sum(cast(cr.response_answer as numeric)::numeric)
		from 
			city_responses cr, city_population cp 
		where 
			cr.account_number = cp.account_number 
			and cr.question_name = 'What is the per capita meat and dairy consumption (kg/yr) in your city?'
			and cr.row_name in ('Meat consumption per capita (kg/year)', 'Dairy consumption per capita (kg/year)')
			and cr.column_name  = 'Amount'
			and cr.response_answer not in ('0', 'NA', 'Question not applicable')
			and cast(cr.response_answer as numeric) < 1000
			group by cp.city, cr."row_number" 
			order by 1, 2
	$$
	) as ct("city" varchar, "meat" numeric, "dairy" numeric)


-- city names from account number

select distinct city, account_number 
from cities c 
where 
    c.account_number in (
        1850,3422,3429,8242,20113,31090,31108,31111,31149,31153,31155,31157,31170,31173,31174,31175,31176,31179,31187,32480,35268,35449,35853,35863,35867,35885,35886,35893,35897,35905,36426,42178,42384,43917,43932,43938,43940,46470,50154,50674,50678,50782,54104,54337,54402,54409,54488,54510,54521,55325,55334,58395,58489,58513,59165,59535,59631,60073,60229,60236,60349,60433,62855,69850,74643,826207,839673,840521,843399,848474
    );

-- population 

select account_number, city, max(population) 
from cities c 
where 
    c.account_number in (
        1850,3422,3429,8242,20113,31090,31108,31111,31149,31153,31155,31157,31170,31173,31174,31175,31176,31179,31187,32480,35268,35449,35853,35863,35867,35885,35886,35893,35897,35905,36426,42178,42384,43917,43932,43938,43940,46470,50154,50674,50678,50782,54104,54337,54402,54409,54488,54510,54521,55325,55334,58395,58489,58513,59165,59535,59631,60073,60229,60236,60349,60433,62855,69850,74643,826207,839673,840521,843399,848474
    )
group by 
    account_number, city
order by 
    account_number, city 
