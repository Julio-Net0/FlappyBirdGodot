extends Node2D

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

func _ready():
	new_game()
	screen_size = get_window().size
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Jogador.reset()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Jogador.flying:
						$Jogador.flap()
						
func start_game():
	game_running = true
	$Jogador.flying = true
	$Jogador.flap()
		
func _process(delta: float) -> void:
	if game_running:
		scroll -= SCROLL_SPEED
		
		$Chao.position.x = scroll + screen_size.x
		
		if -scroll >= screen_size.x:
			scroll = 0
