extends Node2D


onready var current_line2D = Line2D.new()
var curve2d : Curve2D
var last_position : Vector2
export var speed = 5
var started = false #stops the pathfollow setting off without a path
var all_lines : Array
var current_color = Color('#FFFF00')
var current_width = 17.5
var mouse_hover = false

func _ready():
	$SpeechBubble.set_text("Dit zijn oude kleren, doe er wat leuks mee!")
	$Paintbuckets.greyout_buckets()
	$Paintbuckets/Yellow.modulate = '#FFFFFF'
	
	current_line2D.set_default_color(current_color)
	current_line2D.set_width(current_width)
	$Shirt.add_child(current_line2D)
	
	$Shirt.connect("mouse_entered", self, "OnMouseEntry")
	$Shirt.connect("mouse_exited", self, "OnMouseExit")



func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and mouse_hover:
		started = true
		curve2d = null
	
		#draw the points
		if event is InputEventMouseMotion:
			current_line2D.add_point(event.position)
	
	if Input.is_action_just_released("MOUSE_LEFT"):
		all_lines.append(current_line2D)
		
		current_line2D = Line2D.new()
		current_line2D.set_default_color(current_color)
		current_line2D.set_width(current_width)
		$Shirt.add_child(current_line2D)
		
		print(current_line2D.get_parent())
		
	
	if Input.is_key_pressed(KEY_SPACE):
		for line in all_lines:
			line.queue_free()
		all_lines = []

func _on_donation_button_pressed():
	$AnimationPlayer.play("donate")


func _on_throw_away_button_pressed():
	$AnimationPlayer.play("throwout")


func _on_keep_button_pressed():
	$AnimationPlayer.play("keep")


func _on_Yellow_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/Yellow.modulate = '#FFFFFF'
		
		current_color = Color("#FFFF00")
		current_line2D.set_default_color(current_color)


func _on_Green_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/Green.modulate = '#FFFFFF'
		
		current_color = Color("#228B22")
		current_line2D.set_default_color(current_color)


func _on_White_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/White.modulate = '#FFFFFF'
		
		current_color = Color("#FFFFFF")
		current_line2D.set_default_color(current_color)


func _on_Red_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/Red.modulate = '#FFFFFF'
		
		current_color = Color("#FF0000")
		current_line2D.set_default_color(current_color)


func _on_Blue_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/Blue.modulate = '#FFFFFF'
		
		current_color = Color("#0000FF")
		current_line2D.set_default_color(current_color)
		


func _on_Black_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		$Paintbuckets.greyout_buckets()
		$Paintbuckets/Black.modulate = '#FFFFFF'
		
		current_color = Color("#000000")
		current_line2D.set_default_color(current_color)


func _on_Large_pressed():
	current_line2D.width = 25
	current_width = 25
	
	$Paintbrushes/Large.texture_normal = load("res://Art/Minigame art/Tshirt/black-dot.png")
	$Paintbrushes/Medium.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")
	$Paintbrushes/Small.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")
	


func _on_Medium_pressed():
	current_line2D.width = 17.5
	current_width = 17.5
	
	$Paintbrushes/Large.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")
	$Paintbrushes/Medium.texture_normal = load("res://Art/Minigame art/Tshirt/black-dot.png")
	$Paintbrushes/Small.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")


func _on_Small_pressed():
	current_line2D.width = 10
	current_width = 10
	
	$Paintbrushes/Large.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")
	$Paintbrushes/Medium.texture_normal = load("res://Art/Minigame art/Tshirt/grey-dot.png")
	$Paintbrushes/Small.texture_normal = load("res://Art/Minigame art/Tshirt/black-dot.png")


func OnMouseEntry():
	mouse_hover = true

func OnMouseExit():
	mouse_hover = false
