extends VBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    $%RetirementCost.text = card_spec.fields.get('retirement_cost')
    $%RetirementEffect.text = card_spec.fields.get('retirement_bonus')
