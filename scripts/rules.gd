extends RefCounted

func sheet_label_ok(label: String) -> bool:
	return label.strip_edges() != ""

func lens_ready(current_marked: bool) -> bool:
	return current_marked

var sheet_marked := false
var zoom := 1.0

func mark_sheet_ready() -> void:
	sheet_marked = true

func zoom_ready(zoom_value: float) -> bool:
	return zoom_value > 0.0

func may_sheet() -> bool:
	return sheet_marked and zoom_ready(zoom)
