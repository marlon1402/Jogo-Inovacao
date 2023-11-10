extends Control

@onready var jumpscare_sfx = $jumpscare_sfx as AudioStreamPlayer

func _ready():
	jumpscare_sfx.play()
	set_process_input(true)

func _process(delta):
	
	if Input.is_action_pressed("game_over_key"):
		get_tree().change_scene_to_file("res://scenes/Screens/title_screen.tscn")
