-- models/staging/stg_encounters.sql

with raw_csv as (

    select * 
    from read_csv_auto('../data/diabetic_data.csv', HEADER=TRUE)

),

renamed as (

    select
        cast(encounter_id as varchar) as encounter_id,
        cast(patient_nbr as varchar) as patient_nbr,
        admission_type_id,
        discharge_disposition_id,
        admission_source_id,
        time_in_hospital,
        readmitted
    from raw_csv

)

select * from renamed