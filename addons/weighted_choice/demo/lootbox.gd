extends Node

const Rarity = {
	"COMMON":0.8,
	"UNCOMMON": 0.2,
	"RARE": 0.1,
	"LEGENDARY": 0.05
}

var items = {
	"copper_sword": {
		"name": "Copper Sword",
		"sprite": preload("res://addons/weighted_choice/demo/sprites/copper_sword.png"),
		"damage": 10,
		"rarity": Rarity.COMMON
	},
	"iron_sword": {
		"name": "Iron Sword",
		"sprite": preload("res://addons/weighted_choice/demo/sprites/iron_sword.png"),
		"damage": 25,
		"rarity": Rarity.UNCOMMON
	},
	"gold_sword": {
		"name": "Gold Sword",
		"sprite": preload("res://addons/weighted_choice/demo/sprites/gold_sword.png"),
		"damage": 50,
		"rarity": Rarity.RARE
	},
	"diamond_sword": {
		"name": "Diamond Sword",
		"sprite": preload("res://addons/weighted_choice/demo/sprites/diamond_sword.png"),
		"damage": 80,
		"rarity": Rarity.LEGENDARY
	}
}

var opened = false
var loot

func open():
	opened = true
	loot = items[WeightedChoice.pick(items, "rarity")]
	$ItemLabel.text = loot.name
	$ItemSprite2D.texture = loot.sprite
	$AnimationPlayer.play("open")


func _on_texture_button_pressed():
	if not opened:
		open()

func _on_reset_button_pressed():
	opened = false
	loot = ""
	$AnimationPlayer.play("close")
