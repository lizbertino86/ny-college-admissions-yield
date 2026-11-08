# NY College Admissions: Selectivity vs. Yield

## Question
Do more selective New York colleges have higher yield than less selective ones?

## Data
IPEDS 2024 ([data files](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx)). I joined the institution directory (hd) and admissions (adm) tables on UNITID, filtered to New York 4-year schools with more than 500 applicants, and removed non-4-year schools because students treat 2-year and 4-year schools differently. The final analysis covers 113 schools.

- **Admit rate** = admitted ÷ applicants
- **Yield** = enrolled ÷ admitted

## Findings
I grouped schools into three tiers by admit rate:

| Tier | Admit rate | Average yield |
|---|---|---|
| Highly selective | under 25% | 49.8% |
| Selective | 25–60% | 22.7% |
| Less selective | over 60% | 15.3% |

Overall, more selective schools had higher yields. I identified 7 high-yield outliers that were not highly selective, and all of them offer niche programs. Schools like FIT (fashion) and Yeshiva (Jewish education) yield high because students apply to them on purpose, not as a backup.

## Files
- `01_ny_join.sql`: joins hd and adm and filters to New York schools
- `02_admit_yield.sql`: calculates admit rate and yield for each school
- `03_tiers.sql`: groups schools into selectivity tiers
- `04_tiers_4yr.sql`: filters to 4-year schools and averages yield by tier
- `05_high_yield.sql`: identifies the high-yield outliers



**Interactive dashboard:** [NY College Selectivity vs Yield](https://public.tableau.com/app/profile/elizabeth.barton7692/viz/NYCollegeSelectivityvsYield/Dashboard)
