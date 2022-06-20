view: stats {
  sql_table_name: `anthony-billet.pokemon_data.stats`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: damage_class_id {
    type: number
    sql: ${TABLE}.damage_class_id ;;
  }

  dimension: game_index {
    type: number
    sql: ${TABLE}.game_index ;;
  }

  dimension: base_stat_name {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: is_battle_only {
    type: number
    sql: ${TABLE}.is_battle_only ;;
  }

  measure: count {
    type: count
    drill_fields: [id, stat_names.count, pokemon_stats.count]
  }
}
