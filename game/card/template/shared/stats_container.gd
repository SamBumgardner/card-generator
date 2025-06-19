class_name StatsContainer extends VBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    $"%Might".text = card_spec.fields['might']
    $"%Agility".text = card_spec.fields['agility']
    $"%Spirit".text = card_spec.fields['spirit']
    var wild = card_spec.fields.get('wild')
    
    if wild == null or wild.is_empty():
        $WildContainer.hide()
    else:
        $WildContainer.show()
        $"%Wild".text = card_spec.fields['wild']

func populate_info_from_array(stat_amounts: Array) -> void:
    $"%Might".text = stat_amounts[0]
    $"%Agility".text = stat_amounts[1]
    $"%Spirit".text = stat_amounts[2]
    var wild = stat_amounts[3]
    
    if wild == null or wild.is_empty():
        $WildContainer.hide()
    else:
        $WildContainer.show()
        $"%Wild".text = stat_amounts[3]
