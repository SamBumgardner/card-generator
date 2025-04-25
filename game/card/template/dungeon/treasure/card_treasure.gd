extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%ThreatContainer.populate_content(card_spec)
        var value = card_spec['fame']
        $%FameValue.text = "%s Fame / %s Gold" % [value, value]
