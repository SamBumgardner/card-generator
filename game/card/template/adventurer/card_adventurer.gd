class_name CardAdventurer extends Card

func _ready() -> void:
    super ()
    if card_spec != null:
        $"%Might".text = card_spec['might']
        $"%Agility".text = card_spec['agility']
        $"%Spirit".text = card_spec['spirit']
