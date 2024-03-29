#-----------------------------DATA DICTIONARY----------------------------------

SELECT distinct
	    t.table_schema AS Database_name,
       t.table_name,
       (CASE WHEN t.table_type = 'BASE TABLE' THEN 'table'
			 WHEN t.table_type = 'VIEW' THEN 'view'
             ELSE t.table_type
        END) AS table_type,
        c.column_name,
        c.column_type,
        c.column_default,
        c.column_key,
        c.is_nullable,
        c.extra,
        c.column_comment
FROM information_schema.tables AS t
INNER JOIN information_schema.columns AS c
ON t.table_name = c.table_name
AND t.table_schema = c.table_schema
WHERE t.table_type IN ('BASE TABLE', 'VIEW')
AND t.table_schema = 'TOYfeliZ'
ORDER BY
		c.column_name,
		t.table_schema,
         t.table_name,
         c.ordinal_position;