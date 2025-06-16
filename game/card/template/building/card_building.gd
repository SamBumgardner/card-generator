extends Card

func _ready() -> void:
    super()
    if card_spec != null:
        $%Effect2.text = card_spec.fields['effect_2']
        if $%Effect2.text.is_empty():
            $Border/ColorRect/Body/EffectContainer2.hide()
        else:
            $Border/ColorRect/Body/EffectContainer2.show()
        
        $%Effect3.text = card_spec.fields['effect_3']
        if $%Effect3.text.is_empty():
            $Border/ColorRect/Body/EffectContainer3.hide()
        else:
            $Border/ColorRect/Body/EffectContainer3.show()
