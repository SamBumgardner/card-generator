class_name CardGear extends Card

@onready var costvalue_label: Label = $%CostValue

func _ready() -> void:
    super()
    if card_spec != null:
        costvalue_label.text = card_spec.fields['gear_token_cost']
