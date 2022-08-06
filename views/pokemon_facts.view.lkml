view: pokemon_facts {
  derived_table: {
    sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    sql: WITH defensive_type_multipliers AS (WITH defensive_type_efficacy AS (SELECT pokemon.identifier as name,pokemon.id AS pokemon_id, types.identifier as type, defensive_efficacy.damage_type_id, incoming_attack_type.identifier as attack_type,incoming_attack_type.id AS attack_type_id, defensive_efficacy.damage_factor


    FROM `anthony-billet.pokemon_data.pokemon`
               AS pokemon
    LEFT JOIN `anthony-billet.pokemon_data.pokemon_types`
              AS pokemon_types ON pokemon.id = pokemon_types.pokemon_id
    LEFT JOIN `anthony-billet.pokemon_data.types`
              AS types ON types.id = pokemon_types.type_id
    LEFT JOIN
    `anthony-billet.pokemon_data.type_efficacy`
                AS defensive_efficacy ON defensive_efficacy.target_type_id = pokemon_types.type_id
    LEFT JOIN
    `anthony-billet.pokemon_data.types`
                AS incoming_attack_type ON defensive_efficacy.damage_type_id = incoming_attack_type.id

     --WHERE pokemon.identifier = 'gengar'
    )
    SELECT
        pokemon_id,
        defensive_type_efficacy.attack_type AS defensive_type_efficacy_attack_type,
        attack_type_id,
    CASE
        WHEN SUM (CASE WHEN defensive_type_efficacy.damage_factor / 100 = 0 THEN 1 END) > 0
        THEN 0
        ELSE 1 END * EXP(SUM(LN(NULLIF(defensive_type_efficacy.damage_factor,0) / 100))) AS damage_multiple


    FROM defensive_type_efficacy
    GROUP BY
    1,2,3 )


SELECT
        pokemon.species_id  AS pokemon_species_id,
        pokemon_species.generation_id AS generation_introduced,
        CONCAT(UPPER(SUBSTR(pokemon.identifier,1,1)), LOWER(SUBSTR(pokemon.identifier,2)))  AS pokemon_name,
        pokemon.id  AS id,
        pokemon.`order`  AS pokemon_order,
        CASE WHEN pokemon.is_default = 1  THEN 'Yes' ELSE 'No' END AS is_original_form,
        pokemon.base_experience  AS base_experience,
        pokemon.height  AS height,
        pokemon.weight  AS weight,
        pokemon_moves.level,
        pokemon_moves.version_group_id,
        CASE WHEN pokemon_moves.version_group_id = 1 THEN 'Red/Blue'
             WHEN pokemon_moves.version_group_id = 2 THEN 'Yellow'
             WHEN pokemon_moves.version_group_id = 3 THEN 'Gold/Silver'
             WHEN pokemon_moves.version_group_id = 4 THEN 'Crystal'
             WHEN pokemon_moves.version_group_id = 5 THEN 'Ruby/Sapphire'
             WHEN pokemon_moves.version_group_id = 6 THEN 'Emerald'
             WHEN pokemon_moves.version_group_id = 7 THEN 'FireRed/LeafGreen'
             WHEN pokemon_moves.version_group_id = 8 THEN 'Diamond/Pearl'
             WHEN pokemon_moves.version_group_id = 9 THEN 'Platinum'
             WHEN pokemon_moves.version_group_id = 10 THEN 'HeartGold/SoulSilver'
             WHEN pokemon_moves.version_group_id = 11 THEN 'Black/White'
             WHEN pokemon_moves.version_group_id = 12 THEN 'Colusseum'
             WHEN pokemon_moves.version_group_id = 13 THEN 'XD'
             WHEN pokemon_moves.version_group_id = 14 THEN 'Black-2/White-2'
             WHEN pokemon_moves.version_group_id = 15 THEN 'X/Y'
             WHEN pokemon_moves.version_group_id = 16 THEN 'OmegaRuby/AlphaSapphire'
             WHEN pokemon_moves.version_group_id = 17 THEN 'Sun/Moon'
             WHEN pokemon_moves.version_group_id = 18 THEN 'UltraSun/UltraMoon'
             ELSE 'Unknown'
         END AS move_game_version,
        moves.id AS move_id,
        moves.generation_id AS generation_move_introduced,
        moves.power AS move_power,
        moves.pp AS move_pp,
        moves.accuracy AS accuracy,
        move_names.name AS move_name,
        move_damage_classes.identifier AS damage_class,
        move_types.identifier AS move_type,
        move_text.flavor_text AS move_description,
        pokemon_move_methods.id AS move_method_id,
        pokemon_move_methods.identifier AS move_learn_method,
        items.id AS item_id,
        items.identifier AS item_name,
        evo_conditions.*,
        abilities.id AS ability_id,
        abilities.identifier AS ability_name_raw,
        CASE WHEN pokemon_abilities.is_hidden = 1 THEN abilities.identifier || ' (Hidden)' ELSE abilities.identifier END AS ability_name,
        abilities.generation_id AS ability_gen_introduced,
        ability_prose.effect AS ability_effect_long,
        ability_prose.short_effect AS ability_effect,
        defensive_type_multipliers.defensive_type_efficacy_attack_type AS defensive_type_efficacy_attack_type,
        defensive_type_multipliers.attack_type_id AS defensive_type_efficacy_attack_type_id,
        defensive_type_multipliers.damage_multiple AS defensive_type_efficacy_damage_multiple,
        MAX(CASE WHEN pokemon_stats.stat_id = 1 THEN pokemon_stats.base_stat ELSE NULL END) AS HP,
        MAX(CASE WHEN pokemon_stats.stat_id = 2 THEN pokemon_stats.base_stat ELSE NULL END) AS Attack,
        MAX(CASE WHEN pokemon_stats.stat_id = 3 THEN pokemon_stats.base_stat ELSE NULL END) AS Defense,
        MAX(CASE WHEN pokemon_stats.stat_id = 4 THEN pokemon_stats.base_stat ELSE NULL END) AS Special_Attack,
        MAX(CASE WHEN pokemon_stats.stat_id = 5 THEN pokemon_stats.base_stat ELSE NULL END) AS Special_Defense,
        MAX(CASE WHEN pokemon_stats.stat_id = 6 THEN pokemon_stats.base_stat ELSE NULL END) AS Speed,
        MAX(CASE WHEN pokemon_types.slot = 1 THEN types.identifier ELSE NULL END)  AS types_primary_type,
        MAX(CASE WHEN pokemon_types.slot = 2 THEN types.identifier ELSE NULL END)  AS types_secondary_type



      FROM `anthony-billet.pokemon_data.pokemon`
           AS pokemon
      LEFT JOIN `anthony-billet.pokemon_data.pokemon_stats`
           AS pokemon_stats ON pokemon.id = pokemon_stats.pokemon_id
      LEFT JOIN `anthony-billet.pokemon_data.pokemon_types`
          AS pokemon_types ON pokemon.id = pokemon_types.pokemon_id
      LEFT JOIN `anthony-billet.pokemon_data.types`
          AS types ON types.id = pokemon_types.type_id
      LEFT JOIN pokemon_data.pokemon_moves
        ON pokemon.id = pokemon_moves.pokemon_id
      LEFT JOIN pokemon_data.moves
        ON moves.id = pokemon_moves.move_id
      LEFT JOIN pokemon_data.move_names
        ON moves.id = move_names.move_id
      LEFT JOIN pokemon_data.move_damage_classes
        ON move_damage_classes.id = moves.damage_class_id
      LEFT JOIN pokemon_data.types as move_types
        ON move_types.id = moves.type_id
      LEFT JOIN pokemon_data.move_flavor_text AS move_text
        ON move_text.move_id = moves.id AND pokemon_moves.version_group_id = move_text.version_group_id
      LEFT JOIN pokemon_data.pokemon_move_methods
        ON pokemon_moves.pokemon_move_method_id = pokemon_move_methods.id
      LEFT JOIN pokemon_data.machines
        ON moves.id = machines.move_id  AND pokemon_moves.version_group_id = machines.version_group_id
      LEFT JOIN pokemon_data.items
        ON items.id = machines.item_id
      LEFT JOIN pokemon_data.pokemon_species
        ON pokemon.species_id = pokemon_species.id
      LEFT JOIN pokemon_data.evolution_conditions AS evo_conditions
        ON evo_conditions.evolution_chain_id = pokemon_species.evolution_chain_id
      LEFT JOIN `anthony-billet.pokemon_data.pokemon_abilities` AS pokemon_abilities
        ON pokemon.id = pokemon_abilities.pokemon_id
      LEFT JOIN abilities
        ON abilities.id = pokemon_abilities.ability_id
      LEFT JOIN ability_prose
        ON ability_prose.ability_id = abilities.id
      LEFT JOIN defensive_type_multipliers
        ON defensive_type_multipliers.pokemon_id = pokemon.id


    WHERE move_names.local_language_id = 9
    AND (move_text.language_id = 9 OR move_text.language_id IS NULL)
    AND (ability_prose.local_language_id= 9 OR ability_prose.local_language_id IS NULL)
    --AND LOWER(pokemon.identifier) IN('gengar')
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48;;
  }

  dimension: pk {
    view_label: "Z: Admin"
    label: "Primary Key"
    primary_key: yes
    type: string
    sql: COALESCE(${id},0) || '_' || COALESCE(${move_id},0) || '_' || COALESCE(${level},0)
          || '_' || COALESCE(${item_id},0) || '_' || COALESCE(${move_game_version},'null')
          || '_' || COALESCE(${move_method_id},0) || COALESCE(${evolution_condition_id},'null')
          || '_' || COALESCE(${ability_id},0) ;;
  }

  dimension: pokemon_species_id {
    view_label: "Pokemon"
    label: "Species ID"
    type: number
    sql: ${TABLE}.pokemon_species_id ;;
  }

  dimension: pokemon_generation_introduced_raw {
    hidden: yes
    view_label: "Pokemon"
    label: "Generation Introduced"
    type: string
    sql: CAST(${TABLE}.generation_introduced AS string) ;;
  }

  dimension: pokemon_generation_introduced {
    view_label: "Pokemon"
    label: "Generation Introduced"
    type: string
    sql: CAST(${pokemon_generation_introduced_raw} AS string) ;;
    order_by_field: pokemon_generation_introduced_raw
  }

  dimension: pokemon_name {
    view_label: "Pokemon"
    label: "Name"
    type: string
    sql: ${TABLE}.pokemon_name ;;
    link: {
      label: "Link to {{value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.pokemon_name._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{value}} Index"
      url: "http://pokemon-index.com/p/{{pokemon_facts.pokemon_name_lower._value}}"
    }
  }

  dimension: pokemon_image {
    view_label: "Pokemon"
    label: "Image"
    type: string
    sql: ${pokemon_name} ;;
    html: <img src="https://img.pokemondb.net/artwork/large/{{pokemon_facts.pokemon_name_lower._value}}.jpg" height="90%" width="90%">;;
    link: {
      label: "Link to {{value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.pokemon_name._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{value}} Index"
      url: "http://pokemon-index.com/p/{{pokemon_facts.pokemon_name_lower._value}}"
    }
  }

  dimension: pokemon_sprite {
    view_label: "Pokemon"
    label: "Sprite"
    type: string
    sql: ${pokemon_name} ;;
    html: <img src="https://img.pokemondb.net/sprites/sword-shield/icon/{{pokemon_facts.pokemon_name_lower._value}}.png">;;
    link: {
      label: "Link to {{value}} Deep Dive"
    }
    link: {
      label: "Link to {{value}} Index"
      url: "http://pokemon-index.com/p/{{pokemon_facts.pokemon_name_lower._value}}"
    }
  }

  dimension: pokemon_name_w_sprite {
    view_label: "Pokemon"
    alias: [pokemon_name_w_image]
    label: "Pokemon Name and Sprite"
    type: string
    sql: ${pokemon_name} ;;
    html: <img src="https://img.pokemondb.net/sprites/sword-shield/icon/{{pokemon_facts.pokemon_name_lower._value}}.png" {{linked_value}} ;;
    link: {
      label: "Link to {{value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.pokemon_name._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{value}} Index"
      url: "http://pokemon-index.com/p/{{pokemon_facts.pokemon_name_lower._value}}"
    }
  }

  dimension: pokemon_name_lower {
    view_label: "Pokemon"
    label: "Pokemon Name (Lower)"
    type: string
    hidden: yes
    sql: LOWER(${pokemon_name}) ;;
  }


  dimension: id {
    view_label: "Pokemon"
    label: "ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: pokemon_order {
    view_label: "Pokemon"
    label: "Order"
    type: number
    sql: ${TABLE}.pokemon_order ;;
  }

  dimension: is_original_form {
    view_label: "Pokemon"
    label: "Is Original Form"
    type: string
    sql: ${TABLE}.is_original_form ;;
  }

  dimension: base_experience {
    view_label: "Pokemon"
    label: "Base Experience"
    type: number
    sql: ${TABLE}.base_experience ;;
  }

  dimension: height {
    view_label: "Pokemon"
    label: "Height"
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: weight {
    view_label: "Pokemon"
    label: "Weight (kg)"
    type: number
    sql: 1.0*${TABLE}.weight/10 ;;
  }

  dimension: level {
    view_label: "Pokemon"
    label: "Level"
    type: number
    sql: ${TABLE}.level ;;
  }

  dimension: version_group_id {
    view_label: "Moves"
    label: "Version Group ID"
    type: number
    sql: ${TABLE}.version_group_id ;;
  }

  dimension: move_game_version {
    view_label: "Moves"
    label: "Game Version (For Learnset)"
    type: string
    sql: ${TABLE}.move_game_version ;;
    order_by_field: version_group_id
  }


  dimension: game_ver_seribii_link_helper {
    # hidden: yes
    type: string
    sql: CASE
              WHEN ${version_group_id} IN(1,2) THEN ''
              WHEN ${version_group_id} IN(3,4) THEN '-gs'
              WHEN ${version_group_id} IN(5,6,7) THEN '-rs'
              WHEN ${version_group_id} IN(8,9,10) THEN '-dp'
              WHEN ${version_group_id} IN(11,14) THEN '-bw'
              WHEN ${version_group_id} IN(15,16) THEN '-xy'
              WHEN ${version_group_id} IN(15,16) THEN '-sm'
              WHEN ${version_group_id} IN(17,18) THEN '-swsh'
              ELSE ''
          END;;
  }

  dimension: location {
    type: string
    sql: 'Location Link' ;;
    html:
    {% if pokemon_facts.id._value < 10 %}
          <a href = 'https://www.serebii.net/pokedex{{pokemon_facts.game_ver_seribii_link_helper._value}}/00{{pokemon_facts.id._value}}.shtml' target="_blank">
    {% elsif pokemon_facts.id._value < 100 %}
          <a href = 'https://www.serebii.net/pokedex{{pokemon_facts.game_ver_seribii_link_helper._value}}/0{{pokemon_facts.id._value}}.shtml' target="_blank">
    {% else %}
          <a href = 'https://www.serebii.net/pokedex{{pokemon_facts.game_ver_seribii_link_helper._value}}/{{pokemon_facts.id._value}}.shtml' target="_blank">
    {% endif %}
    Location Link (Seribii);;
  }

  dimension: move_id {
    view_label: "Moves"
    label: "ID"
    type: number
    sql: ${TABLE}.move_id ;;
  }

  dimension: generation_move_introduced {
    view_label: "Moves"
    label: "Generation Move Was Introduced"
    type: number
    sql: ${TABLE}.generation_move_introduced ;;
  }

  dimension: move_power {
    view_label: "Moves"
    label: "Power"
    type: number
    sql: ${TABLE}.move_power ;;
    html:{% if pokemon_facts.primary_type._value == pokemon_facts.move_type._value or pokemon_facts.secondary_type._value == pokemon_facts.move_type._value %}
          {{linked_value}} <b> ({{pokemon_facts.move_power_w_stab._value}})</b>
          {% else %}
          {{linked_value}}
          {% endif %}  ;;
  }

  dimension: move_power_w_stab {
    view_label: "Moves"
    label: "Power w/STAB"
    hidden: yes
    type: number
    sql:{% if pokemon_facts.primary_type._value == pokemon_facts.move_type._value or pokemon_facts.secondary_type._value == pokemon_facts.move_type._value %}
          ${move_power} *1.5
          {% else %}
          ${move_power}
          {% endif %}  ;;
  }

  dimension: move_pp {
    view_label: "Moves"
    label: "PP"
    type: number
    sql: ${TABLE}.move_pp ;;
  }

  dimension: move_accuracy {
    view_label: "Moves"
    label: "Accuracy"
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: move_name {
    view_label: "Moves"
    label: "Name"
    type: string
    sql: ${TABLE}.move_name ;;
    required_fields: [primary_type,secondary_type]
    link: {
      label: "Search for {{ value }} details"
      url: "https://www.google.com/search?q={{ value | url_encode }}+pokemon"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.google.com"
    }
    html: {% if pokemon_facts.primary_type._value == pokemon_facts.move_type._value or pokemon_facts.secondary_type._value == pokemon_facts.move_type._value %}
          <b> {{linked_value}} </b>
          {% else %}
          {{linked_value}}
          {% endif %}
    ;;
  }

  dimension: move_damage_class_raw {
    hidden: no
    type: string
    sql:${TABLE}.damage_class ;;
  }

  dimension: move_damage_class {
    view_label: "Moves"
    label: "Damage Class"
    type: string
    sql: CASE
              WHEN ${move_damage_class_raw} = 'status' THEN 'status'
              WHEN ${version_group_id} <= 7 AND ${move_type} IN ('normal','fighting','flying', 'poison', 'ground', 'rock', 'bug', 'ghost','steel')
                  THEN 'physical'
              WHEN ${version_group_id} <= 7 AND ${move_type} IN ('fire','water','grass','electric', 'psychic', 'ice', 'dragon', 'dark')
                  THEN 'special'
              ELSE ${move_damage_class_raw}
          END
      ;;
    html: {% if pokemon_facts.move_damage_class._value == "physical" %}
          <img src="http://faqsmedia.ign.com/faqs/image/article/109/1094653/physical_attack_icon.jpg"height="50%" width="50%">
          {% elsif pokemon_facts.move_damage_class._value == "special" %}
          <img src="https://icon-library.com/images/special-attack-icon/special-attack-icon-2.jpg" height="50%" width="50%">
          {% elsif pokemon_facts.move_damage_class._value == "status" %}
          <img src="https://icon-library.com/images/special-attack-icon/special-attack-icon-1.jpg" height="50%" width="50%">
          {% else %}
          {{linked_value}}
          {% endif %}
          ;;
  }

  dimension: move_type {
    view_label: "Moves"
    label: "Type"
    type: string
    sql: ${TABLE}.move_type ;;
    html: <img src="https://pokeguide.neocities.org/Pic/{{pokemon_facts.move_type_image_helper._value}}icon.png" height="100%" width="100%"> ;;
  }

  dimension: move_type_image_helper {
    view_label: "Pokemon"
    hidden: yes
    type: string
    sql: CASE WHEN ${move_type} = 'psychic' THEN 'physic' ELSE ${move_type} END ;;
  }

  dimension: move_description {
    view_label: "Moves"
    label: "Description"
    type: string
    sql: ${TABLE}.move_description ;;
  }

  dimension: move_method_id {
    view_label: "Moves"
    type: number
    sql: ${TABLE}.move_method_id ;;
  }

  dimension: move_learn_method {
    view_label: "Moves"
    label: "Learn Method"
    type: string
    sql: ${TABLE}.move_learn_method ;;
    order_by_field: move_learn_method_order
  }

  dimension: move_learn_method_order {
    view_label: "Moves"
    label: "Learn Method"
    type: string
    sql: CASE
              WHEN ${TABLE}.move_learn_method = 'level-up' THEN 1
              WHEN ${TABLE}.move_learn_method = 'machine' THEN 2
              WHEN ${TABLE}.move_learn_method = 'tutor' THEN 3
              WHEN ${TABLE}.move_learn_method = 'egg' THEN 4
              ELSE 5
         END;;
  }

  dimension: item_id {
    view_label: "Items"
    label: "ID"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    view_label: "Items"
    label: "Name"
    type: string
    sql: UPPER(${TABLE}.item_name) ;;
    order_by_field: item_name_order
  }

  dimension: item_name_order {
    hidden: yes
    type: string
    sql: CASE WHEN ${item_name} LIKE "tm%" THEN "z_" || ${item_name} ELSE ${item_name} END ;;
  }

  dimension: primary_type {
    view_label: "Pokemon"
    hidden: yes
    type: string
    sql: ${TABLE}.types_primary_type ;;
  }

  dimension: secondary_type {
    view_label: "Pokemon"
    hidden: yes
    type: string
    sql: ${TABLE}.types_secondary_type ;;
  }

  dimension: primary_type_image_helper {
    view_label: "Pokemon"
    hidden: yes
    type: string
    sql: CASE WHEN ${primary_type} = 'psychic' THEN 'physic' ELSE ${primary_type} END ;;
  }

  dimension: secondary_type_image_helper {
    view_label: "Pokemon"
    hidden: yes
    type: string
    sql: CASE WHEN ${secondary_type} = 'psychic' THEN 'physic' ELSE ${secondary_type} END ;;
  }

  dimension: type {
    view_label: "Pokemon"
    label: "Type(s)"
    sql: CASE WHEN ${secondary_type} IS NOT NULL THEN ${primary_type} || '/' || ${secondary_type}
              ELSE ${primary_type}
         END;;
    html:
    {% if pokemon_facts.secondary_type._value != null %}
    <img src="https://pokeguide.neocities.org/Pic/{{pokemon_facts.primary_type_image_helper._value}}icon.png" height="45%" width="45%"> <img src="https://pokeguide.neocities.org/Pic/{{pokemon_facts.secondary_type_image_helper._value}}icon.png" height="45%" width="45%">
    {% else %}
    <img src="https://pokeguide.neocities.org/Pic/{{pokemon_facts.primary_type_image_helper._value}}icon.png" height="45%" width="45%">
    {% endif %} ;;
  }

  dimension: hp_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql: ${TABLE}.HP ;;
  }

  dimension: hp_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${hp_raw} ;;
  }

  dimension: attack_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql: ${TABLE}.Attack ;;
  }

  dimension: attack_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${attack_raw} ;;
  }

  dimension: defense_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql: ${TABLE}.Defense ;;
  }

  dimension: defense_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${defense_raw} ;;
  }

  dimension: special_attack_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql: ${TABLE}.Special_Attack ;;
  }

  dimension: special_attack_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${special_attack_raw} ;;
  }

  dimension: special_defense_raw {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    hidden: yes
    type: number
    sql: ${TABLE}.Special_Defense ;;
  }

  dimension: special_defense_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${special_defense_raw};;
  }

  dimension: speed_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql: ${TABLE}.Speed ;;
  }

  dimension: speed_tier {
    view_label: "Stats"
    group_label: "Base Stats Tiers"
    type: tier
    tiers: [50,70,80,90,100,110,120]
    style: integer
    sql: ${speed_raw} ;;
  }

  dimension: attack_plus_speed_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${attack_raw} + ${speed_raw} ;;
  }

  dimension: phsyical_sweeper_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [50,100,150,180,190,200,210]
    style: integer
    sql: ${attack_plus_speed_raw} ;;
  }

  dimension: special_attack_plus_speed_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${special_attack_raw} + ${speed_raw} ;;
  }

  dimension: special_sweeper_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [50,100,150,180,190,200,210]
    style: integer
    sql: ${special_attack_plus_speed_raw} ;;
  }

  dimension: Hp_plus_defense_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${hp_raw} + ${defense_raw} ;;
  }

  dimension: physical_tank_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [50,100,150,180,190,200,210,220]
    style: integer
    sql: ${Hp_plus_defense_raw} ;;
  }

  dimension: hp_plus_special_defense_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${hp_raw} + ${special_defense_raw} ;;
  }

  dimension: special_tank_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [50,100,150,180,190,200,210,220]
    style: integer
    sql: ${hp_plus_special_defense_raw} ;;
  }

  dimension: hp_plus_all_defense_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${hp_raw} + ${defense_raw} + ${special_defense_raw} ;;
  }

  dimension: overall_tank_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [100,200,220,230,240,250,260]
    style: integer
    sql: ${hp_plus_all_defense_raw} ;;
  }

  dimension: total_stats_raw {
    view_label: "Stats"
    hidden: yes
    type: number
    sql:  ${hp_raw} + ${attack_raw} + ${defense_raw} + ${special_attack_raw}
          +  ${special_defense_raw} + ${speed_raw} ;;
  }

  dimension: overall_total_stats_tier {
    view_label: "Stats"
    group_label: "Combination Stats Tiers"
    type: tier
    tiers: [300,400,450,500,550,600,650]
    style: integer
    sql: ${total_stats_raw} ;;
  }

  measure: number_of_pokemon {
    view_label: "Pokemon"
    type: count_distinct
    sql: ${pokemon_species_id} ;;
    drill_fields: [pokemon_species_id, pokemon_name, hp, attack, defense, special_attack, special_defense, speed]
  }

  measure: hp {
    view_label: "Stats"
    label: "HP"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${hp_raw} ;;
  }

  measure: attack {
    view_label: "Stats"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${attack_raw} ;;
  }

  measure: defense {
    view_label: "Stats"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${defense_raw} ;;
  }

  measure: special_attack {
    view_label: "Stats"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${special_attack_raw} ;;
  }

  measure: special_defense {
    view_label: "Stats"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${special_defense_raw} ;;
  }

  measure: speed {
    view_label: "Stats"
    group_label: "Base Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${speed_raw} ;;
  }

  measure: physical_sweep_stats {
    view_label: "Stats"
    group_label: "Combination Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${attack_plus_speed_raw} ;;
  }

  measure: special_sweep_stats {
    view_label: "Stats"
    group_label: "Combination Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${special_attack_plus_speed_raw} ;;
  }

  measure: physical_tank_stats {
    view_label: "Stats"
    group_label: "Combination Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${Hp_plus_defense_raw} ;;
  }

  measure: special_tank_stats {
    view_label: "Stats"
    group_label: "Combination Stats"
    sql: ${hp_plus_special_defense_raw} ;;
    type: sum_distinct
    sql_distinct_key: ${id} ;;
  }

  measure: overall_tank_stats {
    view_label: "Stats"
    group_label: "Combination Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${hp_plus_all_defense_raw} ;;
  }

  measure: total {
    view_label: "Stats"
    group_label: "Combination Stats"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${total_stats_raw} ;;
  }

  measure: record_count {
    view_label: "Z: Admin"
    type: count
  }

######## Evolution Chains ######################################################################

  dimension: evolution_condition_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.evolution_condition_id ;;
  }

  dimension: evolution_chain_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.evolution_chain_id ;;
  }

  dimension: final_evo_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.final_evo_species_id ;;
  }

  dimension: final_evo_poke_filter_helper {
    hidden: yes
    view_label: "Evolution Info"
    type: string
    sql: CONCAT(UPPER(SUBSTR(${final_evo_poke},1,1)), LOWER(SUBSTR(${final_evo_poke},2)))
      ;;
  }

  dimension: final_evo_poke {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.final_evo_poke ;;
    html:<img src="https://img.pokemondb.net/sprites/sword-shield/icon/{{value}}.png"> {{linked_value}};;

    link: {
      label: "Link to {{pokemon_facts.final_evo_poke_filter_helper._value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.final_evo_poke_filter_helper._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{pokemon_facts.final_evo_poke_filter_helper._value}} Index"
      url: "http://pokemon-index.com/p/{{value}}"
    }
  }

  dimension: final_evolving_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.final_evolving_species_id ;;
  }

  dimension: final_evo_conditions {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.final_evo_conditions ;;
    html: <center>&#8594; <br>{{linked_value}}</center>;;
  }

  dimension: int_evo_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.int_evo_species_id ;;
  }

  dimension: int_evo_poke_filter_helper {
    hidden: yes
    view_label: "Evolution Info"
    type: string
    sql: CONCAT(UPPER(SUBSTR(${int_evo_poke},1,1)), LOWER(SUBSTR(${int_evo_poke},2)))
      ;;
  }

  dimension: int_evo_poke {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.int_evo_poke ;;
    html:<img src="https://img.pokemondb.net/sprites/sword-shield/icon/{{value}}.png"> {{linked_value}};;


    link: {
      label: "Link to {{pokemon_facts.int_evo_poke_filter_helper._value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.int_evo_poke_filter_helper._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{pokemon_facts.int_evo_poke_filter_helper._value}} Index"
      url: "http://pokemon-index.com/p/{{value}}"
    }

  }

  dimension: int_evolving_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.int_evolving_species_id ;;
  }

  dimension: int_evo_conditions {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.int_evo_conditions ;;
    html: <center>&#8594; <br>{{linked_value}}</center>;;
  }

  dimension: begin_evo_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.begin_evo_species_id ;;
  }

  dimension: begin_evo_poke_filter_helper {
    view_label: "Evolution Info"
    hidden: yes
    type: string
    sql: CONCAT(UPPER(SUBSTR(${begin_evo_poke},1,1)), LOWER(SUBSTR(${begin_evo_poke},2)))
 ;;
  }

  dimension: begin_evo_poke {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.begin_evo_poke ;;
    html:<img src="https://img.pokemondb.net/sprites/sword-shield/icon/{{value}}.png"> {{linked_value}};;

    link: {
      label: "Link to {{pokemon_facts.begin_evo_poke_filter_helper._value}} Deep Dive"
      url: "/dashboards-next/8?Pokemon+Name={{pokemon_facts.begin_evo_poke_filter_helper._value}}&Game+Version+%28For+Learnset%29={{ _filters['pokemon_facts.move_game_version'] | url_encode }}"
    }
    link: {
      label: "Link to {{pokemon_facts.begin_evo_poke_filter_helper._value}} Index"
      url: "http://pokemon-index.com/p/{{value}}"
    }
  }

  dimension: begin_evolving_species_id {
    view_label: "Evolution Info"
    type: number
    sql: ${TABLE}.begin_evolving_species_id ;;
  }

  dimension: begin_evo_conditions {
    view_label: "Evolution Info"
    type: string
    sql: ${TABLE}.begin_evo_conditions ;;
  }

######## Abilities  ######################################################################

  dimension: ability_id {
    view_label: "Abilities"
    label: "ID"
    type: number
    sql: ${TABLE}.ability_id ;;
  }

  dimension: ability_name_raw {
    view_label: "Abilities"
    hidden: yes
    type: string
    sql: ${TABLE}.ability_name_raw ;;
  }

  dimension: ability_name {
    view_label: "Abilities"
    label: "Name"
    type: string
    sql: ${TABLE}.ability_name ;;
    link: {
      label: "Search for {{ value }} details"
      url: "https://www.google.com/search?q={{ value | url_encode }}+pokemon"
      icon_url: "https://www.google.com/s2/favicons?domain=https://www.google.com"
    }
  }

  dimension: ability_gen_introduced {
    view_label: "Abilities"
    label: "Generation Introduced"
    type: number
    sql: ${TABLE}.ability_gen_introduced ;;
  }

  dimension: ability_effect_long {
    view_label: "Abilities"
    label: "Effect (Long)"
    type: string
    sql: ${TABLE}.ability_effect_long ;;
  }

  dimension: ability_effect {
    view_label: "Abilities"
    label: "Effect"
    type: string
    sql: ${TABLE}.ability_effect ;;
  }

######## Defense Strengths/Weaknesses  ######################################################################

  dimension: incoming_attack_type {
    view_label: "Defense Strengths/Weaknesses"
    label: "Incoming Attack Type"
    type: string
    sql: ${TABLE}.defensive_type_efficacy_attack_type ;;
    order_by_field: incoming_attack_type_id
  }

  dimension: incoming_attack_type_id {
    view_label: "Defense Strengths/Weaknesses"
    label: "Incoming Attack Type ID"
    hidden: yes
    type: string
    sql: ${TABLE}.defensive_type_efficacy_attack_type_id ;;
  }

  dimension: defensive_damage_multiple {
    view_label: "Defense Strengths/Weaknesses"
    label: "Defense Damage Multiple"
    type: number
    sql: ${TABLE}.defensive_type_efficacy_damage_multiple ;;
  }

}
