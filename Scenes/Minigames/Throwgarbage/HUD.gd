extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func update_score(score):
	$Score.text = "Score: " + str(score) + "/3"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MessageTimer_timeout():
	$Message.hide()
