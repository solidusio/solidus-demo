# Exposes tour.yml for use in the demo tour
TOUR_TEXT = YAML.load_file(Rails.root.join("lib", "tour.yml"))
