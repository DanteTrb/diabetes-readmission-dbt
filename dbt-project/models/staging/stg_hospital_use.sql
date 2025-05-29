-- models/staging/stg_hospital_use.sql

with raw_csv as (

    select * 
    from read_csv_auto('../data/diabetic_data.csv', HEADER=TRUE)

),

renamed as (

    select
        cast(encounter_id as varchar) as encounter_id,
        cast(patient_nbr as varchar) as patient_nbr,
        num_lab_procedures,
        number_outpatient,
        number_emergency,
        number_inpatient,
        number_diagnoses
    from raw_csv

)

select * from renamed