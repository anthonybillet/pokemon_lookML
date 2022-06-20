view: pokemon_forms {
  sql_table_name: `anthony-billet.pokemon_data.pokemon_forms`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: form_identifier {
    type: string
    sql: ${TABLE}.form_identifier ;;
  }

  dimension: form_order {
    type: number
    sql: ${TABLE}.form_order ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: introduced_in_version_group_id {
    type: number
    sql: ${TABLE}.introduced_in_version_group_id ;;
  }

  dimension: is_battle_only {
    type: number
    sql: ${TABLE}.is_battle_only ;;
  }

  dimension: is_default {
    type: number
    sql: ${TABLE}.is_default ;;
  }

  dimension: is_mega {
    type: number
    sql: ${TABLE}.is_mega ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: pokemon_id {
    type: number
    sql: ${TABLE}.pokemon_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pokemon_form_generations.count]
  }
}
