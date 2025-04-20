class_name Card extends MarginContainer

@export var card_spec: CardSpecification

@onready var name_label: Label = $ColorRect/Header/Name
@onready var supertype_label: Label = $ColorRect/Header/Supertype
@onready var typeline_label: Label = $ColorRect/Body/Typeline
@onready var effect_label: Label = $"ColorRect/Body/EffectContainer/Effect"
@onready var costvalue_label: Label = $ColorRect/CostIcon/CostValue

func _ready() -> void:
    if card_spec != null:
        name_label.text = card_spec.fields['name']
        supertype_label.text = card_spec.supertype
        typeline_label.text = card_spec.fields['typeline']
        effect_label.text = card_spec.fields['effect']
        costvalue_label.text = card_spec.fields['gear_token_cost']
