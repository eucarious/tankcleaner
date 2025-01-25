extends CharacterBody2D

var size : int = 1
var max_size : int = 4
var spread : int = 0
var eat : int = 1

func _ready() -> void:
	create_bubble()

func create_bubble():
	rotate(randf_range(-PI / 4, PI / 4))
	var random_size = randi_range(1, 3)
	var label = $Label
	match random_size:
		1:
			label.text = str(size)
		
		2:
			label.text = str(size)
		
		3:
			size = 2
			spread = 1
			eat = 2
			label.text = str(size)
	

func eat_bubble():
	for i in range(spread):
		var new_bubble = self.duplicate() # ISSUE RIGHT HERE!!!
		get_tree().current_scene.add_child(new_bubble)
		new_bubble.transform.origin = Vector2(position.x + randi_range(-40, 40), position.y + randi_range(-40, 40))
	
	queue_free()
	
