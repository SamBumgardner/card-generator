class_name Card extends MarginContainer

@export var card_spec: CardSpecification

@onready var name_label: Label = $ColorRect/Header/Name
@onready var supertype_label: Label = $ColorRect/Header/Supertype
@onready var typeline_label: Label = $ColorRect/Body/Typeline
@onready var effect_label: Label = $"ColorRect/Body/EffectContainer/Effect"

func _ready() -> void:
    if card_spec != null:
        name_label.text = card_spec.fields['name']
        supertype_label.text = card_spec.supertype
        typeline_label.text = card_spec.fields['typeline']
        effect_label.text = card_spec.fields['effect']
        
        if effect_label.text.is_empty():
            $ColorRect/Body/EffectContainer.hide()
        else:
            $ColorRect/Body/EffectContainer.show()
