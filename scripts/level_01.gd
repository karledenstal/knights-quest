extends Node2D

var collected_coins := 0
var lives := 3
var player_has_key := false

func _ready() -> void:
	var coins = get_tree().get_nodes_in_group("coin")
	var hearts = get_tree().get_nodes_in_group("heart")
	var keys = get_tree().get_nodes_in_group("key")
	
	for coin in coins:
		coin.body_entered.connect(_on_coin_pickup.bind(coin))
		
	for heart in hearts:
		heart.body_entered.connect(_on_heart_pickup.bind(heart))
		
	for key in keys:
		key.body_entered.connect(_on_key_pickup.bind(key))
		
func _on_coin_pickup(body: Node2D, coin: Coin):
	if body is Player:
		coin.pick_up_coin()
		collected_coins += 1
		
		print("collected coins: " + str(collected_coins))

func _on_heart_pickup(body: Node2D, heart: Heart):
	if body is Player:
		heart.pick_up_heart()
		lives += 1
		
		print("lives: " + str(lives))

func _on_key_pickup(body: Node2D, key: DoorKey):
	if body is Player:
		key.pick_up_key()
		player_has_key = true
		
		print("has key: " + str(player_has_key))
