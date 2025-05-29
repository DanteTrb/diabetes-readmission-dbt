-- models/staging/stg_treatments.sql

with raw_csv as (

    select * 
    from read_csv_auto('../data/diabetic_data.csv', HEADER=TRUE)

),

renamed as (

    select
        cast(encounter_id as varchar) as encounter_id,
        cast(patient_nbr as varchar) as patient_nbr,
        insulin,
        diabetesMed,
        change,
        A1Cresult,
        max_glu_serum
    from raw_csv

)

select * from renamed