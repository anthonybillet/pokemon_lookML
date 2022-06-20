view: pokemon_form_generations {
  sql_table_name: `anthony-billet.pokemon_data.pokemon_form_generations`
    ;;

  dimension: game_index {
    type: number
    sql: ${TABLE}.game_index ;;
  }

  dimension: generation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.generation_id ;;
  }

  dimension: pokemon_form_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.pokemon_form_id ;;
  }

  measure: count {
    type: count
    drill_fields: [generations.id, pokemon_forms.id]
  }
}
