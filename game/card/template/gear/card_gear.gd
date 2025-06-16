class_name CardGear extends Card

@onready var gear_cost: Label = $%GearCost

func _ready() -> void:
    super()
    if card_spec != null:
        gear_cost.text = card_spec.fields['gear_token_cost']
