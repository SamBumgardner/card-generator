extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%RemovalPoints.text = card_spec['removal_points']
        $%RemovalCondition.text = card_spec['removal_condition']
