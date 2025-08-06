extends Node

static func items(dict: Dictionary) -> Array:
	var keys: Array = dict.keys()
	var vals: Array = dict.values()
	var items: Array = [] 
	
	for i in range(len(keys)):
		items.append([keys[i], vals[i]])
		
	return items
