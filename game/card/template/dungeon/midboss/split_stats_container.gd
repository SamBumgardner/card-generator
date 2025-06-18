extends HBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    if card_spec != null:
        $%Typeline1.text = card_spec.fields['extra_types_1']
        $%Typeline2.text = card_spec.fields['extra_types_2']
        for typeline in [$%Typeline1, $%Typeline2]:
            if typeline.text.is_empty():
                typeline.hide()
            else:
                typeline.show()
        
        var obstacle_1_stats = []
        var obstacle_2_stats = []
        var unparsed_stats = [
            card_spec.fields['might'], 
            card_spec.fields['agility'], 
            card_spec.fields['spirit'], 
            card_spec.fields['wild']
        ]
        for stat in unparsed_stats:
            if stat.is_empty():
                obstacle_1_stats.append('')
                obstacle_2_stats.append('')
            else:
                var split_stats = stat.split('|')
                obstacle_1_stats.append(split_stats[0])
                obstacle_2_stats.append(split_stats[1])
        
        $%StatsContainer.populate_info_from_array(obstacle_1_stats)
        $%StatsContainer2.populate_info_from_array(obstacle_2_stats)
