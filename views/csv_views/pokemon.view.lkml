view: pokemon {
  sql_table_name: `anthony-billet.pokemon_data.pokemon`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_experience {
    type: number
    sql: ${TABLE}.base_experience ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: identifier {
    hidden: yes
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: pokemon_name {
    type: string
    sql: CONCAT(UPPER(SUBSTR(${identifier},1,1)), LOWER(SUBSTR(${identifier},2))) ;;
  }

  dimension: is_original_form {
    type: yesno
    sql: ${TABLE}.is_default = 1 ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: species_id {
    type: number
    sql: ${TABLE}.species_id ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pokemon_stats.count]
  }
}
