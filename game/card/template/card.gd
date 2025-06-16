class_name Card extends MarginContainer

@export var card_spec: CardSpecification

@onready var name_label: Label = $%Name
@onready var supertype_label: Label = $%Supertype
@onready var typeline_label: Label = $%Typeline
@onready var effect_label: Label = $%Effect

func _ready() -> void:
    if card_spec != null:
        name_label.text = card_spec.fields['name']
        supertype_label.text = card_spec.supertype
        typeline_label.text = card_spec.fields['typeline']
        effect_label.text = card_spec.fields['effect']
        
        if effect_label.text.is_empty():
            effect_label.text = "No effect"
        
        recursive_populate(self, card_spec)
        
        
static func recursive_populate(current_node: Node, card_spec: CardSpecification) -> void:
    var children = current_node.get_children()
    for child in children:
        recursive_populate(child, card_spec)
    
    if current_node.is_in_group("populates"):
        current_node.populate_info(card_spec)
