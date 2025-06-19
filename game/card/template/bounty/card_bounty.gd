class_name CardBounty extends Card

func _init():
    cards_per_row = 1
    cards_per_page = 2

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
        
        $%DungeonSize.text = card_spec.fields['dungeon_size_limit']
        $%Health.text = card_spec.fields['max_hp']
     
func generate_player_actions(card_spec: CardSpecification) -> void:
    var player_actions: PackedStringArray = (card_spec.fields['weaknesses'] as String).split('|')
    for player_action: String in player_actions:        
        var split_action = player_action.split(":")
        var cost = split_action[0]
        var effect = split_action[1]
        
        var player_action_scene: PlayerAction = (load("res://card/template/bounty/player_action.tscn") as PackedScene).instantiate()
        $%PlayerActions.add_child(player_action_scene)
        player_action_scene.cost.text = cost + ":"
        player_action_scene.effect.text = effect
    

func generate_bounty_actions(card_spec: CardSpecification) -> void:
    var bounty_actions: PackedStringArray = (card_spec.fields['attacks'] as String).split('|')
    var numeric_regex: RegEx = RegEx.new()
    numeric_regex.compile("\\d+")
    for bounty_action: String in bounty_actions:
        const stat_names = ['Might', 'Agility', 'Spirit', 'Wild']
        
        var split_action = bounty_action.split(":")
        var trigger_rolls = split_action[0]
        var stat_requirement_strings = split_action[1].split(",")
        var stat_requirement_values = ["0","0","0","0"]
        for stat_requirement in stat_requirement_strings:
            for i in stat_names.size():
                if stat_requirement.contains(stat_names[i]):
                    stat_requirement_values[i] = numeric_regex.search(stat_requirement).get_string()
        
        var bounty_action_scene: BountyAction = (load("res://card/template/bounty/bounty_action.tscn") as PackedScene).instantiate()
        $%BountyActions.add_child(bounty_action_scene)
        bounty_action_scene.trigger.text = "Roll " + trigger_rolls +  ":"
        bounty_action_scene.stats_container.populate_info_from_array(stat_requirement_values)
