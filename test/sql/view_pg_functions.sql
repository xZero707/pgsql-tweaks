/**
 * Test for view pg_functions
 *
 * Every test does raise division by zero if it failes
 */
BEGIN;

-- Test if the function exists
WITH test AS
	(
		SELECT COUNT(*) AS exist
			, 0 AS zero
		FROM pg_catalog.pg_views
		WHERE viewname = 'pg_functions'
	)
SELECT
	CASE
		WHEN 1 / test.exist = 1 THEN
			TRUE
		ELSE
			(1 / zero)::BOOLEAN
	END AS res
FROM test
;

-- Test if the view runs without errors
WITH test AS
	(
	SELECT count(*) as key_count
			, 0 AS zero
	FROM pg_functions
	)
SELECT
	CASE
		WHEN key_count >= 0 THEN
			TRUE
		ELSE
			(1 / zero)::BOOLEAN
	END AS res
FROM test
;

ROLLBACK;
