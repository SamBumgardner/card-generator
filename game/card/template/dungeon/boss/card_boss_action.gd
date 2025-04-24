extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%RewardsContainer.populate_info(card_spec)
        $%StatsContainer.populate_info(card_spec)
