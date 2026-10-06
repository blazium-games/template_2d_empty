extends AutoworkTest

const Rules = preload("res://scripts/rules.gd")

func test_sheet_label() -> void:
	var rules = Rules.new()
	assert_true(rules.sheet_label_ok("Opener"), "named sheet")
	assert_false(rules.sheet_label_ok(""), "blank label rejected")

func test_missing_lens() -> void:
	var rules = Rules.new()
	assert_false(rules.lens_ready(false), "missing camera rejected")
	assert_true(rules.lens_ready(true), "current camera accepted")

func test_sheet_gate() -> void:
	var rules = Rules.new()
	assert_false(rules.may_sheet(), "unmarked")
	rules.mark_sheet_ready()
	assert_true(rules.may_sheet(), "marked")
	assert_true(load("res://scenes/sheet.tscn") != null, "sheet loads")

func test_zoom_ready() -> void:
	var rules = Rules.new()
	assert_false(rules.zoom_ready(0.0), "zero zoom")
	assert_false(rules.zoom_ready(-1.0), "negative zoom")
	assert_true(rules.zoom_ready(1.0), "positive zoom")
	assert_true(load("res://scenes/sheet.tscn") != null, "sheet loads")
