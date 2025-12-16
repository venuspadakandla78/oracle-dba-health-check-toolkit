SELECT
    s1.sid || ',' || s1.serial# AS blocker,
    s2.sid || ',' || s2.serial# AS blocked,
    s2.event,
    s2.seconds_in_wait
FROM
    v$session s1
JOIN
    v$session s2
ON
    s2.blocking_session = s1.sid
WHERE
    s2.blocking_session IS NOT NULL
ORDER BY
    s2.seconds_in_wait DESC;
