#This is for experience analysis
#job count fresher vc experience
SELECT experience_group, COUNT(*) AS job_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY experience_group
ORDER BY job_count DESC;


#Fresher-friendliness by role

SELECT standardized_role,
  COUNTIF(experience_group = 'Fresher / 0-1') AS fresher_jobs,
  COUNT(*) AS total_jobs,
  ROUND(COUNTIF(experience_group = 'Fresher / 0-1') * 100.0 / COUNT(*), 2) AS pct_fresher_friendly
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE standardized_role IN ('Data Analyst','Data Scientist','Data Engineer','BI Analyst','Business Analyst','ML Engineer')
GROUP BY standardized_role
ORDER BY pct_fresher_friendly DESC;