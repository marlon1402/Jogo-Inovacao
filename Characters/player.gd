extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping:= false
var knockback_vector := Vector2.ZERO
@onready var animation: =$Animated as AnimatedSprite2D
@onready var remote_transform := $remote as RemoteTransform2D
@onready var ray_right := $ray_right as RayCast2D
@onready var ray_left := $ray_left as RayCast2D
@onready var jump_sfx = $jump_sfx as AudioStreamPlayer
@onready var damage_sfx = $damage_sfx as AudioStreamPlayer
@onready var timer_game_over = $timer_game_over as Timer

var target_position = Vector2(5670, -250)
signal player_has_died()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		jump_sfx.play()
	elif is_on_floor():
		is_jumping = false
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if not is_jumping:
			animation.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")
		
	if is_jumping:
		animation.play("jump")
	
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
		
	
	if Input.is_action_pressed("atalho"):
		global_position = target_position
	
	move_and_slide()
	
	
func _on_hurtbox_body_entered(body):
	if ray_right.is_colliding():
		take_damage(Vector2(-200,-200))
	elif ray_left.is_colliding():
		take_damage(Vector2(200,-200))
	
func follow_camera(camera):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path
	
func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	if Globals.player_life > 0:
		damage_sfx.play()
		Globals.player_life -= 1
	else:
		timer_game_over.start()
		
	
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		
		var knockback_tween := get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		animation.modulate = Color(1, 0, 0, 1)
		knockback_tween.parallel().tween_property(animation, "modulate", Color(1,1,1,1), duration)

var is_dead = false

func died():
	Globals.player_life = 0
	timer_game_over.start()
	
func _on_timer_game_over_timeout():
	queue_free()
	get_tree().change_scene_to_file("res://scenes/Screens/game_over_screen.tscn")
