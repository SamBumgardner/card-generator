extends CardAdventurer

func _ready() -> void:
    super ()
    if card_spec != null:
        $%Name.text = $%Name.text + " (Wounded)"
