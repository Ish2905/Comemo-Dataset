-- =====================================================
-- SQL-02: Temporal Aggregation (Monthly Buckets)
-- Creates monthly product-level aggregates
-- =====================================================

CREATE OR REPLACE TABLE reviews_monthly AS
WITH base AS (
    SELECT
        parent_asin,
        DATE_TRUNC('month', ts) AS month_start,
        rating
    FROM reviews_raw
),

first_review AS (
    SELECT
        parent_asin,
        MIN(month_start) AS first_month
    FROM base
    GROUP BY parent_asin
)

SELECT
    b.parent_asin,

    EXTRACT(year FROM b.month_start) AS year,
    EXTRACT(month FROM b.month_start) AS month,
    STRFTIME(b.month_start, '%Y-%m') AS year_month,

    COUNT(*) AS monthly_review_count,
    AVG(b.rating) AS monthly_rating_avg,

    DATE_DIFF(
        'month',
        f.first_month,
        b.month_start
    ) AS product_age_months

FROM base b
JOIN first_review f
    ON b.parent_asin = f.parent_asin

GROUP BY
    b.parent_asin,
    year,
    month,
    year_month,
    b.month_start,
    f.first_month;
