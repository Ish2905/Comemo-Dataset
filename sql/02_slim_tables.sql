-- FINAL robust metadata ingestion (explicit schema, safe for dirty Amazon data)

CREATE OR REPLACE TABLE metadata_raw AS
SELECT
    parent_asin,
    main_category,
    title,
    features,
    description,
    details,
    categories,
    store,
    price,
    average_rating,
    rating_number,
    images
FROM read_json(
    '/content/drive/MyDrive/Capstone/comemo_data/metadata.jsonl',
    format = 'newline_delimited',
    sample_size = 0,
    columns = {
        parent_asin: 'VARCHAR',
        main_category: 'VARCHAR',
        title: 'VARCHAR',
        features: 'JSON',
        description: 'JSON',
        details: 'JSON',
        categories: 'JSON',
        store: 'VARCHAR',
        price: 'VARCHAR',
        average_rating: 'DOUBLE',
        rating_number: 'BIGINT',
        images: 'JSON'
    },
    ignore_errors = true
)
WHERE parent_asin IS NOT NULL;
