-- Load raw JSONL files 

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

CREATE OR REPLACE TABLE metadata_raw AS
SELECT
    parent_asin,
    main_category,
    price,
    average_rating
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/metadata.jsonl',
    format='newline_delimited'
)
WHERE parent_asin IS NOT NULL;
