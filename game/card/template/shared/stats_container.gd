extends VBoxContainer

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
