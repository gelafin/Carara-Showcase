extends Node2D

const CARD_SIZE = Vector2(96, 133)
const BOARD_SIZE = Vector2(CARD_SIZE.x * 13, CARD_SIZE.y * 4) #board is 13x4
onready var joker = $"../joker"
onready var just_above = Vector2(position.x, position.y - CARD_SIZE.y)
onready var just_below = Vector2(position.x, position.y + CARD_SIZE.y)
onready var just_leftward = Vector2(position.x - CARD_SIZE.x, position.y)
onready var just_rightward = Vector2(position.x + CARD_SIZE.x, position.y)
var moved = false

var steps = 500 #this is a placeholder until another function will set it

func _ready():
	pass

func update_position_variables():
	just_above = Vector2(position.x, position.y - CARD_SIZE.y)
	just_below = Vector2(position.x, position.y + CARD_SIZE.y)
	just_leftward = Vector2(position.x - CARD_SIZE.x, position.y)
	just_rightward = Vector2(position.x + CARD_SIZE.x, position.y)
	moved = false

func _process(delta):
	if steps > 0:
		if Input.is_action_just_pressed("ui_up"):
			# move up by one space, provided there is an open tile above 
			# Then decrease the number of remaining steps
			if position.y >= CARD_SIZE.y && joker.position != just_above:
				position.y -= CARD_SIZE.y
				steps -= 1
				moved = true
				update_position_variables()
				
		if Input.is_action_just_pressed("ui_down"):
			if position.y <= BOARD_SIZE.y - 2 * CARD_SIZE.y && joker.position != just_below:
				position.y += CARD_SIZE.y
				steps -= 1
				moved = true
				update_position_variables()
		
		if Input.is_action_just_pressed("ui_left"):
			if position.x >= CARD_SIZE.x && joker.position != just_leftward:
				position.x -= CARD_SIZE.x
				steps -= 1
				moved = true
				update_position_variables()
		
		if Input.is_action_just_pressed("ui_right"):
			if position.x <= BOARD_SIZE.x - 2 * CARD_SIZE.x && joker.position != just_rightward:
				position.x += CARD_SIZE.x
				steps -= 1
				moved = true
				update_position_variables()
