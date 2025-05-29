-- models/marts/mart_hospital_usage.sql

with
encounters as (
    select * from {{ ref('stg_encounters') }}
),

hospital as (
    select * from {{ ref('stg_hospital_use') }}
),

joined as (
    select
        e.encounter_id,
        e.patient_nbr,
        e.readmitted,
        h.num_lab_procedures,
        h.number_outpatient,
        h.number_emergency,
        h.number_inpatient,
        h.number_diagnoses
    from encounters e
    left join hospital h
    on e.encounter_id = h.encounter_id
)

select * from joined