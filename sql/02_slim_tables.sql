-- IMPORTANT: force price to VARCHAR, ignore bad rows
CREATE OR REPLACE TABLE metadata_raw AS
SELECT
    parent_asin,
    main_category,
    CAST(price AS VARCHAR) AS price_raw,
    average_rating
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/metadata.jsonl',
    format='newline_delimited'
)
WHERE parent_asin IS NOT NULL;