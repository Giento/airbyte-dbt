with test as (
	select
		"_airbyte_ab_id",
		teh,
		ukupno_sati,
		prekovremeno
	from public.analitika_croz_prakse_bidwh_2022_csv		
),

test_dbt_model as (
	select * 
	from test
)

select * from test_dbt_model

