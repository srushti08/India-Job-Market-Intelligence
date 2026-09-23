-- this is for skill analysis
select * from  `india-job-market-intelligence.Job_Market.Job_Skills`;
-- Top 20 skills overall

SELECT
  skill,
  COUNT(*) AS job_count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `india-job-market-intelligence.Job_Market.Jobs`), 2) AS pct_of_all_jobs
FROM `india-job-market-intelligence.Job_Market.Job_Skills`
GROUP BY skill
ORDER BY job_count DESC
LIMIT 20;


-- Skills by experience level — junior vs senior story

SELECT
  j.experience_group,
  s.skill,
  COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Job_Skills` s
JOIN `india-job-market-intelligence.Job_Market.Jobs` j
  ON s.jobId = j.jobId
WHERE s.skill IN ('SQL', 'Python', 'Excel', 'AWS', 'Azure', 'Machine Learning', 'Power BI')
GROUP BY j.experience_group, s.skill
ORDER BY s.skill, j.experience_group;
-- ORDER BY job_count DESC;

-- skills requirement as per job role
SELECT
  j.standardized_role,
  s.skill,
  COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Job_Skills` s
JOIN `india-job-market-intelligence.Job_Market.Jobs` j ON s.jobId = j.jobId
WHERE j.standardized_role IN ('Data Analyst', 'Data Scientist', 'Data Engineer', 'BI Analyst')
GROUP BY j.standardized_role, s.skill
ORDER BY j.standardized_role, job_count DESC;



-- Skill co-occurrence — for example what pairs with SQL
SELECT
  s2.skill AS paired_skill,
  COUNT(*) AS co_occurrence_count
FROM `india-job-market-intelligence.Job_Market.Job_Skills` s1
JOIN `india-job-market-intelligence.Job_Market.Job_Skills` s2
  ON s1.jobId = s2.jobId AND s1.skill != s2.skill
WHERE s1.skill = 'SQL'
GROUP BY s2.skill
ORDER BY co_occurrence_count DESC
LIMIT 10;