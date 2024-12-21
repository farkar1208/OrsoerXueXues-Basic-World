extends Node


#Vecter2i取正余数
func positive_remainder(a: Vector2i, b: int) -> Vector2i:
	return Vector2i((a.x % b + b) % b, (a.y % b + b) % b)
	pass

func rect_croods_array(from: Vector2i, size: Vector2i) -> Array:
	var rect = []
	for i in range(from.x, from.x + size.x):
		for j in range(from.y, from.y + size.y):
			rect.push_back(Vector2i(i,j))
	return rect

func string_to_vector2i(from: String):
	var regex = RegEx.new()
	regex.compile(r"-?\d+")
	var arr = regex.search_all(from)
	return Vector2i(arr[0].get_string().to_int(),arr[1].get_string().to_int())
	pass
