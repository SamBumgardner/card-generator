class_name FormatSelector extends RefCounted

const card_templates: Dictionary = {
    'Adventurer': preload("res://card/template/adventurer/card_adventurer.tscn"),
    'Adventurer (wounded)': preload("res://card/template/adventurer/card_adventurer_wounded.tscn"),
    'Gear': preload("res://card/template/gear/card_gear.tscn"),
    'Action': preload("res://card/template/action/card_action.tscn"),
    'Building': preload("res://card/template/building/card_building.tscn"),
    'Dungeon Obstacle':preload("res://card/template/dungeon/obstacle/card_obstacle.tscn"),
    'Dungeon Persist': null,
    'Treasure': null,
    'Boss Action': null,
}
