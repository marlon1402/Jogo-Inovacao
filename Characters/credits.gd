extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("voltar_creditos"):
		get_tree().change_scene_to_file("res://scenes/Screens/title_screen.tscn")
