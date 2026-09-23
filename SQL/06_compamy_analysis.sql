#This is for companies
-- Top hiring companies overall

SELECT companyName, COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY companyName
ORDER BY job_count DESC
LIMIT 15;

-- Companies hiring across the most distinct roles (breadth of hiring)

SELECT companyName, COUNT(DISTINCT standardized_role) AS distinct_roles, COUNT(*) AS total_jobs
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY companyName
HAVING COUNT(*) > 20
ORDER BY distinct_roles DESC
LIMIT 15;

#top skills requested by top companies
WITH top_companies AS (
  SELECT companyName
  FROM `india-job-market-intelligence.Job_Market.Jobs`
  GROUP BY companyName
  ORDER BY COUNT(*) DESC
  LIMIT 10
)
SELECT j.companyName, s.skill, COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs` j
JOIN `india-job-market-intelligence.Job_Market.Job_Skills` s ON j.jobId = s.jobId
JOIN top_companies t ON j.companyName = t.companyName
GROUP BY j.companyName, s.skill
ORDER BY j.companyName, job_count DESC;

