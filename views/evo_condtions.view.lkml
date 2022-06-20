# THIS TABLE IS NOT USED, IT is stored in BQ as its own table independent of Looker called pokemon_data.evolution_conditions

view: evo_condtions {
  derived_table: {
    sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    sql: SELECT * EXCEPT(poke_order,preceding_int_poke)
      FROM(SELECT sub.*, LEAD(int_evo_poke) OVER (ORDER BY evolution_chain_id, `order`)  AS preceding_int_poke, `order` AS poke_order
      FROM (SELECT
      --Evo chain and Join key
      GENERATE_UUID() AS evolution_condition_id,
      final_evo_species.evolution_chain_id,

      --Final Poke Selects
      final_evo_species.id AS final_evo_species_id,
      final_evo_species.identifier AS final_evo_poke,
      final_evo_species.evolves_from_species_id AS final_evolving_species_id,
      RTRIM(
            CONCAT(
                    final_evo_trigger_prose.name || ': ',
                    CASE WHEN final_evo_details.trigger_item_id IS NOT NULL THEN final_evo_item.name || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.minimum_level IS NOT NULL THEN 'lv ' || final_evo_details.minimum_level || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.gender_id IS NOT NULL THEN 'Gender = ' || final_evo_gender.identifier || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.time_of_day IS NOT NULL THEN 'Time = ' || final_evo_details.time_of_day || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.minimum_happiness IS NOT NULL THEN 'Happiness >= ' || final_evo_details.minimum_happiness  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.location_id IS NOT NULL THEN 'Location = ' || final_evo_location.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.held_item_id IS NOT NULL THEN 'Holding = ' || final_evo_held_items.name  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.known_move_id IS NOT NULL THEN 'Known Move = ' || final_evo_known_move.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.known_move_type_id IS NOT NULL THEN 'Known Move Type = ' || final_evo_known_move_type.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.minimum_beauty IS NOT NULL THEN 'Beauty = ' || final_evo_details.minimum_beauty  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.minimum_affection IS NOT NULL THEN 'Affection = ' || final_evo_details.minimum_affection  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.relative_physical_stats = 1 THEN 'Attack > Defense '|| ' + '
                         WHEN final_evo_details.relative_physical_stats = 0 THEN 'Attack = Defense '|| ' + '
                         WHEN final_evo_details.relative_physical_stats = -1 THEN 'Attack < Defense '|| ' + '
                         ELSE ''
                    END,
                    CASE WHEN final_evo_details.party_species_id IS NOT NULL THEN 'With Poke In Party = ' || final_evo_species_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.party_type_id IS NOT NULL THEN 'With Poke Type In Party = ' || final_evo_type_poke_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.trade_species_id IS NOT NULL THEN 'With Trade Partner = ' || final_evo_partner_trade_species.identifier  || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.turn_upside_down = 1 THEN 'Turn DS Upside Down' || ' + ' ELSE '' END,
                    CASE WHEN final_evo_details.needs_overworld_rain = 1 THEN 'Foggy Or Rainy Weather' || ' + ' ELSE '' END
                  )

            , " +, :") AS final_evo_conditions,
      --Int Poke Selects
      int_evo_species.id AS int_evo_species_id,
      int_evo_species.identifier AS int_evo_poke,
      int_evo_species.evolves_from_species_id AS int_evolving_species_id,
      RTRIM(
            CONCAT(
                    int_evo_trigger_prose.name || ': ',
                    CASE WHEN int_evo_details.trigger_item_id IS NOT NULL THEN int_evo_item.name || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.minimum_level IS NOT NULL THEN 'lv ' || int_evo_details.minimum_level || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.gender_id IS NOT NULL THEN 'Gender = ' || int_evo_gender.identifier || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.time_of_day IS NOT NULL THEN 'Time = ' || int_evo_details.time_of_day || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.minimum_happiness IS NOT NULL THEN 'Happiness >= ' || int_evo_details.minimum_happiness  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.location_id IS NOT NULL THEN 'Location = ' || int_evo_location.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.held_item_id IS NOT NULL THEN 'Holding = ' || int_evo_held_items.name  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.known_move_id IS NOT NULL THEN 'Known Move = ' || int_evo_known_move.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.known_move_type_id IS NOT NULL THEN 'Known Move Type = ' || int_evo_known_move_type.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.minimum_beauty IS NOT NULL THEN 'Beauty = ' || int_evo_details.minimum_beauty  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.minimum_affection IS NOT NULL THEN 'Affection = ' || int_evo_details.minimum_affection  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.relative_physical_stats = 1 THEN 'Attack > Defense '|| ' + '
                         WHEN int_evo_details.relative_physical_stats = 0 THEN 'Attack = Defense '|| ' + '
                         WHEN int_evo_details.relative_physical_stats = -1 THEN 'Attack < Defense '|| ' + '
                         ELSE ''
                    END,
                    CASE WHEN int_evo_details.party_species_id IS NOT NULL THEN 'With Poke In Party = ' || int_evo_species_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.party_type_id IS NOT NULL THEN 'With Poke Type In Party = ' || int_evo_type_poke_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.trade_species_id IS NOT NULL THEN 'With Trade Partner = ' || int_evo_partner_trade_species.identifier  || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.turn_upside_down = 1 THEN 'Turn DS Upside Down' || ' + ' ELSE '' END,
                    CASE WHEN int_evo_details.needs_overworld_rain = 1 THEN 'Foggy Or Rainy Weather' || ' + ' ELSE '' END
                  )

            , " +, :") AS int_evo_conditions,
      --begin Poke selects
      begin_evo_species.id AS begin_evo_species_id,
      begin_evo_species.identifier AS begin_evo_poke,
      begin_evo_species.evolves_from_species_id AS begin_evolving_species_id,
      RTRIM(
            CONCAT(
                    begin_evo_trigger_prose.name || ': ',
                    CASE WHEN begin_evo_details.trigger_item_id IS NOT NULL THEN begin_evo_item.name || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.minimum_level IS NOT NULL THEN 'lv ' || begin_evo_details.minimum_level || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.gender_id IS NOT NULL THEN 'Gender = ' || begin_evo_gender.identifier || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.time_of_day IS NOT NULL THEN 'Time = ' || begin_evo_details.time_of_day || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.minimum_happiness IS NOT NULL THEN 'Happiness >= ' || begin_evo_details.minimum_happiness  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.location_id IS NOT NULL THEN 'Location = ' || begin_evo_location.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.held_item_id IS NOT NULL THEN 'Holding = ' || begin_evo_held_items.name  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.known_move_id IS NOT NULL THEN 'Known Move = ' || begin_evo_known_move.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.known_move_type_id IS NOT NULL THEN 'Known Move Type = ' || begin_evo_known_move_type.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.minimum_beauty IS NOT NULL THEN 'Beauty = ' || begin_evo_details.minimum_beauty  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.minimum_affection IS NOT NULL THEN 'Affection = ' || begin_evo_details.minimum_affection  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.relative_physical_stats = 1 THEN 'Attack > Defense '|| ' + '
                         WHEN begin_evo_details.relative_physical_stats = 0 THEN 'Attack = Defense '|| ' + '
                         WHEN begin_evo_details.relative_physical_stats = -1 THEN 'Attack < Defense '|| ' + '
                         ELSE ''
                    END,
                    CASE WHEN begin_evo_details.party_species_id IS NOT NULL THEN 'With Poke In Party = ' || begin_evo_species_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.party_type_id IS NOT NULL THEN 'With Poke Type In Party = ' || begin_evo_type_poke_in_party.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.trade_species_id IS NOT NULL THEN 'With Trade Partner = ' || begin_evo_partner_trade_species.identifier  || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.turn_upside_down = 1 THEN 'Turn DS Upside Down' || ' + ' ELSE '' END,
                    CASE WHEN begin_evo_details.needs_overworld_rain = 1 THEN 'Foggy Or Rainy Weather' || ' + ' ELSE '' END
                  )

            , " +, :") AS begin_evo_conditions,


      --final EVO joins

      FROM pokemon_species AS final_evo_species
      LEFT JOIN pokemon_evolution AS final_evo_details
        ON final_evo_details.evolved_species_id = final_evo_species.id
      LEFT JOIN evolution_trigger_prose as final_evo_trigger_prose
        ON final_evo_details.evolution_trigger_id = final_evo_trigger_prose.evolution_trigger_id
      LEFT JOIN item_names AS final_evo_item
        ON final_evo_item.item_id = final_evo_details.trigger_item_id
      LEFT JOIN genders AS final_evo_gender
       ON final_evo_gender.id = final_evo_details.gender_id
      LEFT JOIN locations AS final_evo_location
        ON final_evo_location.id = final_evo_details.location_id
      LEFT JOIN item_names AS final_evo_held_items
        ON final_evo_held_items.item_id = final_evo_details.held_item_id
      LEFT JOIN moves AS final_evo_known_move
        ON final_evo_known_move.id = final_evo_details.known_move_id
      LEFT JOIN types as final_evo_known_move_type
        ON final_evo_known_move_type.id = final_evo_details.known_move_type_id
      LEFT JOIN pokemon_species AS final_evo_species_in_party
        ON final_evo_species_in_party.id = final_evo_details.party_species_id
      LEFT JOIN types as final_evo_type_poke_in_party
        ON final_evo_type_poke_in_party.id = final_evo_details.party_type_id
      LEFT JOIN pokemon_species AS final_evo_partner_trade_species
        ON final_evo_partner_trade_species.id = final_evo_details.trade_species_id

      --Intermediate_evo_joins
      LEFT JOIN pokemon_species AS int_evo_species
        ON int_evo_species.id = final_evo_species.evolves_from_species_id
      LEFT JOIN pokemon_evolution AS int_evo_details
        ON int_evo_details.evolved_species_id = int_evo_species.id
      LEFT JOIN evolution_trigger_prose as int_evo_trigger_prose
        ON int_evo_details.evolution_trigger_id = int_evo_trigger_prose.evolution_trigger_id
      LEFT JOIN item_names AS int_evo_item
        ON int_evo_item.item_id = int_evo_details.trigger_item_id
      LEFT JOIN genders AS int_evo_gender
      ON int_evo_gender.id = int_evo_details.gender_id
      LEFT JOIN locations AS int_evo_location
        ON int_evo_location.id = int_evo_details.location_id
      LEFT JOIN item_names AS int_evo_held_items
        ON int_evo_held_items.item_id = int_evo_details.held_item_id
      LEFT JOIN moves AS int_evo_known_move
        ON int_evo_known_move.id = int_evo_details.known_move_id
      LEFT JOIN types as int_evo_known_move_type
        ON int_evo_known_move_type.id = int_evo_details.known_move_type_id
      LEFT JOIN pokemon_species AS int_evo_species_in_party
        ON int_evo_species_in_party.id = int_evo_details.party_species_id
      LEFT JOIN types as int_evo_type_poke_in_party
        ON int_evo_type_poke_in_party.id = int_evo_details.party_type_id
      LEFT JOIN pokemon_species AS int_evo_partner_trade_species
        ON int_evo_partner_trade_species.id = int_evo_details.trade_species_id

      --Begin_evo_joins
      LEFT JOIN pokemon_species AS begin_evo_species
        ON begin_evo_species.id = int_evo_species.evolves_from_species_id
      LEFT JOIN pokemon_evolution AS begin_evo_details
        ON begin_evo_details.evolved_species_id = begin_evo_species.id
      LEFT JOIN evolution_trigger_prose as begin_evo_trigger_prose
        ON begin_evo_details.evolution_trigger_id = begin_evo_trigger_prose.evolution_trigger_id
      LEFT JOIN item_names AS begin_evo_item
        ON begin_evo_item.item_id = begin_evo_details.trigger_item_id
      LEFT JOIN genders AS begin_evo_gender
      ON begin_evo_gender.id = begin_evo_details.gender_id
      LEFT JOIN locations AS begin_evo_location
        ON begin_evo_location.id = begin_evo_details.location_id
      LEFT JOIN item_names AS begin_evo_held_items
        ON begin_evo_held_items.item_id = begin_evo_details.held_item_id
      LEFT JOIN moves AS begin_evo_known_move
        ON begin_evo_known_move.id = begin_evo_details.known_move_id
      LEFT JOIN types as begin_evo_known_move_type
        ON begin_evo_known_move_type.id = begin_evo_details.known_move_type_id
      LEFT JOIN pokemon_species AS begin_evo_species_in_party
        ON begin_evo_species_in_party.id = begin_evo_details.party_species_id
      LEFT JOIN types as begin_evo_type_poke_in_party
        ON begin_evo_type_poke_in_party.id = begin_evo_details.party_type_id
      LEFT JOIN pokemon_species AS begin_evo_partner_trade_species
        ON begin_evo_partner_trade_species.id = begin_evo_details.trade_species_id


      WHERE
      -- final_evo_species.identifier IN ('charizard','vaporeon','jolteon','flareon','espeon','gengar', 'crobat', 'slowking', 'magnezone','gallade','yanmega','sylveon', 'milotic','hitmonlee','mantine','pangoro','escavalier','malamar','goodra','pinsir')
      -- final_evo_species.identifier IN ('pinsir')
      -- final_evo_species.evolution_chain_id IN (1,9,10)
      --Final Poke Wheres
      -- AND
      (final_evo_trigger_prose.local_language_id = 9 OR final_evo_trigger_prose.local_language_id IS NULL)
      AND (final_evo_item.local_language_id = 9 OR final_evo_item.local_language_id IS NULL)
      AND (final_evo_held_items.local_language_id = 9 OR final_evo_held_items.local_language_id IS NULL)
      --int poke wheres
      AND (int_evo_trigger_prose.local_language_id = 9 OR int_evo_trigger_prose.local_language_id IS NULL)
      AND (int_evo_item.local_language_id = 9 OR int_evo_item.local_language_id IS NULL)
      AND (int_evo_held_items.local_language_id = 9 OR int_evo_held_items.local_language_id IS NULL)
      --begin poke wheres
      AND (begin_evo_trigger_prose.local_language_id = 9 OR begin_evo_trigger_prose.local_language_id IS NULL)
      AND (begin_evo_item.local_language_id = 9 OR begin_evo_item.local_language_id IS NULL)
      AND (begin_evo_held_items.local_language_id = 9 OR begin_evo_held_items.local_language_id IS NULL)

      ORDER BY 1
      ) sub
      JOIN pokemon ON pokemon.id = final_evo_species_id
      ORDER BY 1, poke_order
      )
      WHERE preceding_int_poke != final_evo_poke OR preceding_int_poke IS NULL
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: evolution_condition_id {
    type: string
    sql: ${TABLE}.evolution_condition_id ;;
  }

  dimension: evolution_chain_id {
    type: number
    sql: ${TABLE}.evolution_chain_id ;;
  }

  dimension: final_evo_species_id {
    type: number
    sql: ${TABLE}.final_evo_species_id ;;
  }

  dimension: final_evo_poke {
    type: string
    sql: ${TABLE}.final_evo_poke ;;
  }

  dimension: final_evolving_species_id {
    type: number
    sql: ${TABLE}.final_evolving_species_id ;;
  }

  dimension: final_evo_conditions {
    type: string
    sql: ${TABLE}.final_evo_conditions ;;
  }

  dimension: int_evo_species_id {
    type: number
    sql: ${TABLE}.int_evo_species_id ;;
  }

  dimension: int_evo_poke {
    type: string
    sql: ${TABLE}.int_evo_poke ;;
  }

  dimension: int_evolving_species_id {
    type: number
    sql: ${TABLE}.int_evolving_species_id ;;
  }

  dimension: int_evo_conditions {
    type: string
    sql: ${TABLE}.int_evo_conditions ;;
  }

  dimension: begin_evo_species_id {
    type: number
    sql: ${TABLE}.begin_evo_species_id ;;
  }

  dimension: begin_evo_poke {
    type: string
    sql: ${TABLE}.begin_evo_poke ;;
  }

  dimension: begin_evolving_species_id {
    type: number
    sql: ${TABLE}.begin_evolving_species_id ;;
  }

  dimension: begin_evo_conditions {
    type: string
    sql: ${TABLE}.begin_evo_conditions ;;
  }

  set: detail {
    fields: [
      evolution_condition_id,
      evolution_chain_id,
      final_evo_species_id,
      final_evo_poke,
      final_evolving_species_id,
      final_evo_conditions,
      int_evo_species_id,
      int_evo_poke,
      int_evolving_species_id,
      int_evo_conditions,
      begin_evo_species_id,
      begin_evo_poke,
      begin_evolving_species_id,
      begin_evo_conditions
    ]
  }
}
