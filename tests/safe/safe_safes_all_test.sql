-- Check that number of Safes created in specific date range is correct.

with test_data as (
    select count(*) as total
    from {{ ref('safe_safes_all_legacy') }}
    where creation_time > '2023-01-01'
        and creation_time < '2023-02-01'
),

test_result as (
    select case when total = 261602 then true else false end as success
    from test_data
)

select *
from test_result
where success = false
