# Location analysis

#for overall top cities
SELECT primary_location, COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs`
GROUP BY primary_location
ORDER BY job_count DESC
LIMIT 15;

-- Top roles within your top 5 cities
SELECT primary_location, standardized_role, COUNT(*) AS job_count
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE primary_location IN ('Bengaluru','Hyderabad','Pune','Chennai','Gurugram')
GROUP BY primary_location, standardized_role
ORDER BY primary_location, job_count DESC;

-- Data-role demand by city
SELECT primary_location, COUNT(DISTINCT jobId) AS data_jobs
FROM `india-job-market-intelligence.Job_Market.Jobs`
WHERE standardized_role IN ('Data Analyst','Data Scientist','Data Engineer','BI Analyst')
GROUP BY primary_location
ORDER BY data_jobs DESC
LIMIT 10;