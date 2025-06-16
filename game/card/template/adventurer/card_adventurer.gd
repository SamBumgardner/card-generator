class_name CardAdventurer extends Card

func _ready() -> void:
    super ()
    if card_spec != null:
        $%StatsContainer.populate_info(card_spec)
