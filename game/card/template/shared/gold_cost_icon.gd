extends Panel

func populate_info(card_spec: CardSpecification) -> void:
    $"%GoldCost".text = card_spec.fields.get('gold_cost')       
