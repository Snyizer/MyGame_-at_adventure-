extends Control

var DText # Реплики
var dictionary # Кол реплика
var carriage = 0 # Текущая реплика
var hasBeenPressed = false  # Флаг для отслеживания нажатия



func _ready():
	#Отключение компонента
	set_process(false)
	visible = false



func _process(_delta):
	if !Input.is_action_pressed("ui_Space_+_RigреMouse"):
		hasBeenPressed = false  # Сброс флага, если кнопка больше не нажата
		return
	
	
	if !hasBeenPressed:
		hasBeenPressed = true
		carriage += 1
		
		if(carriage == dictionary):
			SignalBas.Block = true
			set_process(false)
			visible = false
		else:
			if(DText[carriage][0] == "@"):
				$Name_NinePatchRect/MarginContainer/Name.text = DText[carriage].substr(1, DText[0].length())
				carriage += 1 
			$Body_NinePatchRect/MarginContainer/Test.text = DText[carriage]
		
		

func TextOutput(text):
	SignalBas.Block = false
	DText = text
	dictionary = len(text) 
	carriage = 1
	
	#Включение компонента 
	set_process(true)
	visible = true
	
	$Name_NinePatchRect/MarginContainer/Name.text = text[0].substr(1, text[0].length()) 
	$Body_NinePatchRect/MarginContainer/Test.text = text[1] 
	
	
