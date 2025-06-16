extends CardDungeon

func _ready() -> void:
    super()
    if card_spec != null:
        $%RemovalPoints.text = card_spec.fields['removal_points']
        $%RemovalCondition.text = card_spec.fields['removal_condition']
