extends CharacterBody2D

var size : int = 1
var max_size : int = 4
var spread : int = 0
var eat : int = 1

func _ready() -> void:
	$GrowTimer.start()
	create_bubble()

func create_bubble():
	print("bubble spawned")
	rotate(randf_range(-PI / 4, PI / 4))
	var label = $Label
	label.text = str(size)
	

func eat_bubble():
	print("bubble popped")
	for i in range(spread):
		var new_bubble = self.duplicate() 
		get_tree().current_scene.add_child(new_bubble)
		new_bubble.transform.origin = Vector2(randi_range(30, 720), randi_range(30, 520))
	queue_free()
	

func _on_grow_timer_timeout():
	if size < max_size:
		var label = $Label
		size += 1
		match size:
			2:
				size = 2
				spread = 1
				eat = 2
				label.text = str(size)
			3:
				size = 3
				spread = 2
				eat = 3
				label.text = str(size)
			4:
				size = 4
				spread = 3
				eat = 3
				label.text = str(size)
