extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%BuildCost.populate_info(card_spec)
