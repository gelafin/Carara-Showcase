extends Node2D

#TODO: make button 

const CARD_SIZE = Vector2(96, 133)
onready var joker = $joker
onready var just_above = Vector2(position.x, position.y-CARD_SIZE.y)
var steps

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		# move up by one space, if there is an open tile above and remaining 
		# steps > 0. Then decrease the number of remaining steps
		if position.y >= CARD_SIZE.y && joker.position != just_above:
			position.y -= CARD_SIZE.y
			steps -= 1

