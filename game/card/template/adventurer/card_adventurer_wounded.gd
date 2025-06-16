extends CardAdventurer

func _ready() -> void:
    super ()
    if card_spec != null:
        $Border/ColorRect/StatsContainer/MightContainer/Might.text = card_spec.fields['wound_might']
        $Border/ColorRect/StatsContainer/AgilityContainer/Agility.text = card_spec.fields['wound_agility']
        $Border/ColorRect/StatsContainer/SpiritContainer/Spirit.text = card_spec.fields['wound_spirit']
        if not card_spec.fields['wound_effect'].is_empty():
            $%Effect.text = card_spec.fields['wound_effect']
