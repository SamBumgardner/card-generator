class_name FormatSelector extends RefCounted

const card_templates: Dictionary = {
    'Adventurer': preload("res://card/template/adventurer/card_adventurer.tscn"),
    'Adventurer (Wounded)': preload("res://card/template/adventurer/card_adventurer_wounded.tscn"),
    'Gear': preload("res://card/template/gear/card_gear.tscn"),
    'Action': preload("res://card/template/action/card_action.tscn"),
    'Building': preload("res://card/template/building/card_building.tscn"),
    'Dungeon Obstacle':preload("res://card/template/dungeon/obstacle/card_dungeon_obstacle.tscn"),
    'Dungeon Persist': preload("res://card/template/dungeon/persist/card_dungeon_persist.tscn"),
    'Treasure': preload("res://card/template/dungeon/treasure/card_treasure.tscn"),
    'Boss Action': preload("res://card/template/dungeon/boss/card_boss_action.tscn"),
    'Midboss': preload("res://card/template/dungeon/midboss/card_dungeon_midboss.tscn"),
    '': preload("res://card/template/blank.tscn")
}
