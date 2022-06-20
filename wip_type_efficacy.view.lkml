view: wip_type_efficacy {
  # https://antbillet.looker.lookerce.dev/sql/db7ctsf6wwggnh
  derived_table: {
    sql:

    WITH sql_runner_query AS (SELECT pokemon.identifier as name, types.identifier as type, defensive_efficacy.damage_type_id, attack_type.identifier as attack_type, defensive_efficacy.damage_factor
FROM `anthony-billet.pokemon_data.pokemon`
           AS pokemon
LEFT JOIN `anthony-billet.pokemon_data.pokemon_types`
          AS pokemon_types ON pokemon.id = pokemon_types.pokemon_id
LEFT JOIN `anthony-billet.pokemon_data.types`
          AS types ON types.id = pokemon_types.type_id
LEFT JOIN
`anthony-billet.pokemon_data.type_efficacy`
            AS defensive_efficacy ON defensive_efficacy.target_type_id = pokemon_types.type_id
LEFT JOIN
`anthony-billet.pokemon_data.types`
            AS attack_type ON defensive_efficacy.damage_type_id = attack_type.id

 WHERE pokemon.identifier = 'togekiss'
)
SELECT
    -- sql_runner_query.type AS sql_runner_query_type,
    sql_runner_query.attack_type AS sql_runner_query_attack_type,
    -- sql_runner_query.damage_factor AS sql_runner_query_damage_factor,
--     CASE WHEN sql_runner_query.damage_factor = 0 THEN NULL ELSE sql_runner_query.damage_factor END
-- / 100 AS damage_multiple,
CASE
    WHEN SUM (CASE WHEN sql_runner_query.damage_factor / 100 = 0 THEN 1 END) > 0
    THEN 0
    ELSE 1 END * EXP(SUM(LN(NULLIF(sql_runner_query.damage_factor,0) / 100)))


FROM sql_runner_query
GROUP BY
1
ORDER BY
    1 DESC
LIMIT 500 ;;
  }
}
