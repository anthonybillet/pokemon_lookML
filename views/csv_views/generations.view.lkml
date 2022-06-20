view: generations {
  sql_table_name: `anthony-billet.pokemon_data.generations`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: main_region_id {
    type: number
    sql: ${TABLE}.main_region_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pokemon_form_generations.count, generation_names.count]
  }
}
