select
    /* Primary Key */
    {{ dbt_utils.surrogate_key(['divisions.id']) }} as stg_nhl__divisions_id

    /* Identifiers */
    , divisions.id as division_id
    , divisions.conference.id as conference_id

    /* Properties */
    , divisions.name as division_name
    , divisions.nameshort as division_short_name
    , divisions.link as division_url
    , divisions.abbreviation as division_abbreviation
    , divisions.active as is_active

from {{ source('meltano', 'divisions') }} as divisions
