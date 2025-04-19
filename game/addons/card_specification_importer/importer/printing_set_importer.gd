@tool
extends EditorImportPlugin

enum Presets {DEFAULT}

func _get_importer_name():
    return "printing_set_importer"

func _get_visible_name():
    return "Printing Set"

func _get_import_order() -> int:
    return -1000

## If we don't override this it won't realize it's a valid 
## importer for the recognized_extensions defined below.
func _get_priority() -> float:
    return 1000.0

func _get_recognized_extensions():
    return ["tsv"]

func _get_save_extension():
    return "tres"

func _get_resource_type():
    return "PrintingSpecification"

func _get_preset_count() -> int:
    return 1

func _get_preset_name(preset_index) -> String:
    var name = ""
    match preset_index:
        Presets.DEFAULT:
            name = "default"
        _:
            name = "unknown"
    return name

func _get_import_options(path, preset_index) -> Array:
    var import_options: Array = []
    return import_options

func _get_option_visibility(path, option_name, options) -> bool:
    return true

func _import(source_file, save_path, options, r_platform_variants, r_gen_files):
    var file = FileAccess.open(source_file, FileAccess.READ)
    if file == null:
        return FileAccess.get_open_error()
    
    var print_set = CardPrintingSet.new()

    const REQUIRED_HEADERS: Array[String] = ['supertype']
    var headers = _parse_and_validate_headers(file.get_line(), REQUIRED_HEADERS)

    while file.get_position() < file.get_length():
        var printing_spec = _parse_printing_spec(file.get_line(), headers)
        print_set.printing_specs.append(printing_spec)

    return ResourceSaver.save(print_set, "%s.%s" % [save_path, _get_save_extension()])


func _parse_and_validate_headers(header_line: String, required_headers: Array[String]) -> PackedStringArray:
    var column_headers = header_line.split("\t")
    var header_set = {}
    for header in column_headers:
        header_set[header] = null

    for required_header in required_headers:
        if not header_set.has(required_header):
            push_error("card_spec_importer.gd - header row missing required header %s" % required_header)
    
    return column_headers


func _parse_printing_spec(line: String, column_headers: PackedStringArray) -> PrintingSpecification:
    var card_fields: PackedStringArray = line.split("\t")

    var printing_spec = PrintingSpecification.new()
    var card_spec = CardSpecification.new()
    for i in card_fields.size():
        match column_headers[i]:
            'count':
                printing_spec.print_count = card_fields[i]
            'supertype':
                card_spec.supertype = card_fields[i]
            'format':
                printing_spec.format = card_fields[i]
            _:
                card_spec.fields[column_headers[i]] = card_fields[i]
    
    printing_spec.card_spec = card_spec
    return printing_spec
