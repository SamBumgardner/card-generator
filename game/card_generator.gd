extends Control

func _ready():
    DisplayServer.window_set_size(Vector2i($GridContainer.size))
    await RenderingServer.frame_post_draw
    get_viewport().get_texture().get_image().save_png("res://new_card.png")
