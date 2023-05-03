WITH updated_komentar AS (
SELECT
    *
  FROM
    parsed_comments_data 
) select
	godina,
	mjesec,
	dan,
	projekt
	FROM
    updated_komentar
    WHERE task like 'TIM%'
