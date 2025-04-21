class_name CardAdventurer extends Card

func _ready() -> void:
    super ()
    if card_spec != null:
        $ColorRect/StatsContainer.populate_info(card_spec)
