view: types {
  sql_table_name: `anthony-billet.pokemon_data.types`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: damage_class_id {
    type: number
    sql: ${TABLE}.damage_class_id ;;
  }

  dimension: generation_id {
    type: number
    sql: ${TABLE}.generation_id ;;
  }

  dimension: identifier {
    hidden: yes
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: primary_type {
    type: string
    sql: CASE WHEN ${pokemon_types.slot} = 1 THEN ${identifier} ELSE NULL END ;;
  }

  dimension: secondary_type {
    type: string
    sql: CASE WHEN ${pokemon_types.slot} = 2 THEN ${identifier} ELSE NULL END ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pokemon_types.count]
  }
}
