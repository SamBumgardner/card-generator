class_name CardBounty extends MarginContainer

@export var card_spec: CardSpecification

@onready var name_label: Label = $%Name
@onready var supertype_label: Label = $%Supertype
@onready var typeline_label: Label = $%Typeline

func _ready() -> void:
    if card_spec != null:
        name_label.text = card_spec.fields['name']
        supertype_label.text = card_spec.supertype
        typeline_label.text = card_spec.fields['typeline']
        
        generate_player_actions(card_spec)
        generate_bounty_actions(card_spec)

        $%TownReward.text = card_spec.fields['town_reward']
        $%Reward1.text = card_spec.fields['reward_first']
        $%Reward2.text = card_spec.fields['reward_second']
        $%Reward3.text = card_spec.fields['reward_last']
     
func generate_player_actions(card_spec: CardSpecification) -> void:
    var player_actions: PackedStringArray = (card_spec.fields['weaknesses'] as String).split('|')
    for player_action: String in player_actions:        
        var split_action = player_action.split(":")
        var cost = split_action[0]
        var effect = split_action[1]
        
        var player_action_scene = (load("res://card/template/bounty/player_action.tscn") as PackedScene).instantiate()
        $%PlayerActions.add_child(player_action_scene)
        # Call method on player action action to set values
    

func generate_bounty_actions(card_spec: CardSpecification) -> void:
    var bounty_actions: PackedStringArray = (card_spec.fields['attacks'] as String).split('|')
    for bounty_action: String in bounty_actions:
        const stat_names = ['Might', 'Agility', 'Spirit', 'Wild']
        
        var split_action = bounty_action.split(":")
        var trigger_rolls = split_action[0]
        var stat_requirement_strings = split_action[1].split(",")
        var stat_requirement_values = [0,0,0,0]
        for stat_requirement in stat_requirement_strings:
            for i in stat_names.size():
                if stat_requirement.contains(stat_names[i]):
                    stat_requirement[i] = int(stat_requirement)
        
        var bounty_action_scene = (load("res://card/template/bounty/bounty_action.tscn") as PackedScene).instantiate()
        $%BountyActions.add_child(bounty_action_scene)
        # Call method on bounty action to set values
