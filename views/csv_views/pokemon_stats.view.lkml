view: pokemon_stats {
  sql_table_name: `anthony-billet.pokemon_data.pokemon_stats`
    ;;

  dimension: base_stat_value {
    type: number
    sql: ${TABLE}.base_stat ;;
  }

  dimension: effort {
    type: number
    sql: ${TABLE}.effort ;;
  }

  dimension: pokemon_id {
    type: number
    hidden: yes
    sql: ${TABLE}.pokemon_id ;;
  }

  dimension: stat_id {
    type: number
    hidden: yes
    sql: ${TABLE}.stat_id ;;
  }

  measure: avg_base_stat {
    label: "Base Stat"
    type: average
    sql: ${base_stat_value} ;;
  }

  measure: count {
    type: count
    drill_fields: [pokemon.id, stats.id]
  }
}
