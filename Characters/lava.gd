extends Area2D

@onready var collision = $Collision as CollisionShape2D
@onready var lava_sfx = $lava_sfx as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	lava_sfx.play()
	if body.name == "Player":
		lava_sfx.play()
		body.died()
