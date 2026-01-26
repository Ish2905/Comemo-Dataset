# Comemo-Dataset

| File                       | Purpose                             |
| -------------------------- | ----------------------------------- |
| 01_load_json.sql           | Read JSONL into DuckDB              |
| 02_slim_tables.sql         | Keep only required columns          |
| 03_time_buckets.sql        | Create `year_month`                 |
| 04_monthly_aggregation.sql | Aggregate reviews per product-month |
| 05_growth_features.sql     | Growth, rating change, volatility   |
| 06_export_final.sql        | Write final Parquet                 |
