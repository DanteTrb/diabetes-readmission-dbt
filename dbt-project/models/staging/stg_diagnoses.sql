-- models/staging/stg_diagnoses.sql

with raw_csv as (

    select * 
    from read_csv_auto('../data/diabetic_data.csv', HEADER=TRUE)

),

renamed as (

    select
        cast(encounter_id as varchar) as encounter_id,
        cast(patient_nbr as varchar) as patient_nbr,
        diag_1,
        diag_2,
        diag_3
    from raw_csv

)

select * from renamed