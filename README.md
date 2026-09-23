# India Job Market Intelligence (2025)

An end-to-end data analytics project exploring the Indian job market using a dataset of ~98,000 job postings — covering data cleaning, SQL analysis, and a Power BI dashboard.

![Dashboard Preview](dashboard/dashboard_screenshot.png)

## 📊 Overview

This project analyzes real-world job posting data to answer questions about role demand, skill requirements, salary transparency, experience-level trends, and geographic hiring patterns across India.

**Dataset:** [Indian Job Market Dataset 2025-2026](https://www.kaggle.com/datasets/shivamshrivastava21/indian-job-market-dataset-2025-2026) (Kaggle)
**Scope:** 97,682 job postings · 18,328 companies · ~3-week window (Sept 25 – Oct 15, 2025)

## 🛠️ Tech Stack

- **Python** (pandas) — data cleaning, standardization, skill extraction
- **BigQuery (SQL)** — analytical queries, window functions, CTEs
- **Power BI** — interactive dashboard

## 📁 Project Structure

- `python/` — Jupyter notebook covering the full cleaning pipeline
- `sql/` — 7 SQL analysis files (data quality, roles, skills, experience, location, company, trends)
- `dashboard/` — Power BI dashboard and screenshot
- `docs/data_story.md` — full narrative write-up of findings
- `data/processed/` — final cleaned CSVs (jobs, companies, job_skills)

## 🧹 Data Cleaning Highlights

- Removed 247 exact duplicate rows; identified and documented 3 non-unique job IDs (0.003% of data)
- Standardized 55,000+ raw job titles into ~20 role categories via keyword matching
- Parsed relative posting dates ("3 Days Ago") into real calendar dates using a documented reference-date assumption
- Extracted and standardized skills from free-text tags into a controlled dictionary of 28 tech/data skills
- Treated ₹0 salary values as "undisclosed" rather than real zero-salary entries

## 🔑 Key Findings

1. **SQL (6.4%) and Python (6.1%)** are the two leading skills market-wide, nearly tied
2. **Excel is entry-level-weighted**; SQL, Python, and cloud skills peak in the 5–8 year experience band
3. **Bengaluru** drives ~18% of all postings and skews disproportionately technical vs. other cities
4. **Accenture** leads hiring by volume, but isn't the most role-diverse employer
5. **55% of postings** target candidates with ≤3 years of experience
6. **Only 34%** of postings disclose salary — all salary findings are scoped accordingly

Full narrative: [`docs/data_story.md`](docs/data_story.md)

## 📈 Dashboard

The Power BI dashboard includes:
- KPI summary (total jobs, companies, salary disclosure rate, early-career share)
- Top 10 roles, locations, companies, and skills
- Posting volume trend over the observation window

## ⚠️ Limitations

- Salary disclosed in only ~34% of postings — findings scoped accordingly
- Posting dates reconstructed via a documented reference-date assumption, not sourced directly
- Company names not fully standardized (minor name-variant duplication)
- 3-week observation window — trend findings are snapshots, not confirmed long-term trends

## 👤 Author

Srushti— Data Analyst
[GitHub](https://github.com/srushti08) · [LinkedIn](https://www.linkedin.com/in/srushti-nakil-4557bb242/)
