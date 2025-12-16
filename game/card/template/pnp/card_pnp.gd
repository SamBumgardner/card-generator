extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $TextureRect.texture = load("res://assets/%s/%s/%s" % [card_spec.fields['root_path'],
            card_spec.fields['sub_section'], card_spec.fields['image_name']])
