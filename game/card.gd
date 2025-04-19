extends MarginContainer

@export var cost: int = 0
@export var card_name: String = "Luke's Card"

func _ready():
    $ColorRect/CostIcon/CostValue.text = str(cost)
    $ColorRect/Name.text = card_name   
