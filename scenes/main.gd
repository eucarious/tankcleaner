extends Node

var seconds : int
var gameover : bool = false

@export var gameTimer : Timer

func _process(delta):
	if get_tree().get_nodes_in_group("enemy").is_empty() and not gameover:
		print("no more algae")
		$AllClean.visible = true
		gameTimer.stop()
		gameover = true

func _on_timer_timeout():
	seconds += 1
	$Label.text = "%02d:%02d" % [floor(seconds / 60), seconds % 60]
