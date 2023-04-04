WITH extracted_data AS (
  SELECT
    komentar,
    uc_match[1] AS uc,
    teh_match[1] AS teh,
    opis_match[1] AS opis
  FROM
    analitika_croz_prakse_bidwh_2022_csv
    LEFT JOIN LATERAL (SELECT regexp_matches(komentar, 'UC: ([^|]+)') AS uc_match) uc ON TRUE
    LEFT JOIN LATERAL (SELECT regexp_matches(komentar, 'TEH: ([^|]+)') AS teh_match) teh ON TRUE
    LEFT JOIN LATERAL (SELECT regexp_matches(komentar, '(?:UC: [^|]+\| |TEH: [^|]+\| )*(.+)') AS opis_match) opis ON TRUE
)
SELECT
  komentar,
  COALESCE(uc, '') AS uc,
  COALESCE(teh, '') AS teh,
  COALESCE(opis, '') AS opis
FROM
  extracted_data


