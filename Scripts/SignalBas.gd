extends Node
#Весь текст на текущую локацию
var Test_file
#Блокировка движения персонажа (T - движ; F - не движ)
var Block


#Преоброзование JSON 
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		
		var datdFile = FileAccess.open(filePath,FileAccess.READ)
		var parsedResult = JSON.parse_string(datdFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error read file")
	else:
		print("Error exist")
