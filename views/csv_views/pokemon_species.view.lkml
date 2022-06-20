view: pokemon_species {
  sql_table_name: `anthony-billet.pokemon_data.pokemon_species`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_happiness {
    type: number
    sql: ${TABLE}.base_happiness ;;
  }

  dimension: capture_rate {
    type: number
    sql: ${TABLE}.capture_rate ;;
  }

  dimension: color_id {
    type: number
    sql: ${TABLE}.color_id ;;
  }

  dimension: conquest_order {
    type: number
    sql: ${TABLE}.conquest_order ;;
  }

  dimension: evolution_chain_id {
    type: number
    sql: ${TABLE}.evolution_chain_id ;;
  }

  dimension: evolves_from_species_id {
    type: number
    sql: ${TABLE}.evolves_from_species_id ;;
  }

  dimension: forms_switchable {
    type: number
    sql: ${TABLE}.forms_switchable ;;
  }

  dimension: gender_rate {
    type: number
    sql: ${TABLE}.gender_rate ;;
  }

  dimension: generation_id {
    type: number
    sql: ${TABLE}.generation_id ;;
  }

  dimension: growth_rate_id {
    type: number
    sql: ${TABLE}.growth_rate_id ;;
  }

  dimension: habitat_id {
    type: number
    sql: ${TABLE}.habitat_id ;;
  }

  dimension: has_gender_differences {
    type: number
    sql: ${TABLE}.has_gender_differences ;;
  }

  dimension: hatch_counter {
    type: number
    sql: ${TABLE}.hatch_counter ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: is_baby {
    type: number
    sql: ${TABLE}.is_baby ;;
  }

  dimension: is_legendary {
    type: number
    sql: ${TABLE}.is_legendary ;;
  }

  dimension: is_mythical {
    type: number
    sql: ${TABLE}.is_mythical ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: shape_id {
    type: number
    sql: ${TABLE}.shape_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
