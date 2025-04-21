class_name FormatSelector extends RefCounted

const card_templates: Dictionary = {
    'Adventurer': preload("res://card/template/adventurer/card_adventurer.tscn"),
    'Adventurer (wounded)': preload("res://card/template/adventurer/card_adventurer_wounded.tscn"),
    'Gear': preload("res://card/template/gear/card_gear.tscn"),
    'Action': preload("res://card/template/action/card_action.tscn"),
    'Building': null,
    'Dungeon Obstacle': null,
    'Dungeon Persist': null,
    'Treasure': null,
    'Boss Action': null,
}
