/* This query for investing job demand */
-- Role demand Overall
SELECT
  standardized_role,
  COUNT(*) AS job_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY standardized_role
ORDER BY job_count DESC;

-- Zoom into the data/analytics roles specifically
SELECT
  standardized_role,
  COUNT(*) AS job_count,
  ROUND(AVG(avg_salary), 0) AS avg_salary_where_disclosed,
  ROUND(COUNTIF(avg_salary IS NOT NULL) * 100.0 / COUNT(*), 2) AS pct_salary_disclosed
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE standardized_role IN ('Data Analyst', 'Data Scientist', 'Data Engineer', 'BI Analyst', 'Business Analyst', 'ML Engineer', 'Product Analyst')
GROUP BY standardized_role
ORDER BY job_count DESC;


-- Role demand by experience level
SELECT
  standardized_role,
  experience_group,
  COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE standardized_role IN ('Data Analyst', 'Data Scientist', 'Data Engineer', 'BI Analyst', 'Business Analyst', 'ML Engineer')
GROUP BY standardized_role, experience_group
ORDER BY experience_group, job_count DESC;

#top hiring company for data based role
SELECT
  companyName,
  standardized_role,
  COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE standardized_role IN ('Data Analyst', 'Data Scientist', 'Data Engineer', 'BI Analyst', 'Business Analyst', 'ML Engineer')
GROUP BY companyName, standardized_role
ORDER BY job_count DESC
LIMIT 20;