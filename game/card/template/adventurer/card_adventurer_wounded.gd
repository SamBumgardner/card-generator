extends CardAdventurer

func _ready() -> void:
    super ()
    if card_spec != null:
        $ColorRect/Header/Name.text = $ColorRect/Header/Name.text + " (Wounded)"
