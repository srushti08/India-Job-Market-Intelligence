SELECT
  (SELECT COUNT(*) FROM `india-job-market-intelligence.Job_Market.Jobs`) AS total_jobs,
  (SELECT COUNT(DISTINCT companyId) FROM `india-job-market-intelligence.Job_Market.Jobs`) AS total_companies,
  (SELECT COUNT(DISTINCT primary_location) FROM `india-job-market-intelligence.Job_Market.Jobs`) AS total_locations;



  SELECT
  ROUND(COUNTIF(avg_salary IS NOT NULL) * 100.0 / COUNT(*), 2) AS pct_salary_disclosed,
  ROUND(COUNTIF(min_experience IS NOT NULL) * 100.0 / COUNT(*), 2) AS pct_experience_specified
FROM `india-job-market-intelligence.Job_Market.Jobs`;


SELECT jobId, COUNT(*) AS cnt
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY jobId
HAVING COUNT(*) > 1;


SELECT *
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE jobId IN (11025022950, 31025020550, 11025020549)
ORDER BY jobId;