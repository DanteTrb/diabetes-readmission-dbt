-- models/marts/mart_diagnosis_risk_factors.sql

with
encounters as (
    select * from {{ ref('stg_encounters') }}
),

diagnoses as (
    select * from {{ ref('stg_diagnoses') }}
),

joined as (
    select
        e.encounter_id,
        e.patient_nbr,
        e.readmitted,
        d.diag_1,
        d.diag_2,
        d.diag_3
    from encounters e
    left join diagnoses d on e.encounter_id = d.encounter_id
)

select * from joined