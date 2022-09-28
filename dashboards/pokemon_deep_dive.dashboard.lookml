- dashboard: pokemon_deep_dive
  title: Pokemon Deep Dive
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: MSRdoQUfpRuv0y1iqOAtIa
  elements:
  - title: Pokemon Image
    name: Pokemon Image
    model: pokemon
    explore: pokemon_facts
    type: single_value
    fields: [pokemon_facts.pokemon_image]
    filters: {}
    sorts: [pokemon_facts.pokemon_image]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 0
    col: 0
    width: 9
    height: 6
  - title: Defensive Strength/Weakness Multipliers
    name: Defensive Strength/Weakness Multipliers
    model: pokemon
    explore: pokemon_facts
    type: looker_column
    fields: [pokemon_facts.defensive_damage_multiple, pokemon_facts.incoming_attack_type]
    filters: {}
    sorts: [pokemon_facts.incoming_attack_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label_value_format: ''
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Defensive Strength / Weakness Multipliers
    title_hidden: true
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 2
    col: 9
    width: 15
    height: 4
  - title: Pokemon Name
    name: Pokemon Name
    model: pokemon
    explore: pokemon_facts
    type: single_value
    fields: [pokemon_facts.pokemon_name]
    filters: {}
    sorts: [pokemon_facts.pokemon_name]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 8
    col: 0
    width: 9
    height: 1
  - title: Abilities
    name: Abilities
    model: pokemon
    explore: pokemon_facts
    type: looker_grid
    fields: [pokemon_facts.ability_name, pokemon_facts.ability_effect]
    filters: {}
    sorts: [pokemon_facts.ability_name]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '1'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      pokemon_facts.ability_name: Ability
    series_column_widths:
      pokemon_facts.ability_name: 175
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    label_value_format: ''
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Abilities
    title_hidden: true
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 0
    col: 9
    width: 15
    height: 2
  - title: Base Stats
    name: Base Stats
    model: pokemon
    explore: pokemon_facts
    type: looker_grid
    fields: [pokemon_facts.hp, pokemon_facts.attack, pokemon_facts.defense, pokemon_facts.special_attack,
      pokemon_facts.special_defense, pokemon_facts.speed, new_dimension]
    filters: {}
    sorts: [pokemon_facts.hp desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: '"Value"', label: New Dimension,
        value_format: !!null '', value_format_name: !!null '', dimension: new_dimension,
        _kind_hint: dimension, _type_hint: string}]
    show_view_names: false
    show_row_numbers: false
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '1'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: [{}]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      pokemon_facts.hp:
        is_active: false
      pokemon_facts.attack:
        is_active: false
      pokemon_facts.defense:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: pokemon_facts.hp,
            id: pokemon_facts.hp, name: HP}, {axisId: pokemon_facts.attack, id: pokemon_facts.attack,
            name: Attack}, {axisId: pokemon_facts.defense, id: pokemon_facts.defense,
            name: Defense}, {axisId: pokemon_facts.special_attack, id: pokemon_facts.special_attack,
            name: Special Attack}, {axisId: pokemon_facts.special_defense, id: pokemon_facts.special_defense,
            name: Special Defense}, {axisId: pokemon_facts.speed, id: pokemon_facts.speed,
            name: Speed}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: left
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0.5
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    overlay: true
    mapperOptions: {}
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    note_state: collapsed
    note_display: above
    note_text: Base Stats
    title_hidden: true
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 6
    col: 9
    width: 15
    height: 4
  - title: Stat Total
    name: Stat Total
    model: pokemon
    explore: pokemon_facts
    type: single_value
    fields: [pokemon_facts.total]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    conditional_formatting: [{type: less than, value: 400, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: between, value: [400, 480],
        background_color: "#F9AB00", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 479,
        background_color: "#7CB342", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 6
    col: 4
    width: 5
    height: 2
  - title: Evolution Chain
    name: Evolution Chain
    model: pokemon
    explore: pokemon_facts
    type: looker_grid
    fields: [pokemon_facts.begin_evo_poke, pokemon_facts.int_evo_conditions, pokemon_facts.int_evo_poke,
      pokemon_facts.final_evo_conditions, pokemon_facts.final_evo_poke]
    filters: {}
    sorts: [pokemon_facts.begin_evo_poke]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      pokemon_facts.begin_evo_poke: Stage 0 Pokemon
      pokemon_facts.int_evo_conditions: Stage 1 -> Stage 2
      pokemon_facts.int_evo_poke: Stage 1 Pokemon
      pokemon_facts.final_evo_conditions: Stage 1 -> Stage 2
      pokemon_facts.final_evo_poke: Stage 2 Pokemon
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 10
    col: 0
    width: 24
    height: 3
  - title: Learnset
    name: Learnset
    model: pokemon
    explore: pokemon_facts
    type: looker_grid
    fields: [pokemon_facts.move_learn_method, pokemon_facts.level, pokemon_facts.item_name,
      pokemon_facts.move_name, pokemon_facts.move_type, pokemon_facts.move_power,
      pokemon_facts.move_accuracy, pokemon_facts.move_damage_class, pokemon_facts.move_description,
      pokemon_facts.move_pp]
    filters:
      pokemon_facts.move_learn_method: ''
    sorts: [pokemon_facts.move_learn_method, pokemon_facts.level, pokemon_facts.item_name]
    limit: 500
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
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [pokemon_facts.move_learn_method, pokemon_facts.level, pokemon_facts.item_name,
      pokemon_facts.move_name, pokemon_facts.move_type, pokemon_facts.move_damage_class,
      pokemon_facts.move_power, pokemon_facts.move_accuracy, pokemon_facts.move_pp,
      pokemon_facts.move_description]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      pokemon_facts.item_name: TM/HM
      pokemon_facts.move_name: Move
    series_column_widths:
      pokemon_facts.move_description: 400
      pokemon_facts.move_learn_method: 145
      pokemon_facts.move_damage_class: 100
      pokemon_facts.move_name: 120
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 13
    col: 0
    width: 24
    height: 11
  - title: Type(s)
    name: Type(s)
    model: pokemon
    explore: pokemon_facts
    type: single_value
    fields: [pokemon_facts.type]
    filters: {}
    sorts: [pokemon_facts.type]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 6
    col: 0
    width: 4
    height: 2
  - title: Location
    name: Location
    model: pokemon
    explore: pokemon_facts
    type: single_value
    fields: [pokemon_facts.location, pokemon_facts.game_ver_seribii_link_helper]
    filters: {}
    sorts: [pokemon_facts.location]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    conditional_formatting: [{type: 'null', value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Pokemon Name: pokemon_facts.pokemon_name
      Game Version (For Learnset): pokemon_facts.move_game_version
    row: 9
    col: 0
    width: 9
    height: 1
  filters:
  - name: Pokemon Name
    title: Pokemon Name
    type: field_filter
    default_value: Bulbasaur
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: [Game Version (For Learnset)]
    field: pokemon_facts.pokemon_name
  - name: Game Version (For Learnset)
    title: Game Version (For Learnset)
    type: field_filter
    default_value: Emerald
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: pokemon
    explore: pokemon_facts
    listens_to_filters: []
    field: pokemon_facts.move_game_version
