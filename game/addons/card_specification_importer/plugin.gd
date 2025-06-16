@tool
extends EditorPlugin

var printing_set_import_plugin

func _enter_tree():
	printing_set_import_plugin = preload("importer/printing_set_importer.gd").new()
	add_import_plugin(printing_set_import_plugin)

func _exit_tree():
	remove_import_plugin(printing_set_import_plugin)
	printing_set_import_plugin = null