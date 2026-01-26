-- Load raw JSONL files 

CREATE OR REPLACE TABLE reviews_raw AS
SELECT
    parent_asin,
    unixReviewTime,
    overall AS rating,
    reviewText,
    verified,
    vote
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/reviews.jsonl',
    format='newline_delimited'
)
WHERE parent_asin IS NOT NULL;

CREATE OR REPLACE TABLE metadata_raw AS
SELECT
    parent_asin,
    category,
    price,
    average_rating
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/metadata.jsonl',
    format='newline_delimited'
)
WHERE parent_asin IS NOT NULL;
