-- Load raw JSONL files (SAFE ingestion)

CREATE OR REPLACE TABLE reviews_raw AS
SELECT
    parent_asin,
    title,
    text,
    timestamp,
    verified_purchase,
    helpful_vote
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/reviews.jsonl',
    format='newline_delimited'
)
WHERE parent_asin IS NOT NULL;

-- IMPORTANT: force price to VARCHAR, ignore bad rows
CREATE OR REPLACE TABLE metadata_raw AS
SELECT
    parent_asin,
    main_category,
    CAST(price AS VARCHAR) AS price_raw,
    average_rating
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/metadata.jsonl',
    format='newline_delimited',
    ignore_errors = true
)
WHERE parent_asin IS NOT NULL;
