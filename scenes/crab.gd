extends CharacterBody2D

@export var speed : int = 150
var global_speed_modifier : float = 1

var target_velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
		
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	target_velocity.x = direction.x * speed * global_speed_modifier
	target_velocity.y = direction.y * speed * global_speed_modifier
	
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		
		if collision.get_collider() == null:
			continue
		
		if collision.get_collider().is_in_group("enemy"):
			var bubble = collision.get_collider()
			bubble.eat_bubble()
	
	velocity = target_velocity
	move_and_slide()
