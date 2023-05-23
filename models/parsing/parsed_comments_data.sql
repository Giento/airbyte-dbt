WITH updated_komentar AS (
SELECT
    *,
    REGEXP_REPLACE(
      komentar,
      '(?i)(TEH:|TEH :|TECH:|TECH :)',
      'TEH:',
      'g'
    ) AS transformed_komentar
  FROM
    analitika_croz_prakse_bidwh_2022_csv
) select
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
    transformed_komentar AS komentar,
    coalesce(TRIM(uc_match[1]), '') AS uc,
    coalesce(TRIM(teh_match[1]), '') AS teh,
    coalesce(TRIM(opis_match[1]), '') AS opis
  FROM
    updated_komentar
    LEFT JOIN LATERAL (SELECT regexp_matches(transformed_komentar, 'UC: ([^|]+)') AS uc_match) uc ON TRUE
    LEFT JOIN LATERAL (SELECT regexp_matches(transformed_komentar, 'TEH: ([^|]+)') AS teh_match) teh ON TRUE
    LEFT JOIN LATERAL (SELECT regexp_matches(transformed_komentar, '(?:UC: [^|]+\| |TEH: [^|]+\|)*(.+)') AS opis_match) opis ON true
