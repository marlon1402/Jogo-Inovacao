extends Control

@onready var bg_music = $BG_music as AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	bg_music.play()
	set_process_input(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("voltar_creditos"):
		get_tree().change_scene_to_file("res://scenes/Screens/title_screen.tscn")
