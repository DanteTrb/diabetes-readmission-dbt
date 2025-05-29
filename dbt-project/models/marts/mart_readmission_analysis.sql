-- models/marts/mart_readmission_analysis.sql

with
encounters as (
    select * from {{ ref('stg_encounters') }}
),

patients as (
    select * from {{ ref('stg_patients') }}
),

treatments as (
    select * from {{ ref('stg_treatments') }}
),

joined as (
    select
        e.encounter_id,
        e.patient_nbr,
        p.age,
        p.gender,
        p.race,
        e.admission_type_id,
        e.discharge_disposition_id,
        e.admission_source_id,
        e.time_in_hospital,
        t.insulin,
        t.diabetesMed,
        t.change,
        t.A1Cresult,
        t.max_glu_serum,
        e.readmitted
    from encounters e
    left join patients p on e.patient_nbr = p.patient_nbr
    left join treatments t on e.encounter_id = t.encounter_id
)

select * from joined