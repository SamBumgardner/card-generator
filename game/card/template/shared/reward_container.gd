extends VBoxContainer

func populate_info(card_spec: CardSpecification) -> void:
    $RewardText.text = card_spec.fields['reward']
