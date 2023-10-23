extends Object
class_name WeightedChoice
## This class provide a static [method  pick] method you can call to
## choose an item from a dictionary based on weights.
## [br]
## Example:
## [codeblock]
## # Define weights for ease of use
## const Rarity = {
##     "COMMON":0.85,
##     "UNCOMMON": 0.10,
##     "RARE": 0.05
## }
## 
## var items = {
##     "copper": {"name": "Copper item", "rarity": Rarity.COMMON},
##     "silver": {"name": "Silver item", "rarity": Rarity.UNCOMMON},
##     "gold": {"name": "Gold item", "rarity": Rarity.RARE}
## }
##
## var key = WeightedChoice.pick(items, "rarity") # "copper", "silver", or "gold"
## [/codeblock]


## Takes a dictionary, and picks one item based based on weights.
## [br]
## If [param weight_key] is set, the function will search for weights in
## a nested dictionary
## [br][br]
## Returns a key.
## [br][br]
## [b]Usage[/b]:
## [br][br]
## [i]Non-nested weights:[/i]
## [codeblock]
## var dict = {
##     "A": 0.85,
##     "B": 0.10,
##     "C": 0.05
## }
##
## var key = WeightedChoice.pick(dict) # "A", "B", or "C"
## [/codeblock]
##
## [i]Nested weights[/i]
## [codeblock]
## var items = {
##     "copper": {"name": "Copper item", "weight": 0.85},
##     "silver": {"name": "Silver item", "weight": 0.10},
##     "gold": {"name": "Gold item", "weight": 0.05}
## }
##
## var key = WeightedChoice.pick(items, "weight") # "copper", "silver", or "gold"
## [/codeblock]
static func pick(dict: Dictionary, weight_key = null) -> Variant:

	var weights_sum := 0.0
	var keys = dict.keys()
	# only relevant for non-nested weights
	var weights = null
	# weights are in a innested dictionary
	if weight_key:
		for item_key in dict:
			weights_sum += dict[item_key][weight_key]
	else:
		weights = dict.values()
		for weight in weights:
			weights_sum += weight

	var remaining_distance := randf() * weights_sum
	for i in dict.size():
		if weight_key:
			remaining_distance -= dict[keys[i]][weight_key]
		else:
			remaining_distance -= weights[i]
		if remaining_distance < 0:
			return keys[i]

	return keys[0]
