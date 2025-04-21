extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $ColorRect/Body/RewardContainer.populate_info(card_spec)
        $ColorRect/StatsContainer.populate_info(card_spec)
        $ColorRect/ResourcesFooter.populate_info(card_spec)
        $ColorRect/ThreatContainer.populate_info(card_spec)
