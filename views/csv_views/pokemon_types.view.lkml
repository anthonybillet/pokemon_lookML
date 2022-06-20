view: pokemon_types {
  sql_table_name: `anthony-billet.pokemon_data.pokemon_types`
    ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${pokemon_id} || '_' || ${type_id} ;;
  }
  dimension: pokemon_id {
    hidden: yes
    type: number
    sql: ${TABLE}.pokemon_id ;;
  }

  dimension: slot {
    type: number
    sql: ${TABLE}.slot ;;
  }

  dimension: type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [types.id]
  }
}
