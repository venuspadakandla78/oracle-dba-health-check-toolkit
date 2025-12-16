SELECT
    start_time,
    end_time,
    status,
    input_type,
    ROUND(output_bytes/1024/1024/1024,2) AS output_gb
FROM v$rman_backup_job_details
ORDER BY start_time DESC;
