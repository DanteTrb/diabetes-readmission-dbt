-- models/staging/stg_patients.sql

with raw_csv as (

    select * 
    from read_csv_auto('../data/diabetic_data.csv', HEADER=TRUE)

),

renamed as (

    select
        cast(encounter_id as varchar) as encounter_id,
        cast(patient_nbr as varchar) as patient_nbr,
        age,
        race,
        gender
    from raw_csv

)

select * from renamed