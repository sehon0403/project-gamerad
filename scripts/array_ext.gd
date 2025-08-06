extends Node

static func all(list: Array) -> bool:
	for element in list:
		if type_string(typeof(element)) != "bool": 
			push_error("all() only compatible with arrays exclusively of bools")
			
		if not element: return false
	return true

static func v2_sum(list: Array[Vector2]) -> Vector2:
	var res_vec: Vector2 = Vector2(0.0, 0.0)

	for element in list:
		if not type_string(typeof(element)) == "Vector2":
			push_error("v2_sum only compatible with array of Vector2 objects")
		res_vec += element
	
	return res_vec
