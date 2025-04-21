extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $ColorRect/BuildCost.populate_info(card_spec)
