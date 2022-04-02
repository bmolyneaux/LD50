extends ScrollContainer


func _on_news_changed(news) -> void:
	$VBoxContainer/Feed1.text = $VBoxContainer/Feed2.text
	$VBoxContainer/Feed2.text = news
	scroll_vertical = 0


func _ready() -> void:
	State.connect("news_changed", self, "_on_news_changed")
	

func _process(delta: float) -> void:
	scroll_vertical += 1

