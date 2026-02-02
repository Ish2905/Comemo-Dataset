-- Load raw JSONL files (SAFE ingestion)

CREATE OR REPLACE TABLE reviews_raw AS
SELECT
    parent_asin,
    rating,
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


