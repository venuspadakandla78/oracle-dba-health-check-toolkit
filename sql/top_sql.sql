SELECT *
FROM (
    SELECT
        sql_id,
        parsing_schema_name,
        executions,
        ROUND(elapsed_time/1000000,2) AS elapsed_sec,
        ROUND((elapsed_time/1000000)/NULLIF(executions,0),2) AS sec_per_exec
    FROM v$sql
    ORDER BY elapsed_time DESC
)
WHERE ROWNUM <= 10;
