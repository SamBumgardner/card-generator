class_name CardDungeon extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%RewardsContainer.populate_info(card_spec)
        $%ResourcesFooter.populate_info(card_spec)
        $%ThreatContainer.populate_info(card_spec)
