extends VBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    $PanelContainer/Resource.text = card_spec.fields['resources_footer']
