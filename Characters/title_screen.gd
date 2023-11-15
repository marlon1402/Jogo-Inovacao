extends Control

@onready var mine_sfx = $mine_sfx as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	mine_sfx.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/Screens/credits.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()
