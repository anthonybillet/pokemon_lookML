- dashboard: pokemon_stats
  title: Pokemon Stats
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: liwOo3SWMgZzIWRtSXkf8j
  elements:
  - title: Pokemon Stats
    name: Pokemon Stats
    model: pokemon
    explore: pokemon_facts
    type: looker_grid
    fields: [pokemon_facts.pokemon_species_id, pokemon_facts.pokemon_name_w_sprite,
      pokemon_facts.type, pokemon_facts.hp, pokemon_facts.attack, pokemon_facts.defense,
      pokemon_facts.special_attack, pokemon_facts.special_defense, pokemon_facts.speed,
      pokemon_facts.total]
    filters: {}
    sorts: [pokemon_facts.pokemon_species_id]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      pokemon_facts.pokemon_species_id: "#"
      pokemon_facts.special_attack: S Attack
      pokemon_facts.special_defense: S Defense
      pokemon_facts.pokemon_name_w_sprite: Name
    series_column_widths:
      pokemon_facts.type: 131
      pokemon_facts.pokemon_name: 175
      pokemon_facts.pokemon_species_id: 75
      pokemon_facts.pokemon_name_w_sprite: 200
    series_cell_visualizations:
      pokemon_facts.hp:
        is_active: false
      pokemon_facts.pokemon_species_id:
        is_active: false
    series_text_format:
      pokemon_facts.pokemon_species_id:
        align: center
      pokemon_facts.pokemon_name:
        align: left
        bold: true
      pokemon_facts.hp:
        align: center
      pokemon_facts.attack:
        align: center
      pokemon_facts.defense:
        align: center
      pokemon_facts.special_attack:
        align: center
      pokemon_facts.special_defense:
        align: center
      pokemon_facts.speed:
        align: center
      pokemon_facts.total:
        align: center
      pokemon_facts.type:
        align: center
    header_font_color: "#ffffff"
    header_background_color: "#5db9ff"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: 4a991f42-9d22-eccf-8e73-52b3e970ddf4, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#FFDE00", offset: 100}]},
          options: {steps: 5, reverse: false, constraints: {max: {type: number, value: 150}}}},
        bold: false, italic: false, strikethrough: false, fields: [pokemon_facts.hp,
          pokemon_facts.attack, pokemon_facts.defense, pokemon_facts.special_attack,
          pokemon_facts.special_defense, pokemon_facts.speed]}, {type: along a scale...,
        value: !!null '', background_color: !!null '', font_color: !!null '', color_application: {
          collection_id: legacy, custom: {id: 8d70f8d0-8892-7546-b975-6379239f9224,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#FFDE00", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [pokemon_facts.total]}]
    defaults_version: 1
    listen:
      Is Original Form: pokemon_facts.is_original_form
      Generation Introduced: pokemon_facts.pokemon_generation_introduced
      Game Version (For Learnset): pokemon_facts.move_game_version
      Learn Method: pokemon_facts.move_learn_method
      Move: pokemon_facts.move_name
      Ability: pokemon_facts.ability_name
      Pokemon: pokemon_facts.pokemon_name
      Type(s): pokemon_facts.type
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Is Original Form
    title: Is Original Form
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.is_original_form
  - name: Generation Introduced
    title: Generation Introduced
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.pokemon_generation_introduced
  - name: Game Version (For Learnset)
    title: Game Version (For Learnset)
    type: field_filter
    default_value: Emerald
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.move_game_version
  - name: Move
    title: Move
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: [Game Version (For Learnset)]
    field: pokemon_facts.move_name
  - name: Learn Method
    title: Learn Method
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.move_learn_method
  - name: Ability
    title: Ability
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: [Game Version (For Learnset)]
    field: pokemon_facts.ability_name
  - name: Pokemon
    title: Pokemon
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: [Game Version (For Learnset)]
    field: pokemon_facts.pokemon_name
  - name: Type(s)
    title: Type(s)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.type
