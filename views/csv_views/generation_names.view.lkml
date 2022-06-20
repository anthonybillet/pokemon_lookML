view: generation_names {
  sql_table_name: `anthony-billet.pokemon_data.generation_names`
    ;;

  dimension: generation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.generation_id ;;
  }

  dimension: local_language_id {
    type: number
    sql: ${TABLE}.local_language_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name, generations.id]
  }
}
