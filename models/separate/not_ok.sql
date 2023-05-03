WITH parsed_comment AS (
SELECT
    * 
  FROM
    parsed_comments_data 
) SELECT
	godina,
	mjesec,
	dan,
	projekt,
	task,
	djelatnik,
	redovno,
	prekovremeno,
	ukupno_sati,
	ukupno_cd,
	komentar,
    uc,
    teh,
    opis
  FROM
    parsed_comment
    where
    	teh = '' and 
    	task not like 'TIMSKI SASTANCI, RETROSPEKTIVE, RADIONICE'
