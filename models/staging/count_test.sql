with data as (
	select teh 
	from public.analitika_croz_prakse_bidwh_2022_csv
),

count_test as (
	select teh, count(*)
	from data 
	group by teh 
	order by count(*) desc
)

select * from count_test

