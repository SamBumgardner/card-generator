extends Control

@export var sets_to_print: Array[CardPrintingSet]
@export var cards_per_page: int = 9
@export var cards_per_row: int = 3

var current_set_i: int = 0
var current_print_spec_i: int = 0
var current_card_printed_count: int = 0
var print_page_number = 0

var skipped_first_frame: bool = false

var waiting: bool = false

func _ready():
    $GridContainer.columns = cards_per_row

func get_next_page_of_card_specs() -> Array:
    var next_page = []
    var printing_specs = sets_to_print[current_set_i].printing_specs
    while current_print_spec_i < printing_specs.size():
        var current_card = printing_specs[current_print_spec_i]
        while current_card_printed_count < current_card.print_count:
            next_page.append(current_card.card_spec)
            current_card_printed_count += 1

            if next_page.size() >= cards_per_page:
                return next_page
        
        current_print_spec_i += 1
        current_card_printed_count = 0
    
    # fill in remaining spots with blanks
    while next_page.size() > 0 and next_page.size() < cards_per_page:
        next_page.append(CardSpecification.new())
        
    return next_page

func invert_card_columns(next_page: Array) -> Array:
    var inverted_page = []
    var first_index_of_row = 0
    while first_index_of_row < cards_per_page:
        var i = first_index_of_row + cards_per_row - 1
        while i >= first_index_of_row:
            if i < next_page.size():
                inverted_page.append(next_page[i])
            i -= 1
        first_index_of_row += cards_per_row
    return inverted_page

func _process(_delta: float) -> void:
    if waiting:
        return
    
    var next_page = get_next_page_of_card_specs()
    if sets_to_print[current_set_i].back_side:
        next_page = invert_card_columns(next_page)
    
    if not next_page.is_empty():
        _instantiate_cards(next_page)
    elif current_set_i < sets_to_print.size() - 1:
        current_set_i += 1
        current_print_spec_i = 0
        print_page_number = 0
        current_card_printed_count = 0
        next_page = get_next_page_of_card_specs()
        _instantiate_cards(next_page)
    else:
        get_tree().quit()
        return
    
    if not skipped_first_frame:
        waiting = true
        await RenderingServer.frame_post_draw
        DisplayServer.window_set_size(Vector2i(2475, 3535))
        print("first frame has been drawn")
        skipped_first_frame = true
        waiting = false
        current_print_spec_i = 0
        current_card_printed_count = 0
        print_page_number = 0
        return
    else:
        waiting = true
        print("starting wait for page %s" % print_page_number)
        await RenderingServer.frame_post_draw
        print("wait finished for page %s" % print_page_number)
        waiting = false
        capture_card_sheet_image()

func _instantiate_cards(next_page_of_cards: Array):
    if not next_page_of_cards.is_empty():
        $GridContainer.get_children().map(func(x): x.queue_free())
        for spec in next_page_of_cards:
            var card_scene: PackedScene = FormatSelector.card_templates[spec.supertype] 
            var card = card_scene.instantiate()
            if card is Card:
                card.card_spec = spec
            $GridContainer.add_child(card)

func capture_card_sheet_image():
    get_viewport().get_texture().get_image().save_png("D:/card_printouts/%s_print_sheet_%s.png" % [sets_to_print[current_set_i].name, print_page_number])
    print("image captured for page %s" % print_page_number)
    print_page_number += 1
