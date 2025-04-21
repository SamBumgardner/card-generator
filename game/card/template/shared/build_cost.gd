extends VBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    $"%TechCost".text = card_spec.fields.get('cost_tech')
    $"%NatureCost".text = card_spec.fields.get('cost_nature')
    $"%MagicCost".text = card_spec.fields.get('cost_magic')
    $"%WildCost".text = card_spec.fields.get('cost_wild')
    for label: Label in [$%MagicCost, $%NatureCost, $%TechCost, $%WildCost]:
        if label.text == null or label.text.is_empty():
            label.get_parent().hide()
        else:
            label.get_parent().show()
        
