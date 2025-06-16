extends Control

func populate_info(card_spec: CardSpecification) -> void:
    $ThreatValue.text = card_spec.fields['threat_rating']
