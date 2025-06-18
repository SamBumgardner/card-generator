extends CardDungeon

func _ready() -> void:
    super()
    if card_spec != null:
        $%SplitStatsContainer.populate_info(card_spec)
