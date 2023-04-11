@tool
extends EditorExportPlugin

const JS_FILE = "coi-serviceworker.min.js"

var plugin_path: String = get_script().resource_path.get_base_dir()
var exporting_web := false
var export_path := ""

func _get_name() -> String:
	return "CoiServiceWorker"

func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int) -> void:
	if features.has("web"):
		exporting_web = true
		export_path = path
	
func _export_end() -> void:
	if exporting_web:
		var html := FileAccess.get_file_as_string(export_path)
		var pos = html.find('<script src=')
		html = html.insert(pos, '<script src="' + JS_FILE + '"></script>')
		var file := FileAccess.open(export_path, FileAccess.WRITE)
		file.store_string(html)
		file.close()
		DirAccess.copy_absolute(plugin_path.path_join(JS_FILE), export_path.get_base_dir().path_join(JS_FILE))
	exporting_web = false

func _export_file(path: String, type: String, features: PackedStringArray) -> void:
	if path.begins_with(plugin_path):
		skip()
